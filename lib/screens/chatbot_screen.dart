import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  List<ChatMessage> _messages = [];
  List<Map<String, dynamic>> _conversationHistory = [];

  bool _isDetailedMode = true;

  // Voice features
  late FlutterTts _flutterTts;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _speechEnabled = false;
  bool _ttsEnabled = false;
  String _recognizedWords = '';

  static String get _geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  // Context management: Keep last 10 message pairs (20 messages) + initial message
  static const int _maxHistoryMessages = 20;

  // Use MediNavi colors
  final Color primaryGreen = const Color(0xFF2E7D32);
  final Color lightGreen = const Color(0xFF4CAF50);
  final Color veryLightGreen = const Color(0xFFE8F5E9);
  final Color accentGreen = const Color(0xFF66BB6A);
  final Color quickOrange = const Color(0xFFFF9800);
  final Color lightOrange = const Color(0xFFFFB74D);
  final Color successGreen = const Color(0xFF4CAF50);
  final Color warningRed = const Color(0xFFF44336);
  final Color infoYellow = const Color(0xFFFFC107);
  final Color lightRed = const Color(0xFFFFCDD2);
  final Color lightYellow = const Color(0xFFFFF9C4);

  String? _detectedDepartment;
  String? _lastRecommendedService;

  @override
  void initState() {
    super.initState();
    _initializeTTS();
    _initializeSpeech();
    _loadChatHistory(); // Load saved chat history
  }

  // NEW: Load chat history from storage
  Future<void> _loadChatHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesJson = prefs.getString('chatbot_messages');
      final conversationJson = prefs.getString('chatbot_conversation');
      final detailedMode = prefs.getBool('chatbot_detailed_mode') ?? true;

      setState(() {
        _isDetailedMode = detailedMode;
      });

      if (messagesJson != null && messagesJson.isNotEmpty) {
        final List<dynamic> messagesList = jsonDecode(messagesJson);
        setState(() {
          _messages = messagesList
              .map((json) => ChatMessage.fromJson(json))
              .toList();
        });
      } else {
        // If no saved messages, add welcome message
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final l10n = AppLocalizations.of(context)!;
          setState(() {
            _messages.add(
              ChatMessage(
                text: l10n.chatbotWelcome,
                isUser: false,
                timestamp: DateTime.now(),
              ),
            );
          });
          _saveChatHistory();
        });
      }

      if (conversationJson != null && conversationJson.isNotEmpty) {
        final List<dynamic> conversationList = jsonDecode(conversationJson);
        setState(() {
          _conversationHistory = List<Map<String, dynamic>>.from(
            conversationList,
          );
        });
      }

      print("Chat history loaded successfully");
    } catch (e) {
      print("Error loading chat history: $e");
      // Add welcome message if loading fails
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final l10n = AppLocalizations.of(context)!;
        setState(() {
          _messages.add(
            ChatMessage(
              text: l10n.chatbotWelcome,
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
        });
      });
    }
  }

  // NEW: Save chat history to storage
  Future<void> _saveChatHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Save messages
      final messagesJson = jsonEncode(
        _messages.map((msg) => msg.toJson()).toList(),
      );
      await prefs.setString('chatbot_messages', messagesJson);

      // Save conversation history
      final conversationJson = jsonEncode(_conversationHistory);
      await prefs.setString('chatbot_conversation', conversationJson);

      // Save mode
      await prefs.setBool('chatbot_detailed_mode', _isDetailedMode);

      print("Chat history saved successfully");
    } catch (e) {
      print("Error saving chat history: $e");
    }
  }

  // NEW: Clear chat history (start new conversation)
  Future<void> _startNewConversation() async {
    final l10n = AppLocalizations.of(context)!;

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.refresh_rounded, color: primaryGreen),
            const SizedBox(width: 12),
            const Text('Clear Chat'),
          ],
        ),
        content: const Text(
          'Start a new conversation? Current chat will be cleared.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _messages.clear();
        _conversationHistory.clear();
        _lastRecommendedService = null;
        _messages.add(
          ChatMessage(
            text: l10n.chatbotWelcome,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      });
      await _saveChatHistory();
      _scrollToBottom();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Chat cleared. Ready for new conversation!'),
          backgroundColor: successGreen,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _initializeTTS() async {
    try {
      _flutterTts = FlutterTts();
      _flutterTts.setErrorHandler((msg) => print("TTS Error: $msg"));
      _flutterTts.setCompletionHandler(() => print("TTS completed"));

      try {
        final locale = Localizations.localeOf(context);
        String languageCode;
        switch (locale.languageCode) {
          case 'ja':
            languageCode = "ja-JP";
            break;
          case 'zh':
            languageCode = "zh-CN";
            break;
          default:
            languageCode = "en-US";
        }
        await _flutterTts.setLanguage(languageCode);
      } catch (e) {
        print("Error setting language: $e");
      }

      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      print("TTS initialized successfully");
    } catch (e) {
      print("Error initializing TTS: $e");
      setState(() => _ttsEnabled = false);
    }
  }

  Future<void> _initializeSpeech() async {
    try {
      _speech = stt.SpeechToText();
      _speechEnabled = await _speech.initialize(
        onError: (error) => print('Speech error: $error'),
        onStatus: (status) {
          print('Speech status: $status');
          if (status == 'done' && _isListening) {
            _stopListening();
          }
        },
      );

      if (_speechEnabled) {
        print("Speech recognition initialized successfully");
      } else {
        print("Speech recognition not available");
      }
    } catch (e) {
      print("Error initializing speech recognition: $e");
      setState(() => _speechEnabled = false);
    }
  }

  Future<void> _speak(String text) async {
    if (!_ttsEnabled || text.isEmpty) return;

    try {
      String cleanText = text
          .replaceAll(
            RegExp(
              r'[🎯🏥📍✅❌💡⚠️📋📏🗺️✨🦷🩺👂👁️🔪👶🤰🧠🩹🦴💙🔊🎙️📳👆📞🚨]',
            ),
            '',
          )
          .replaceAll(RegExp(r'\*\*'), '')
          .replaceAll(RegExp(r'•'), ' ')
          .replaceAll('\n\n', '. ')
          .replaceAll('\n', '. ')
          .trim();

      if (cleanText.isNotEmpty) {
        await _flutterTts.speak(cleanText);
      }
    } catch (e) {
      print("Error speaking: $e");
    }
  }

  Future<void> _stopSpeaking() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      print("Error stopping speech: $e");
    }
  }

  Future<void> _startListening() async {
    if (!_speechEnabled) {
      final l10n = AppLocalizations.of(context)!;
      await _speak(l10n.speechNotAvailable);
      return;
    }

    try {
      var status = await Permission.microphone.request();

      if (status.isGranted) {
        await _stopSpeaking();

        setState(() {
          _isListening = true;
          _recognizedWords = '';
          _controller.clear();
        });

        HapticFeedback.mediumImpact();
        await Future.delayed(const Duration(milliseconds: 300));

        final locale = Localizations.localeOf(context);
        String localeId;
        switch (locale.languageCode) {
          case 'ja':
            localeId = 'ja_JP';
            break;
          case 'zh':
            localeId = 'zh_CN';
            break;
          default:
            localeId = 'en_US';
        }

        await _speech.listen(
          onResult: (result) {
            setState(() {
              _recognizedWords = result.recognizedWords;
              _controller.text = _recognizedWords;
            });
          },
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 3),
          partialResults: true,
          localeId: localeId,
          listenMode: stt.ListenMode.confirmation,
        );
      } else if (status.isDenied) {
        final l10n = AppLocalizations.of(context)!;
        await _speak(l10n.micPermissionRequired);
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } catch (e) {
      print("ERROR starting speech recognition: $e");
      setState(() => _isListening = false);
      final l10n = AppLocalizations.of(context)!;
      await _speak(l10n.voiceInputError);
    }
  }

  Future<void> _stopListening() async {
    try {
      await _speech.stop();
      setState(() => _isListening = false);
      HapticFeedback.lightImpact();

      if (_recognizedWords.trim().isNotEmpty) {
        final l10n = AppLocalizations.of(context)!;
        await _speak(l10n.processing);
        await Future.delayed(const Duration(milliseconds: 500));
        askGemini();
      }
    } catch (e) {
      print("Error stopping speech: $e");
      setState(() => _isListening = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    try {
      _flutterTts.stop();
    } catch (e) {
      print("Error stopping TTS in dispose: $e");
    }
    try {
      _speech.stop();
    } catch (e) {
      print("Error stopping speech in dispose: $e");
    }
    super.dispose();
  }

  String _getNextApiKey() {
    return _geminiApiKey;
  }

  // Trim conversation history to prevent context overflow
  void _trimConversationHistory() {
    if (_conversationHistory.length <= _maxHistoryMessages) {
      return; // No need to trim
    }

    // Keep the first message pair (initial symptom + response) if it exists
    List<Map<String, dynamic>> preserved = [];

    if (_conversationHistory.length >= 2) {
      // Preserve first user message and first AI response
      preserved.add(_conversationHistory[0]);
      preserved.add(_conversationHistory[1]);
    }

    // Get the most recent messages (excluding first pair)
    int keepRecent = _maxHistoryMessages - preserved.length;
    int startIndex = _conversationHistory.length - keepRecent;

    List<Map<String, dynamic>> recentMessages = _conversationHistory.sublist(
      startIndex,
    );

    // Combine preserved and recent messages
    _conversationHistory = [...preserved, ...recentMessages];
  }

  void _scrollToBottom() {
    // Don't auto-scroll, let user see messages from top
    return;
  }

  String? _detectMedicalDepartment(String text) {
    String lowerText = text.toLowerCase();

    // PRIORITY SYSTEM: Check MOST SPECIFIC first, MOST GENERAL last

    // Priority 1: Dentistry (HIGHEST - very specific)
    if (lowerText.contains('toothache') ||
        lowerText.contains('tooth ache') ||
        lowerText.contains('teeth') ||
        lowerText.contains('tooth') ||
        lowerText.contains('dental') ||
        lowerText.contains('dentist') ||
        lowerText.contains('gums') ||
        lowerText.contains('cavity') ||
        lowerText.contains('cavities') ||
        lowerText.contains('molar') ||
        lowerText.contains('wisdom tooth') ||
        lowerText.contains('root canal') ||
        lowerText.contains('filling') ||
        lowerText.contains('歯痛') ||
        lowerText.contains('歯科') ||
        lowerText.contains('虫歯') ||
        lowerText.contains('歯茎') ||
        lowerText.contains('牙痛') ||
        lowerText.contains('牙科') ||
        lowerText.contains('蛀牙') ||
        lowerText.contains('牙齿') ||
        (lowerText.contains('歯') && !lowerText.contains('皮膚'))) {
      return 'Dentistry';
    }

    // Priority 2: HEADACHE & MIGRAINE
    if (lowerText.contains('headache') ||
        lowerText.contains('head ache') ||
        lowerText.contains('migraine') ||
        lowerText.contains('head pain') ||
        lowerText.contains('頭痛') ||
        lowerText.contains('頭が痛') ||
        lowerText.contains('片頭痛') ||
        lowerText.contains('头痛') ||
        lowerText.contains('偏头痛')) {
      return 'General Medicine';
    }

    // Priority 3: Orthopedics
    if (lowerText.contains('bone') ||
        lowerText.contains('joint') ||
        lowerText.contains('back pain') ||
        lowerText.contains('fracture') ||
        lowerText.contains('sprain') ||
        lowerText.contains('orthopedic') ||
        lowerText.contains('骨') ||
        lowerText.contains('関節') ||
        lowerText.contains('腰痛') ||
        lowerText.contains('骨折') ||
        lowerText.contains('捻挫') ||
        lowerText.contains('整形外科') ||
        lowerText.contains('骨头') ||
        lowerText.contains('关节') ||
        lowerText.contains('扭伤') ||
        lowerText.contains('骨科')) {
      return 'Orthopedics';
    }

    // Priority 4: Dermatology
    if (lowerText.contains('skin') ||
        lowerText.contains('rash') ||
        lowerText.contains('itch') ||
        lowerText.contains('acne') ||
        lowerText.contains('pimple') ||
        lowerText.contains('dermatology') ||
        lowerText.contains('eczema') ||
        lowerText.contains('皮膚') ||
        lowerText.contains('湿疹') ||
        lowerText.contains('かゆみ') ||
        lowerText.contains('ニキビ') ||
        lowerText.contains('皮膚科') ||
        lowerText.contains('皮肤') ||
        lowerText.contains('痒') ||
        lowerText.contains('痘痘') ||
        lowerText.contains('皮肤科')) {
      return 'Dermatology';
    }

    // Priority 5: Ophthalmology
    if (lowerText.contains('eye') ||
        lowerText.contains('vision') ||
        lowerText.contains('sight') ||
        lowerText.contains('ophthalmology') ||
        lowerText.contains('blurry') ||
        lowerText.contains('eye pain') ||
        lowerText.contains('目の') ||
        lowerText.contains('視力') ||
        lowerText.contains('目が') ||
        lowerText.contains('眼科') ||
        lowerText.contains('眼睛') ||
        lowerText.contains('视力') ||
        lowerText.contains('模糊')) {
      return 'Ophthalmology';
    }

    // Priority 6: ENT - Not in medical_services_data.dart, map to General Medicine
    if (lowerText.contains('ear') ||
        lowerText.contains('nose') ||
        lowerText.contains('throat') ||
        lowerText.contains('sinus') ||
        lowerText.contains('ent') ||
        lowerText.contains('耳') ||
        lowerText.contains('鼻') ||
        lowerText.contains('喉') ||
        lowerText.contains('耳鼻咽喉科') ||
        lowerText.contains('耳朵') ||
        lowerText.contains('鼻子') ||
        lowerText.contains('喉咙') ||
        lowerText.contains('耳鼻喉科')) {
      return 'General Medicine';
    }

    // Priority 7: Surgery - Map to General Surgery
    if (lowerText.contains('cut') ||
        lowerText.contains('wound') ||
        lowerText.contains('injury') ||
        lowerText.contains('bleeding') ||
        lowerText.contains('surgery') ||
        lowerText.contains('trauma') ||
        lowerText.contains('切り傷') ||
        lowerText.contains('怪我') ||
        lowerText.contains('外傷') ||
        lowerText.contains('出血') ||
        lowerText.contains('外科') ||
        lowerText.contains('伤口') ||
        lowerText.contains('受伤') ||
        lowerText.contains('手术')) {
      return 'General Surgery';
    }

    // Priority 8: Pediatrics
    if (lowerText.contains('child') ||
        lowerText.contains('baby') ||
        lowerText.contains('pediatric') ||
        lowerText.contains('infant') ||
        lowerText.contains('kid') ||
        lowerText.contains('子供') ||
        lowerText.contains('赤ちゃん') ||
        lowerText.contains('小児科') ||
        lowerText.contains('孩子') ||
        lowerText.contains('婴儿') ||
        lowerText.contains('儿童') ||
        lowerText.contains('小儿科')) {
      return 'Pediatrics';
    }

    // Priority 9: OB/GYN
    if (lowerText.contains('pregnancy') ||
        lowerText.contains('pregnant') ||
        lowerText.contains('gynecology') ||
        lowerText.contains('obstetrics') ||
        lowerText.contains('妊娠') ||
        lowerText.contains('産婦人科') ||
        lowerText.contains('怀孕') ||
        lowerText.contains('妇科') ||
        lowerText.contains('产科')) {
      return 'Obstetrics and Gynecology';
    }

    // Priority 10: Psychiatry
    if (lowerText.contains('mental') ||
        lowerText.contains('depression') ||
        lowerText.contains('anxiety') ||
        lowerText.contains('stress') ||
        lowerText.contains('psychiatry') ||
        lowerText.contains('psychology') ||
        lowerText.contains('うつ') ||
        lowerText.contains('不安') ||
        lowerText.contains('精神科') ||
        lowerText.contains('心療内科') ||
        lowerText.contains('精神') ||
        lowerText.contains('抑郁') ||
        lowerText.contains('焦虑') ||
        lowerText.contains('心理') ||
        lowerText.contains('心理科')) {
      return 'Psychiatry';
    }

    // Priority 11: Internal Medicine (LAST - most general)
    if (lowerText.contains('fever') ||
        lowerText.contains('cold') ||
        lowerText.contains('flu') ||
        lowerText.contains('cough') ||
        lowerText.contains('fatigue') ||
        lowerText.contains('tired') ||
        lowerText.contains('stomach') ||
        lowerText.contains('nausea') ||
        lowerText.contains('diarrhea') ||
        lowerText.contains('vomiting') ||
        lowerText.contains('dizzy') ||
        lowerText.contains('dizziness') ||
        lowerText.contains('chest pain') ||
        lowerText.contains('internal medicine') ||
        lowerText.contains('熱') ||
        lowerText.contains('風邪') ||
        lowerText.contains('咳') ||
        lowerText.contains('疲労') ||
        lowerText.contains('腹痛') ||
        lowerText.contains('吐き気') ||
        lowerText.contains('下痢') ||
        lowerText.contains('めまい') ||
        lowerText.contains('内科') ||
        lowerText.contains('发烧') ||
        lowerText.contains('感冒') ||
        lowerText.contains('咳嗽') ||
        lowerText.contains('疲劳') ||
        lowerText.contains('胃痛') ||
        lowerText.contains('恶心') ||
        lowerText.contains('腹泻') ||
        lowerText.contains('头晕')) {
      return 'General Medicine';
    }

    return null;
  }

  String _getSystemInstruction() {
    final locale = Localizations.localeOf(context);
    String languageInstruction;
    String emergencySection;

    switch (locale.languageCode) {
      case 'ja':
        languageInstruction = "Respond in Japanese (日本語で返答してください).";
        emergencySection = '''

🚨 **緊急連絡先** (常に表示)
- 救急車・消防: 119
- 警察: 110
- いのちの電話: 0570-783-556
- よりそいホットライン: 0120-279-338''';
        break;
      case 'zh':
        languageInstruction = "Respond in Simplified Chinese (用简体中文回答).";
        emergencySection = '''

🚨 **紧急联系方式** (始终显示)
- 急救/消防: 119
- 警察: 110
- 生命热线: 0570-783-556
- 支援热线: 0120-279-338''';
        break;
      default:
        languageInstruction = "Respond in English.";
        emergencySection = '''

🚨 **Emergency Contacts** (Always Available)
- Ambulance/Fire: 119
- Police: 110
- Inochi no Denwa (Life Line): 0570-783-556
- Yorisoi Hotline: 0120-279-338''';
    }

    if (_isDetailedMode) {
      return '''You are a compassionate and knowledgeable medical assistant chatbot.

$languageInstruction

CRITICAL: You MUST include the emergency contacts section at the END of EVERY response.

IMPORTANT FORMATTING RULES:
- Use section headers with emojis for visual clarity
- Start each major section on a new line with a header
- Use bullet points (•) for lists
- Add line breaks between sections for readability

Your communication style:
- Start with empathy
- Use clear, structured formatting with visual sections
- Be thorough but organized
- Always maintain a supportive tone

Response Structure:
When users describe symptoms, provide responses in this EXACT format:

💙 **Understanding Your Concern**
[1-2 sentences acknowledging their concern]

✅ **Possible Common Causes**
- [Cause 1]
- [Cause 2]
- [Cause 3]
- [Cause 4]

💡 **What You Can Try Now**
- [Self-care tip 1]
- [Self-care tip 2]
- [Self-care tip 3]
- [Self-care tip 4]
- [Self-care tip 5]

⚠️ **Seek Medical Help If You Have:**
- [Warning sign 1]
- [Warning sign 2]
- [Warning sign 3]
- [Warning sign 4]

❓ **Questions to Consider**
- [Question 1]
- [Question 2]
- [Question 3]

🏥 **Recommended Department**
[Department name with brief explanation]

$emergencySection

⚕️ This is not a diagnosis. Please consult a doctor.

Available departments:
- General Medicine - general illness, fever, fatigue
- General Surgery - injuries, wounds
- Orthopedics - bone/joint issues
- Dermatology - skin problems
- Ophthalmology - eye issues
- Pediatrics - children
- Obstetrics and Gynecology - women's health
- Psychiatry - mental health
- Cardiology - heart issues
- Neurology - neurological issues
- Urology - urinary system issues''';
    } else {
      return '''You are a quick-response medical assistant chatbot.

$languageInstruction

CRITICAL: You MUST include the emergency contacts section at the END of EVERY response.

IMPORTANT: Use emojis and clear formatting even in quick mode.

Response Format (Quick Mode):
💙 [Brief empathetic acknowledgment]

💡 [Quick self-care tip]

🏥 [Recommended department]

⚠️ [One critical warning sign if needed]

$emergencySection

⚕️ This is not a diagnosis. Please consult a doctor.

Keep total response under 150 words but ALWAYS include emergency contacts.''';
    }
  }

  Future<void> askGemini() async {
    if (_controller.text.trim().isEmpty) return;

    String userMessage = _controller.text;
    _controller.clear();
    _recognizedWords = '';

    setState(() {
      _messages.add(
        ChatMessage(text: userMessage, isUser: true, timestamp: DateTime.now()),
      );
      _isLoading = true;
    });

    final l10n = AppLocalizations.of(context)!;
    await _speak(l10n.thinking);
    _scrollToBottom();

    // Detect department from user message
    _detectedDepartment = _detectMedicalDepartment(userMessage);

    // Add user message to conversation history
    _conversationHistory.add({
      "role": "user",
      "parts": [
        {"text": userMessage},
      ],
    });

    int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        String apiKey = _getNextApiKey();

        final response = await http.post(
          Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
          ),
          headers: {
            'Content-Type': 'application/json',
            "x-goog-api-key": apiKey,
          },
          body: jsonEncode({
            "contents": _conversationHistory,
            "systemInstruction": {
              "parts": [
                {"text": _getSystemInstruction()},
              ],
            },
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          String aiResponse =
              data['candidates'][0]['content']['parts'][0]['text'];

          _conversationHistory.add({
            "role": "model",
            "parts": [
              {"text": aiResponse},
            ],
          });

          // Automatically trim history to prevent overflow
          _trimConversationHistory();

          setState(() {
            _messages.add(
              ChatMessage(
                text: aiResponse,
                isUser: false,
                timestamp: DateTime.now(),
                recommendedDepartment: _detectedDepartment,
              ),
            );
            _isLoading = false;
            _lastRecommendedService = _detectedDepartment;
          });

          // Save chat history after receiving response
          await _saveChatHistory();

          _scrollToBottom();
          await _speak(aiResponse);
          return;
        } else if (response.statusCode == 429 || response.statusCode == 503) {
          retryCount++;
          if (retryCount < maxRetries) {
            await Future.delayed(Duration(seconds: 2 * retryCount));
          } else {
            setState(() {
              _messages.add(
                ChatMessage(
                  text: l10n.overloaded,
                  isUser: false,
                  timestamp: DateTime.now(),
                ),
              );
              _isLoading = false;
            });
            await _saveChatHistory();
            _scrollToBottom();
            return;
          }
        } else {
          setState(() {
            _messages.add(
              ChatMessage(
                text: l10n.errorOccurred,
                isUser: false,
                timestamp: DateTime.now(),
              ),
            );
            _isLoading = false;
          });
          await _saveChatHistory();
          _scrollToBottom();
          return;
        }
      } catch (e) {
        setState(() {
          _messages.add(
            ChatMessage(
              text: l10n.networkError,
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
          _isLoading = false;
        });
        await _saveChatHistory();
        _scrollToBottom();
        return;
      }
    }
  }

  void _showSettingsBottomSheet() {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.settings,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '💬 ${l10n.responseType}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildModeCard(
                    icon: Icons.bolt_rounded,
                    title: l10n.quickMode,
                    subtitle: l10n.quickModeDesc,
                    isSelected: !_isDetailedMode,
                    color: quickOrange,
                    onTap: () {
                      setModalState(() => _isDetailedMode = false);
                      setState(() {
                        _isDetailedMode = false;
                        _conversationHistory.clear();
                        _messages.add(
                          ChatMessage(
                            text: l10n.quickModeActivated,
                            isUser: false,
                            timestamp: DateTime.now(),
                          ),
                        );
                      });
                      _saveChatHistory();
                      _scrollToBottom();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildModeCard(
                    icon: Icons.description_rounded,
                    title: l10n.detailedMode,
                    subtitle: l10n.detailedModeDesc,
                    isSelected: _isDetailedMode,
                    color: primaryGreen,
                    onTap: () {
                      setModalState(() => _isDetailedMode = true);
                      setState(() {
                        _isDetailedMode = true;
                        _conversationHistory.clear();
                        _messages.add(
                          ChatMessage(
                            text: l10n.detailedModeActivated,
                            isUser: false,
                            timestamp: DateTime.now(),
                          ),
                        );
                      });
                      _saveChatHistory();
                      _scrollToBottom();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildModeCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? color : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        Icon(Icons.check_circle, color: color, size: 20),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _findNearbyFacilities() {
    if (_lastRecommendedService == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.noDepartmentDetected),
          backgroundColor: warningRed,
        ),
      );
      return;
    }

    Navigator.pop(context, _lastRecommendedService);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryGreen,
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.medical_services_rounded,
                color: primaryGreen,
                size: 26,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.medicalAssistant,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _isDetailedMode ? l10n.detailed : l10n.quick,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Clear Chat Button (History trimming happens automatically)
          IconButton(
            icon: const Icon(Icons.delete_sweep_rounded, size: 26),
            color: Colors.white,
            tooltip: 'Clear Chat',
            onPressed: _startNewConversation,
          ),
          IconButton(
            icon: const Icon(Icons.tune_rounded, size: 28),
            color: Colors.white,
            onPressed: _showSettingsBottomSheet,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [veryLightGreen, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ColorfulChatBubble(
                    message: message,
                    primaryColor: primaryGreen,
                    lightColor: lightGreen,
                    successGreen: successGreen,
                    warningRed: warningRed,
                    infoYellow: infoYellow,
                    lightRed: lightRed,
                    lightYellow: lightYellow,
                    onFindFacilities: message.recommendedDepartment != null
                        ? _findNearbyFacilities
                        : null,
                  );
                },
              ),
            ),
            if (_isLoading)
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(primaryGreen),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      l10n.thinking,
                      style: TextStyle(
                        fontSize: 17,
                        color: primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Microphone Button
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isListening
                            ? [Colors.red, Colors.redAccent]
                            : [
                                const Color(0xFFff6b6b),
                                const Color(0xFFee5a6f),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color:
                              (_isListening
                                      ? Colors.red
                                      : const Color(0xFFff6b6b))
                                  .withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: _isListening
                          ? _stopListening
                          : _startListening,
                      icon: Icon(
                        _isListening ? Icons.stop : Icons.mic,
                        color: Colors.white,
                        size: 28,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: veryLightGreen,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: primaryGreen.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: _isListening
                              ? l10n.listening
                              : l10n.typeOrSpeak,
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade500,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        onSubmitted: (_) => askGemini(),
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryGreen, lightGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primaryGreen.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: _isLoading ? null : askGemini,
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UPDATED ChatMessage class with JSON serialization
class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? recommendedDepartment;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.recommendedDepartment,
  });

  // Convert ChatMessage to JSON
  Map<String, dynamic> toJson() => {
    'text': text,
    'isUser': isUser,
    'timestamp': timestamp.toIso8601String(),
    'recommendedDepartment': recommendedDepartment,
  };

  // Create ChatMessage from JSON
  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    text: json['text'] as String,
    isUser: json['isUser'] as bool,
    timestamp: DateTime.parse(json['timestamp'] as String),
    recommendedDepartment: json['recommendedDepartment'] as String?,
  );
}

class ColorfulChatBubble extends StatelessWidget {
  final ChatMessage message;
  final Color primaryColor;
  final Color lightColor;
  final Color successGreen;
  final Color warningRed;
  final Color infoYellow;
  final Color lightRed;
  final Color lightYellow;
  final VoidCallback? onFindFacilities;

  const ColorfulChatBubble({
    super.key,
    required this.message,
    required this.primaryColor,
    required this.lightColor,
    required this.successGreen,
    required this.warningRed,
    required this.infoYellow,
    required this.lightRed,
    required this.lightYellow,
    this.onFindFacilities,
  });

  // Method to detect and make phone numbers clickable
  List<TextSpan> _buildClickablePhoneNumbers(
    String text,
    BuildContext context,
  ) {
    // Phone number patterns for Japan, International, and common formats
    final phoneRegex = RegExp(
      r'(\+?\d{1,4}[-.\s]?)?(\(?\d{1,4}\)?[-.\s]?)?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}',
    );

    List<TextSpan> spans = [];
    int lastIndex = 0;

    for (final match in phoneRegex.allMatches(text)) {
      // Add text before phone number
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: text.substring(lastIndex, match.start),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        );
      }

      // Add clickable phone number
      final phoneNumber = match.group(0)!;
      spans.add(
        TextSpan(
          text: phoneNumber,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF1976D2),
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
            height: 1.6,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => _makePhoneCall(phoneNumber, context),
        ),
      );

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.6,
          ),
        ),
      );
    }

    return spans;
  }

  // Method to make phone call
  Future<void> _makePhoneCall(String phoneNumber, BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    // Clean phone number (remove spaces, dashes, parentheses)
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[-.\s()]'), '');

    final Uri phoneUri = Uri(scheme: 'tel', path: cleanNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.cannotOpenPhoneDialer),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.cannotOpenPhoneDialer}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildFormattedText(String text, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    List<Widget> widgets = [];
    List<String> lines = text.split('\n');

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];

      if (line.trim().isEmpty) {
        widgets.add(const SizedBox(height: 8));
        continue;
      }

      if (line.contains('**') || line.startsWith('#')) {
        String cleanLine = line.replaceAll('**', '').replaceAll('#', '').trim();
        Color headerColor = primaryColor;
        Color bgColor = lightColor.withOpacity(0.1);
        IconData? icon;

        if (line.contains('💙') || line.contains('Understanding')) {
          headerColor = primaryColor;
          icon = Icons.favorite;
        } else if (line.contains('✅') ||
            line.contains('Possible') ||
            line.contains('Common')) {
          headerColor = successGreen;
          bgColor = const Color(0xFFc8e6c9).withOpacity(0.3);
          icon = Icons.check_circle;
        } else if (line.contains('💡') ||
            line.contains('Try') ||
            line.contains('What You Can')) {
          headerColor = infoYellow;
          bgColor = const Color(0xFFfff9c4).withOpacity(0.4);
          icon = Icons.lightbulb;
        } else if (line.contains('⚠️') ||
            line.contains('Seek') ||
            line.contains('Warning')) {
          headerColor = warningRed;
          bgColor = lightRed.withOpacity(0.3);
          icon = Icons.warning;
        } else if (line.contains('❓') || line.contains('Question')) {
          headerColor = const Color(0xFF9c27b0);
          bgColor = const Color(0xFFe1bee7).withOpacity(0.3);
          icon = Icons.help;
        } else if (line.contains('🏥') ||
            line.contains('Hospital') ||
            line.contains('Department')) {
          headerColor = const Color(0xFF00897b);
          bgColor = const Color(0xFFb2dfdb).withOpacity(0.3);
          icon = Icons.local_hospital;
        } else if (line.contains('🚨') ||
            line.contains('Emergency') ||
            line.contains('緊急') ||
            line.contains('紧急')) {
          headerColor = warningRed;
          bgColor = lightRed.withOpacity(0.4);
          icon = Icons.emergency;
        } else if (line.contains('📞') ||
            line.contains('Phone') ||
            line.contains('電話') ||
            line.contains('Hotline') ||
            line.contains('Contact')) {
          headerColor = const Color(0xFF1976D2);
          bgColor = const Color(0xFFBBDEFB).withOpacity(0.3);
          icon = Icons.phone;
        }

        widgets.add(
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: headerColor.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: headerColor, size: 20),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: _buildClickablePhoneNumbers(cleanLine, context),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: headerColor,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (line.trim().startsWith('•') || line.trim().startsWith('-')) {
        String cleanLine = line.replaceAll('•', '').replaceAll('-', '').trim();
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, right: 12),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: _buildClickablePhoneNumbers(cleanLine, context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (line.toLowerCase().contains('ambulance') ||
          line.toLowerCase().contains('police') ||
          line.contains('119') ||
          line.contains('110') ||
          line.contains('救急') ||
          line.contains('警察') ||
          line.contains('急救')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                children: _buildClickablePhoneNumbers(line.trim(), context),
              ),
            ),
          ),
        );
      } else if (line.contains('⚕️') ||
          line.toLowerCase().contains('not a diagnosis')) {
        widgets.add(
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.grey.shade700, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    line.trim(),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                children: _buildClickablePhoneNumbers(line.trim(), context),
              ),
            ),
          ),
        );
      }
    }

    if (onFindFacilities != null) {
      widgets.add(
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: onFindFacilities,
            icon: const Icon(Icons.location_on),
            label: Text(l10n.findNearbyFacilities),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [primaryColor, lightColor]),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.medical_services_rounded,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: message.isUser
                    ? LinearGradient(colors: [primaryColor, lightColor])
                    : null,
                color: message.isUser ? null : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: message.isUser
                      ? Colors.transparent
                      : Colors.grey.shade200,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        message.isUser ? l10n.you : l10n.assistant,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: message.isUser
                              ? Colors.white.withOpacity(0.9)
                              : primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _formatTime(message.timestamp),
                        style: TextStyle(
                          fontSize: 12,
                          color: message.isUser
                              ? Colors.white.withOpacity(0.7)
                              : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  message.isUser
                      ? Text(
                          message.text,
                          style: const TextStyle(
                            fontSize: 17,
                            height: 1.6,
                            color: Colors.white,
                          ),
                        )
                      : _buildFormattedText(message.text, context),
                ],
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 12),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1e88e5), Color(0xFF1565c0)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1e88e5).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person_rounded,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

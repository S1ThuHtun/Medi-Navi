// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get getStarted => 'Get Started';

  @override
  String get chooseLanguage => 'Choose the Language';

  @override
  String get selectedLanguage => 'English is selected';

  @override
  String get login => 'Login';

  @override
  String loginAs(Object email) {
    return 'Logged in as $email';
  }

  @override
  String signedUpAs(Object email) {
    return 'Singed up as $email';
  }

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get invalidEmail => 'Invalid email format';

  @override
  String get enteredPasswordMessage => 'Enter Password';

  @override
  String get enteredPasswordErrorMessage =>
      'Password must have at least 6 characters';

  @override
  String get confirmPasswordMessage => 'Confirm Password';

  @override
  String get confirmPasswordErrorMessage =>
      'Password and Confirm Password are not matched';

  @override
  String get logOut => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get signUp => 'SignUp';

  @override
  String get newSignUp => 'Don\'t have an account? SignUp';

  @override
  String get oldLogin => 'Already have an account! Login';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get history => 'History';

  @override
  String get medicalServices => 'Medical Services';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';

  @override
  String foundNearby(int count) {
    return 'Found $count nearby';
  }

  @override
  String get within5km => 'Within 5km';

  @override
  String kmAway(String distance) {
    return '$distance km away';
  }

  @override
  String get open => 'Open';

  @override
  String get closed => 'Closed';

  @override
  String get viewOnMap => 'View on Map';

  @override
  String get call => 'Call';

  @override
  String get directions => 'Directions';

  @override
  String get address => 'Address';

  @override
  String get openNow => 'Open Now';

  @override
  String away(Object distance) {
    return '$distance km away';
  }

  @override
  String get getDirections => 'Get Directions';

  @override
  String get updateRoute => 'Update Route';

  @override
  String get visitWebsite => 'Visit Website';

  @override
  String get wheelchairAccessible => 'Wheelchair accessible';

  @override
  String get limitedWheelchairAccess => 'Limited wheelchair access';

  @override
  String get openInGoogleMaps => 'Open in Google Maps';

  @override
  String get noPhoneAvailable => 'No phone number available for this service';

  @override
  String get invalidPhoneFormat => 'Invalid phone number format';

  @override
  String get cannotOpenPhoneDialer => 'Cannot open phone dialer';

  @override
  String get errorOpeningMaps => 'Unable to open Google Maps';

  @override
  String get categoryGeneralServices => 'General Services';

  @override
  String get categorySpecializedServices => 'Specialized Services';

  @override
  String get categorySurgicalServices => 'Surgical Services';

  @override
  String get categoryRehabilitationServices => 'Rehabilitation Services';

  @override
  String get categoryDiagnosticServices => 'Diagnostic Services';

  @override
  String get categoryEmergencyServices => 'Emergency Services';

  @override
  String get categoryMaternityWomensHealth => 'Maternity & Women\'s Health';

  @override
  String get categoryPharmacyServices => 'Pharmacy Services';

  @override
  String get categoryMentalHealthServices => 'Mental Health Services';

  @override
  String get categoryAlternativeMedicine => 'Alternative Medicine';

  @override
  String get serviceGeneralMedicine => 'General Medicine';

  @override
  String get serviceEmergencyCare => 'Emergency Care';

  @override
  String get serviceFamilyMedicine => 'Family Medicine';

  @override
  String get servicePreventativeMedicine => 'Preventative Medicine';

  @override
  String get serviceHealthCheckups => 'Health Check-ups';

  @override
  String get serviceUrgentCare => 'Urgent Care';

  @override
  String get serviceCardiology => 'Cardiology';

  @override
  String get serviceDermatology => 'Dermatology';

  @override
  String get serviceEndocrinology => 'Endocrinology';

  @override
  String get serviceGastroenterology => 'Gastroenterology';

  @override
  String get serviceHematology => 'Hematology';

  @override
  String get serviceNephrology => 'Nephrology';

  @override
  String get serviceNeurology => 'Neurology';

  @override
  String get serviceObstetricsGynecology => 'Obstetrics and Gynecology';

  @override
  String get serviceOphthalmology => 'Ophthalmology';

  @override
  String get serviceOrthopedics => 'Orthopedics';

  @override
  String get servicePediatrics => 'Pediatrics';

  @override
  String get servicePsychiatry => 'Psychiatry';

  @override
  String get serviceRheumatology => 'Rheumatology';

  @override
  String get servicePulmonology => 'Pulmonology';

  @override
  String get serviceUrology => 'Urology';

  @override
  String get serviceGeneralSurgery => 'General Surgery';

  @override
  String get serviceCardiacSurgery => 'Cardiac Surgery';

  @override
  String get serviceOrthopedicSurgery => 'Orthopedic Surgery';

  @override
  String get serviceNeurosurgery => 'Neurosurgery';

  @override
  String get servicePlasticSurgery => 'Plastic Surgery';

  @override
  String get servicePediatricSurgery => 'Pediatric Surgery';

  @override
  String get serviceObstetricSurgery => 'Obstetric Surgery';

  @override
  String get serviceTraumaSurgery => 'Trauma Surgery';

  @override
  String get servicePhysicalTherapy => 'Physical Therapy';

  @override
  String get serviceOccupationalTherapy => 'Occupational Therapy';

  @override
  String get serviceSpeechTherapy => 'Speech Therapy';

  @override
  String get serviceCardiacRehabilitation => 'Cardiac Rehabilitation';

  @override
  String get serviceNeurologicalRehabilitation => 'Neurological Rehabilitation';

  @override
  String get serviceLaboratoryTests => 'Laboratory Tests';

  @override
  String get serviceRadiology => 'Radiology';

  @override
  String get servicePathology => 'Pathology';

  @override
  String get serviceEndoscopy => 'Endoscopy';

  @override
  String get serviceECG => 'ECG';

  @override
  String get serviceEEG => 'EEG';

  @override
  String get serviceEmergencyRoom => 'Emergency Room (ER)';

  @override
  String get serviceTraumaCare => 'Trauma Care';

  @override
  String get serviceICU => 'Intensive Care Unit (ICU)';

  @override
  String get serviceBurnUnit => 'Burn Unit';

  @override
  String get serviceObstetrics => 'Obstetrics';

  @override
  String get serviceGynecology => 'Gynecology';

  @override
  String get serviceFamilyPlanning => 'Family Planning';

  @override
  String get serviceBreastHealth => 'Breast Health';

  @override
  String get servicePrescriptionMedications => 'Prescription Medications';

  @override
  String get serviceOTCMedications => 'Over-the-Counter Medications';

  @override
  String get serviceVaccinations => 'Vaccinations';

  @override
  String get servicePharmaceuticalConsultations =>
      'Pharmaceutical Consultations';

  @override
  String get serviceCompoundingPharmacy => 'Compounding Pharmacy';

  @override
  String get serviceHerbalMedicine => 'Herbal Medicine';

  @override
  String get serviceCounseling => 'Counseling';

  @override
  String get servicePsychotherapy => 'Psychotherapy';

  @override
  String get serviceAddictionTreatment => 'Addiction Treatment';

  @override
  String get serviceSupportGroups => 'Support Groups';

  @override
  String get serviceBehavioralTherapy => 'Behavioral Therapy';

  @override
  String get serviceAcupuncture => 'Acupuncture';

  @override
  String get serviceChiropracticCare => 'Chiropractic Care';

  @override
  String get serviceMassageTherapy => 'Massage Therapy';

  @override
  String get serviceNaturopathy => 'Naturopathy';

  @override
  String get serviceHomeopathy => 'Homeopathy';

  @override
  String get selectPrefecture => 'Select Prefecture';

  @override
  String get selectCity => 'Select City';

  @override
  String get selectWard => 'Select Ward';

  @override
  String get useCurrentLocation => 'Use Current Location';

  @override
  String get prefectures => 'Prefectures';

  @override
  String get citiesDistricts => 'Cities / Districts';

  @override
  String get wardsAreas => 'Wards / Areas';

  @override
  String allOf(String location) {
    return 'All of $location';
  }

  @override
  String get searchEntirePrefecture => 'Search entire prefecture';

  @override
  String get searchEntireCity => 'Search entire city';

  @override
  String get locationError =>
      'Unable to get location. Please enable location services and grant permission.';

  @override
  String get selectLocationError =>
      'Please select a location or enable location services.';

  @override
  String get noServicesFound => 'No services found';

  @override
  String get tryDifferentLocation =>
      'Try searching in a different location or service type.';

  @override
  String get retry => 'Retry';

  @override
  String get gettingLocation => 'Getting your location...';

  @override
  String get locationNotAvailable => 'Location not available';

  @override
  String get pullDownToRefresh =>
      'Pull down to refresh or select a location to find nearby medical services';

  @override
  String get prefectureTokyo => 'Tokyo';

  @override
  String get prefectureOsaka => 'Osaka';

  @override
  String get prefectureKyoto => 'Kyoto';

  @override
  String get prefectureHokkaido => 'Hokkaido';

  @override
  String get prefectureFukuoka => 'Fukuoka';

  @override
  String get prefectureYokohama => 'Yokohama';

  @override
  String get prefectureNagoya => 'Nagoya';

  @override
  String get prefectureKobe => 'Kobe';

  @override
  String get prefectureHiroshima => 'Hiroshima';

  @override
  String get prefectureSendai => 'Sendai';

  @override
  String get prefectureChiba => 'Chiba';

  @override
  String get prefectureKanagawa => 'Kanagawa';

  @override
  String get prefectureSaitama => 'Saitama';

  @override
  String get prefectureShizuoka => 'Shizuoka';

  @override
  String get prefectureAichi => 'Aichi';

  @override
  String get prefectureHyogo => 'Hyogo';

  @override
  String get prefectureNiigata => 'Niigata';

  @override
  String get prefectureMiyagi => 'Miyagi';

  @override
  String get prefectureNagano => 'Nagano';

  @override
  String get prefectureGifu => 'Gifu';

  @override
  String get prefectureGunma => 'Gunma';

  @override
  String get prefectureTochigi => 'Tochigi';

  @override
  String get prefectureIbaraki => 'Ibaraki';

  @override
  String get prefectureOkayama => 'Okayama';

  @override
  String get prefectureKumamoto => 'Kumamoto';

  @override
  String get prefectureKagoshima => 'Kagoshima';

  @override
  String get prefectureOkinawa => 'Okinawa';

  @override
  String get prefectureNara => 'Nara';

  @override
  String get prefectureShiga => 'Shiga';

  @override
  String get prefectureMie => 'Mie';

  @override
  String get prefectureWakayama => 'Wakayama';

  @override
  String get prefectureYamaguchi => 'Yamaguchi';

  @override
  String get prefectureEhime => 'Ehime';

  @override
  String get prefectureKagawa => 'Kagawa';

  @override
  String get prefectureTokushima => 'Tokushima';

  @override
  String get prefectureKochi => 'Kochi';

  @override
  String get prefectureFukushima => 'Fukushima';

  @override
  String get prefectureYamagata => 'Yamagata';

  @override
  String get prefectureIwate => 'Iwate';

  @override
  String get prefectureAkita => 'Akita';

  @override
  String get prefectureAomori => 'Aomori';

  @override
  String get prefectureIshikawa => 'Ishikawa';

  @override
  String get prefectureFukui => 'Fukui';

  @override
  String get prefectureToyama => 'Toyama';

  @override
  String get prefectureYamanashi => 'Yamanashi';

  @override
  String get prefectureSaga => 'Saga';

  @override
  String get prefectureNagasaki => 'Nagasaki';

  @override
  String get prefectureOita => 'Oita';

  @override
  String get prefectureMiyazaki => 'Miyazaki';

  @override
  String get cityShibuya => 'Shibuya';

  @override
  String get cityShinjuku => 'Shinjuku';

  @override
  String get cityChiyoda => 'Chiyoda';

  @override
  String get cityMinato => 'Minato';

  @override
  String get citySetagaya => 'Setagaya';

  @override
  String get cityKita => 'Kita';

  @override
  String get cityChuo => 'Chuo';

  @override
  String get cityTennoji => 'Tennoji';

  @override
  String get cityShimogyo => 'Shimogyo';

  @override
  String get cityHigashiyama => 'Higashiyama';

  @override
  String get citySakyo => 'Sakyo';

  @override
  String get citySapporo => 'Sapporo';

  @override
  String get cityHakodate => 'Hakodate';

  @override
  String get cityAsahikawa => 'Asahikawa';

  @override
  String get cityHakata => 'Hakata';

  @override
  String get cityTenjin => 'Tenjin';

  @override
  String get cityNaka => 'Naka';

  @override
  String get wardShibuya => 'Shibuya Ward';

  @override
  String get wardShinjuku => 'Shinjuku Ward';

  @override
  String get wardChiyoda => 'Chiyoda Ward';

  @override
  String get wardTennoji => 'Tennoji Ward';

  @override
  String get areaHarajuku => 'Harajuku';

  @override
  String get areaEbisu => 'Ebisu';

  @override
  String get areaKabukicho => 'Kabukicho';

  @override
  String get areaYotsuya => 'Yotsuya';

  @override
  String get areaMarunouchi => 'Marunouchi';

  @override
  String get areaAkihabara => 'Akihabara';

  @override
  String get areaKanda => 'Kanda';

  @override
  String get areaRoppongi => 'Roppongi';

  @override
  String get areaAzabu => 'Azabu';

  @override
  String get areaOdaiba => 'Odaiba';

  @override
  String get areaShimokitazawa => 'Shimokitazawa';

  @override
  String get areaSangenjaya => 'Sangenjaya';

  @override
  String get areaUmeda => 'Umeda';

  @override
  String get areaNakanoshima => 'Nakanoshima';

  @override
  String get areaNamba => 'Namba';

  @override
  String get areaShinsaibashi => 'Shinsaibashi';

  @override
  String get areaDotonbori => 'Dotonbori';

  @override
  String get areaAbeno => 'Abeno';

  @override
  String get areaKyotoStation => 'Kyoto Station Area';

  @override
  String get areaGion => 'Gion';

  @override
  String get areaKiyomizu => 'Kiyomizu';

  @override
  String get areaGinkakuji => 'Ginkakuji Area';

  @override
  String get areaChuo => 'Chuo';

  @override
  String get areaKita => 'Kita';

  @override
  String get areaSusukino => 'Susukino';

  @override
  String get areaHakataStation => 'Hakata Station Area';

  @override
  String get areaCanal => 'Canal City';

  @override
  String get areaTenjinCentral => 'Tenjin Central';

  @override
  String get areaChinatown => 'Chinatown';

  @override
  String get areaMinatoMirai => 'Minato Mirai';

  @override
  String get serviceInternalMedicine => 'Internal Medicine';

  @override
  String get serviceSurgery => 'Surgery';

  @override
  String get serviceENT => 'ENT';

  @override
  String get serviceDentistry => 'Dentistry';

  @override
  String get serviceOBGYN => 'OG/GYN';

  @override
  String get servicePsychosomaticMedicine => 'Psychosomatic Medicine';

  @override
  String get chatbotWelcome =>
      'Hello! I\'m your medical assistant. You can speak to me or type your questions. How can I help you today?';

  @override
  String get medicalAssistant => 'Medical Assistant';

  @override
  String get detailed => 'Detailed';

  @override
  String get quick => 'Quick';

  @override
  String get responseType => 'Response Type';

  @override
  String get quickMode => 'Quick Mode';

  @override
  String get quickModeDesc => 'Fast, concise responses';

  @override
  String get detailedMode => 'Detailed Mode';

  @override
  String get detailedModeDesc => 'Comprehensive medical information';

  @override
  String get quickModeActivated => '⚡ Quick mode activated';

  @override
  String get detailedModeActivated => '📋 Detailed mode activated';

  @override
  String get chatCleared => '✅ Chat history cleared';

  @override
  String get thinking => 'Thinking...';

  @override
  String get overloaded =>
      'The service is currently overloaded. Please try again later.';

  @override
  String get errorOccurred => 'An error occurred. Please try again.';

  @override
  String get networkError => 'Network error. Please check your connection.';

  @override
  String get speechNotAvailable => 'Speech recognition is not available';

  @override
  String get micPermissionRequired =>
      'Microphone permission is required for voice input';

  @override
  String get voiceInputError => 'Voice input error occurred';

  @override
  String get processing => 'Got it. Processing.';

  @override
  String get listening => 'Listening...';

  @override
  String get typeOrSpeak => 'Type or speak your symptoms';

  @override
  String get you => 'You';

  @override
  String get assistant => 'Assistant';

  @override
  String get findNearbyFacilities => '🏥 Find Nearby Facilities';

  @override
  String get noDepartmentDetected =>
      'No medical department was recommended yet. Please describe your symptoms first.';

  @override
  String get askAssistant => 'Ask AI Assistant';

  @override
  String searchingForService(String service) {
    return 'Searching for $service...';
  }

  @override
  String get cannotOpenPhoneDial => 'Cannot open phone dialer';
}

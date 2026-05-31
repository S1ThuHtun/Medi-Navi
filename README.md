# MediNavi

A Flutter application that helps foreign residents and local Japanese with limited medical knowledge find nearby medical facilities, get AI-powered symptom guidance, and manage medicine reminders — in English, Japanese, and Chinese.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Running the App](#running-the-app)

---

## Features

### Medical Facility Search
- Searches nearby hospitals and clinics using the **Google Places API**
- Supports 12 medical departments: Internal Medicine, Pharmacy, Dentistry, Surgery, Orthopedics, Dermatology, Ophthalmology, ENT, Pediatrics, OB/GYN, Psychiatry, Psychosomatic Medicine
- Location options: GPS-based current location, or manual prefecture → city → ward selection
- Results sorted by distance from current position using the Haversine formula

### AI Medical Chatbot (Gemini 2.5 Flash)
- Describe symptoms in text or voice — the chatbot recommends the appropriate medical department
- Two response modes: **Quick** (concise) and **Detailed** (structured with causes, self-care tips, warning signs)
- Voice input via `speech_to_text` and voice output via `flutter_tts`, both adapting to the app's current language
- After receiving a department recommendation, tapping "Find Nearby Facilities" automatically searches for that department on the home screen
- Emergency contacts (119, 110, hotlines) are rendered as tappable phone links in every response
- Chat history is persisted locally with `shared_preferences`; context is trimmed automatically to prevent API overflow

### Medicine Reminders & Alarms
- Schedule medication reminders with custom times
- Background alarm service runs independently of the UI
- Local notifications delivered via `flutter_local_notifications`

### Favorites
- Save and manage frequently used medical facilities

### Interactive Map
- Map view powered by `flutter_map` (OpenStreetMap)

### Multi-language Support
- Full internationalization (i18n) in **English, Japanese, and Chinese**
- Language selection on first launch (onboarding); persisted across sessions
- All UI strings, service names, and prefecture names are localized via `.arb` files

### Authentication
- Email/password sign-up and login via **Firebase Authentication**
- Session persistence: returning users go directly to the home screen

---

## Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter / Dart |
| Auth | Firebase Authentication |
| AI Chatbot | Google Gemini 2.5 Flash API |
| Map | flutter_map (OpenStreetMap) |
| Facility Search | Google Places API |
| Notifications | flutter_local_notifications + timezone |
| Voice Input | speech_to_text |
| Voice Output | flutter_tts |
| Location | geolocator |
| Local Storage | shared_preferences |
| Environment | flutter_dotenv |
| Audio | audioplayers |

---

## Architecture

```
lib/
├── main.dart                  # App entry point, Firebase init, locale setup
├── screens/
│   ├── home_screen.dart       # Facility search + category tabs
│   ├── chatbot_screen.dart    # Gemini AI chatbot with voice I/O
│   ├── map_screen.dart        # Interactive map view
│   ├── favorites_screen.dart  # Saved facilities
│   ├── settings_screen.dart   # Language and app settings
│   ├── reminder/              # Medicine reminder screens
│   ├── sign_up_screen.dart    # Firebase auth
│   ├── startup_screen.dart    # First-launch onboarding
│   └── main_navigation_screen.dart
├── services/
│   ├── google_places_service.dart    # Google Places API integration
│   ├── auth_services.dart            # Firebase auth logic
│   ├── notification_service.dart     # Local notification scheduling
│   ├── background_alarm_service.dart # Background alarm execution
│   ├── alarm_monitor_service.dart    # Alarm state management
│   ├── foreground_alarm_monitor.dart
│   └── favorites_service.dart
├── models/
│   ├── medical_service.dart   # Facility data model
│   └── reminder.dart          # Reminder data model
├── data/
│   ├── medical_services_data.dart  # Service type → Places API type mapping
│   └── prefecture_data.dart        # Japan prefecture/city/ward data
├── utils/
│   ├── service_localization.dart        # Service name localization helpers
│   ├── prefecture_localization.dart     # Location name localization helpers
│   ├── medical_services_localization.dart
│   └── language_selection_utils.dart
├── widgets/                   # Reusable UI components
└── l10n/                      # Localization files (.arb) for EN / JA / ZH
```

### Key Data Flow: Chatbot → Facility Search

The chatbot and home screen are integrated. When the chatbot detects a medical department from the user's symptoms, the chatbot screen returns the department name to the home screen, which then automatically triggers a Google Places search for that department type near the user's location.

---

## Prerequisites

- Flutter SDK `>=3.8.0`
- A Firebase project with Authentication enabled
- A Google Places API key
- A Google Gemini API key

---

## Setup

**1. Clone the repository**

```bash
git clone <repository-url>
cd medinavi-mac
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Configure environment variables**

Create a `.env` file in the project root:

```
GOOGLE_PLACES_API_KEY=your_google_places_api_key
GEMINI_API_KEY=your_gemini_api_key
```

**4. Firebase setup**

Place your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS/macOS) in the appropriate platform directories. The `firebase_options.dart` file is already configured for the current Firebase project.

---

## Running the App

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# macOS
flutter run -d macos
```

---
---

# MediNavi（日本語）

医療知識が少ない外国人や日本人が、近くの医療機関を探したり、AIによる症状アドバイスを受けたり、服薬リマインダーを管理したりできるFlutterアプリです。英語・日本語・中国語に対応しています。

---

## 目次

- [機能一覧](#機能一覧)
- [使用技術](#使用技術)
- [アーキテクチャ](#アーキテクチャ)
- [前提条件](#前提条件)
- [セットアップ](#セットアップ)
- [アプリの起動方法](#アプリの起動方法)

---

## 機能一覧

### 医療機関の検索
- **Google Places API** を使用して近くの病院・クリニックを検索
- 対応する12の診療科：内科、薬局、歯科、外科、整形外科、皮膚科、眼科、耳鼻咽喉科、小児科、産婦人科、精神科、心療内科
- 位置情報の取得方法：GPSによる現在地、または都道府県→市区町村の手動選択
- ハバーサイン公式を使って現在地からの距離順に結果を表示

### AIチャットボット（Gemini 2.5 Flash）
- テキストまたは音声で症状を入力すると、適切な診療科を提案
- 2つの応答モード：**クイック**（簡潔）と **詳細**（原因・セルフケア・受診目安を構造化して提示）
- `speech_to_text` による音声入力と `flutter_tts` による音声出力（アプリの言語設定に連動）
- 診療科の提案を受けた後、「近くの医療機関を探す」ボタンを押すとホーム画面でその診療科の検索が自動的に実行される
- 毎回の回答に緊急連絡先（119・110・ホットライン）をタップ可能な電話リンクとして表示
- チャット履歴は `shared_preferences` でローカル保存。APIのコンテキスト超過を防ぐため自動的にトリミング

### 服薬リマインダー・アラーム
- 任意の時間に服薬リマインダーを設定
- UIとは独立して動作するバックグラウンドアラームサービス
- `flutter_local_notifications` によるローカル通知

### お気に入り
- よく利用する医療機関を保存・管理

### インタラクティブマップ
- `flutter_map`（OpenStreetMap）によるマップ表示

### 多言語対応
- **英語・日本語・中国語**の完全な国際化（i18n）対応
- 初回起動時に言語を選択（オンボーディング）し、設定はセッションをまたいで保持
- UIの全文字列・診療科名・都道府県名を `.arb` ファイルで管理

### 認証
- **Firebase Authentication** によるメールアドレス＋パスワードのサインアップ・ログイン
- セッション永続化：再起動後も自動ログイン

---

## 使用技術

| カテゴリ | 技術 |
|---|---|
| フレームワーク | Flutter / Dart |
| 認証 | Firebase Authentication |
| AIチャットボット | Google Gemini 2.5 Flash API |
| マップ | flutter_map（OpenStreetMap） |
| 医療機関検索 | Google Places API |
| 通知 | flutter_local_notifications + timezone |
| 音声入力 | speech_to_text |
| 音声出力 | flutter_tts |
| 位置情報 | geolocator |
| ローカルストレージ | shared_preferences |
| 環境変数 | flutter_dotenv |
| 音声再生 | audioplayers |

---

## アーキテクチャ

```
lib/
├── main.dart                  # アプリ起動・Firebase初期化・ロケール設定
├── screens/
│   ├── home_screen.dart       # 医療機関検索・カテゴリタブ
│   ├── chatbot_screen.dart    # Gemini AIチャットボット（音声入出力）
│   ├── map_screen.dart        # インタラクティブマップ
│   ├── favorites_screen.dart  # お気に入り一覧
│   ├── settings_screen.dart   # 言語・アプリ設定
│   ├── reminder/              # 服薬リマインダー画面
│   ├── sign_up_screen.dart    # Firebase認証
│   ├── startup_screen.dart    # 初回起動のオンボーディング
│   └── main_navigation_screen.dart
├── services/
│   ├── google_places_service.dart    # Google Places API連携
│   ├── auth_services.dart            # Firebase認証ロジック
│   ├── notification_service.dart     # ローカル通知スケジューリング
│   ├── background_alarm_service.dart # バックグラウンドアラーム実行
│   ├── alarm_monitor_service.dart    # アラーム状態管理
│   ├── foreground_alarm_monitor.dart
│   └── favorites_service.dart
├── models/
│   ├── medical_service.dart   # 医療機関データモデル
│   └── reminder.dart          # リマインダーデータモデル
├── data/
│   ├── medical_services_data.dart  # 診療科 → Places APIタイプのマッピング
│   └── prefecture_data.dart        # 都道府県・市区町村データ
├── utils/
│   ├── service_localization.dart        # 診療科名ローカライズヘルパー
│   ├── prefecture_localization.dart     # 地名ローカライズヘルパー
│   ├── medical_services_localization.dart
│   └── language_selection_utils.dart
├── widgets/                   # 再利用可能なUIコンポーネント
└── l10n/                      # 多言語ファイル（英語・日本語・中国語）
```

### データフロー：チャットボット → 医療機関検索

チャットボットとホーム画面は連携しています。チャットボットがユーザーの症状から診療科を判定すると、その診療科名をホーム画面に返し、ホーム画面が自動的に該当診療科のGoogle Places検索を実行します。

---

## 前提条件

- Flutter SDK `>=3.8.0`
- Authentication が有効なFirebaseプロジェクト
- Google Places APIキー
- Google Gemini APIキー

---

## セットアップ

**1. リポジトリのクローン**

```bash
git clone <repository-url>
cd medinavi-mac
```

**2. 依存パッケージのインストール**

```bash
flutter pub get
```

**3. 環境変数の設定**

プロジェクトのルートに `.env` ファイルを作成してください：

```
GOOGLE_PLACES_API_KEY=your_google_places_api_key
GEMINI_API_KEY=your_gemini_api_key
```

**4. Firebaseの設定**

`google-services.json`（Android）と `GoogleService-Info.plist`（iOS / macOS）を各プラットフォームのディレクトリに配置してください。`firebase_options.dart` はすでに設定済みです。

---

## アプリの起動方法

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# macOS
flutter run -d macos
```

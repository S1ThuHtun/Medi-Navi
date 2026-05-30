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
  String get reminders => 'Reminders';

  @override
  String get favorites => 'Favorites';

  @override
  String get member => 'Member';

  @override
  String get noFavorites => 'Your Favorite Facilities List is Empty';

  @override
  String get tapHeartToSave =>
      'Tap the heart icon on any facility to save it here';

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
  String get transitDirectionsTitle => 'Transit Directions';

  @override
  String get transitDirectionsMessage =>
      'Transit directions are best viewed in Google Maps.\n\nWould you like to open Google Maps for transit directions?';

  @override
  String get openMaps => 'Open Maps';

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
  String get regionHokkaido => 'Hokkaido Region';

  @override
  String get regionTohoku => 'Tohoku Region';

  @override
  String get regionKanto => 'Kanto Region';

  @override
  String get regionChubu => 'Chubu Region';

  @override
  String get regionKansai => 'Kansai Region';

  @override
  String get regionChugoku => 'Chugoku Region';

  @override
  String get regionShikoku => 'Shikoku Region';

  @override
  String get regionKyushuOkinawa => 'Kyushu & Okinawa Region';

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
  String get servicePharmacy => 'Pharmacy';

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
  String get chatCleared => 'Chat history cleared';

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

  @override
  String get reminderAddTitle => 'Add Reminder';

  @override
  String get reminderEditTitle => 'Edit Reminder';

  @override
  String get reminderMedicineNameLabel => 'Medicine Name';

  @override
  String get reminderMedicineNameHint => 'Enter medicine name';

  @override
  String get reminderPhotoLabel => 'Medicine Photo';

  @override
  String get reminderPhotoOptional => '(Optional)';

  @override
  String get reminderAddPhotoTitle => 'Add Photo';

  @override
  String get reminderAddPhotoButton => 'Tap to add photo';

  @override
  String get reminderPhotoFromCamera => 'Take Photo';

  @override
  String get reminderPhotoFromGallery => 'Choose from Gallery';

  @override
  String get reminderPhotoRemove => 'Remove Photo';

  @override
  String reminderPhotoPickError(String error) {
    return 'Error picking photo: $error';
  }

  @override
  String get reminderTimeLabel => 'Time';

  @override
  String get reminderRepeatLabel => 'Repeat';

  @override
  String get reminderRepeatNever => 'Never';

  @override
  String get reminderRepeatEveryday => 'Every day';

  @override
  String get reminderRepeatWeekdays => 'Weekdays only';

  @override
  String get reminderRepeatWeekends => 'Weekends only';

  @override
  String get reminderRepeatCustomOption => 'Custom';

  @override
  String get reminderRepeatSettingsTitle => 'Repeat Settings';

  @override
  String get reminderRepeatDone => 'Done';

  @override
  String get reminderSelectDays => 'Select days';

  @override
  String get reminderDayMonShort => 'Mon';

  @override
  String get reminderDayTueShort => 'Tue';

  @override
  String get reminderDayWedShort => 'Wed';

  @override
  String get reminderDayThuShort => 'Thu';

  @override
  String get reminderDayFriShort => 'Fri';

  @override
  String get reminderDaySatShort => 'Sat';

  @override
  String get reminderDaySunShort => 'Sun';

  @override
  String get reminderDaySeparator => ', ';

  @override
  String reminderEveryWeekDays(String days) {
    return '$days';
  }

  @override
  String get reminderMealTimingLabel => 'Meal Timing';

  @override
  String get reminderMealTimingNone => 'No specific timing';

  @override
  String get reminderMealTimingBeforeTitle => 'Before Meals';

  @override
  String get reminderMealTimingBeforeSubtitle => 'Take 30 mins before eating';

  @override
  String get reminderMealTimingAfterTitle => 'After Meals';

  @override
  String get reminderMealTimingAfterSubtitle => 'Take 30 mins after eating';

  @override
  String get reminderCancel => 'Cancel';

  @override
  String get reminderAdd => 'Add';

  @override
  String get reminderUpdate => 'Update';

  @override
  String get reminderDoseMorning => 'Morning';

  @override
  String get reminderDoseNoon => 'Noon';

  @override
  String get reminderDoseEvening => 'Evening';

  @override
  String get reminderDoseNight => 'Night';

  @override
  String reminderNotificationBody(int dose) {
    return 'Time to take your medicine (Dose $dose)';
  }

  @override
  String get reminderNotificationChannelName => 'Medicine Reminders';

  @override
  String get reminderNotificationChannelDescription =>
      'Notifications for medicine reminders';

  @override
  String get reminderAddedMessage => 'Reminder added successfully!';

  @override
  String get reminderUpdatedMessage => 'Reminder updated successfully!';

  @override
  String get reminderDeletedMessage => 'Reminder deleted';

  @override
  String get reminderTakenSnackBar => 'Medicine taken!';

  @override
  String get reminderTimeToTakeMessage => 'Time to take your medicine';

  @override
  String get reminderTakenButton => 'I took it';

  @override
  String get reminderCloseButton => 'Close';

  @override
  String get reminderMealConfirmTitle => 'Meal Check';

  @override
  String get reminderMealConfirmMessage =>
      'This medicine should be taken after meals';

  @override
  String get reminderMealConfirmQuestion => 'Have you finished eating?';

  @override
  String get reminderMealConfirmRecommendation =>
      'For best results, take medicine 30 minutes after eating';

  @override
  String get reminderMealConfirmNotYet => 'Not yet';

  @override
  String get reminderMealConfirmDone => 'Already finished';

  @override
  String get reminderLaterTitle => 'Reminder Set';

  @override
  String get reminderLaterMessage =>
      'Please remember to take your medicine after eating!';

  @override
  String get reminderLaterOk => 'OK';

  @override
  String get medicineReminderTitle => 'Medicine Reminders';

  @override
  String get reminderEmptyTitle => 'No reminders yet';

  @override
  String get reminderEmptySubtitle =>
      'Tap + to add your first medicine reminder';

  @override
  String addedToFavorites(String name) {
    return '$name added to favorites';
  }

  @override
  String removedFromFavorites(String name) {
    return '$name removed from favorites';
  }

  @override
  String get reminderTestAlarmTooltip => 'Test alarm for this reminder';

  @override
  String get settingsAccount => 'Account';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsPrivacySecurity => 'Privacy & Security';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsHelpSupport => 'Help & Support';

  @override
  String get settingsAboutApp => 'About MediNavi';

  @override
  String get clearChat => 'Clear Chat';

  @override
  String get clearChatMessage =>
      'Start a new conversation? Current chat will be cleared.';

  @override
  String get clearChatConfirm => 'Clear';

  @override
  String get favoritesClearAllTitle => 'Clear All Favorites';

  @override
  String get favoritesClearAllMessage =>
      'Are you sure you want to remove all favorites? This action cannot be undone.';

  @override
  String get favoritesClearAll => 'Clear All';

  @override
  String get cityAbashiri => 'Abashiri';

  @override
  String get cityAbeno => 'Abeno';

  @override
  String get cityAbiko => 'Abiko';

  @override
  String get cityAgeo => 'Ageo';

  @override
  String get cityAichi => 'Aichi';

  @override
  String get cityAioi => 'Aioi';

  @override
  String get cityAira => 'Aira';

  @override
  String get cityAisai => 'Aisai';

  @override
  String get cityAizuwakamatsu => 'Aizuwakamatsu';

  @override
  String get cityAkaiwa => 'Akaiwa';

  @override
  String get cityAkashi => 'Akashi';

  @override
  String get cityAki => 'Aki';

  @override
  String get cityAkihabara => 'Akihabara';

  @override
  String get cityAkita => 'Akita';

  @override
  String get cityAkitaCity => 'Akita City';

  @override
  String get cityAkitakata => 'Akitakata';

  @override
  String get cityAko => 'Ako';

  @override
  String get cityAkune => 'Akune';

  @override
  String get cityAma => 'Ama';

  @override
  String get cityAmagasaki => 'Amagasaki';

  @override
  String get cityAmakusa => 'Amakusa';

  @override
  String get cityAnan => 'Anan';

  @override
  String get cityAnjo => 'Anjo';

  @override
  String get cityAnnaka => 'Annaka';

  @override
  String get cityAomori => 'Aomori';

  @override
  String get cityAomoriCity => 'Aomori City';

  @override
  String get cityArao => 'Arao';

  @override
  String get cityArida => 'Arida';

  @override
  String get cityArashiyama => 'Arashiyama';

  @override
  String get cityAsago => 'Asago';

  @override
  String get cityAsahi => 'Asahi';

  @override
  String get cityAsaka => 'Asaka';

  @override
  String get cityAsakuchi => 'Asakuchi';

  @override
  String get cityAsakura => 'Asakura';

  @override
  String get cityAsakusa => 'Asakusa';

  @override
  String get cityAshikaga => 'Ashikaga';

  @override
  String get cityAshiya => 'Ashiya';

  @override
  String get cityAso => 'Aso';

  @override
  String get cityAtami => 'Atami';

  @override
  String get cityAtsugi => 'Atsugi';

  @override
  String get cityAtsuta => 'Atsuta';

  @override
  String get cityAwa => 'Awa';

  @override
  String get cityAwaji => 'Awaji';

  @override
  String get cityAwara => 'Awara';

  @override
  String get cityAyabe => 'Ayabe';

  @override
  String get cityAyase => 'Ayase';

  @override
  String get cityAzabu => 'Azabu';

  @override
  String get cityAzumino => 'Azumino';

  @override
  String get cityAdachi => 'Adachi';

  @override
  String get cityArakawa => 'Arakawa';

  @override
  String get cityBunkyo => 'Bunkyo';

  @override
  String get cityEdogawa => 'Edogawa';

  @override
  String get cityItabashi => 'Itabashi';

  @override
  String get cityKatsushika => 'Katsushika';

  @override
  String get cityKoto => 'Koto';

  @override
  String get cityMeguro => 'Meguro';

  @override
  String get cityMeito => 'Meito';

  @override
  String get cityNakano => 'Nakano';

  @override
  String get cityNerima => 'Nerima';

  @override
  String get cityOta => 'Ota';

  @override
  String get cityOtaWard => 'Ota Ward';

  @override
  String get cityShinagawa => 'Shinagawa';

  @override
  String get citySuginami => 'Suginami';

  @override
  String get citySumida => 'Sumida';

  @override
  String get citySuminoe => 'Suminoe';

  @override
  String get citySumiyoshi => 'Sumiyoshi';

  @override
  String get cityTaito => 'Taito';

  @override
  String get cityToshima => 'Toshima';

  @override
  String get cityMiura => 'Miura';

  @override
  String get cityHadano => 'Hadano';

  @override
  String get cityIsehara => 'Isehara';

  @override
  String get cityMinamiashigara => 'Minamiashigara';

  @override
  String get cityTsurumi => 'Tsurumi';

  @override
  String get cityKanagawaWard => 'Kanagawa Ward';

  @override
  String get cityKohoku => 'Kohoku';

  @override
  String get cityTotsuka => 'Totsuka';

  @override
  String get cityHodogaya => 'Hodogaya';

  @override
  String get cityIsogo => 'Isogo';

  @override
  String get cityKanazawaWard => 'Kanazawa Ward';

  @override
  String get cityKonanWard => 'Konan Ward';

  @override
  String get cityMidori => 'Midori';

  @override
  String get citySeya => 'Seya';

  @override
  String get citySakae => 'Sakae';

  @override
  String get cityIzumiWard => 'Izumi Ward';

  @override
  String get cityAoba => 'Aoba';

  @override
  String get cityTsuzuki => 'Tsuzuki';

  @override
  String get cityNishi => 'Nishi';

  @override
  String get cityMinami => 'Minami';

  @override
  String get cityNakaWard => 'Naka Ward';

  @override
  String get cityBeppu => 'Beppu';

  @override
  String get cityBibai => 'Bibai';

  @override
  String get cityBizen => 'Bizen';

  @override
  String get cityBungoono => 'Bungoono';

  @override
  String get cityBungotakada => 'Bungotakada';

  @override
  String get cityBuzen => 'Buzen';

  @override
  String get cityCanalCity => 'Canal City';

  @override
  String get cityChiba => 'Chiba';

  @override
  String get cityChibaCity => 'Chiba City';

  @override
  String get cityChichibu => 'Chichibu';

  @override
  String get cityChigasaki => 'Chigasaki';

  @override
  String get cityChikugo => 'Chikugo';

  @override
  String get cityChikuma => 'Chikuma';

  @override
  String get cityChikushino => 'Chikushino';

  @override
  String get cityChikusa => 'Chikusa';

  @override
  String get cityChinatown => 'Chinatown';

  @override
  String get cityChino => 'Chino';

  @override
  String get cityChiryu => 'Chiryu';

  @override
  String get cityChita => 'Chita';

  @override
  String get cityChitose => 'Chitose';

  @override
  String get cityDaisen => 'Daisen';

  @override
  String get cityDaito => 'Daito';

  @override
  String get cityDate => 'Date';

  @override
  String get cityDazaifu => 'Dazaifu';

  @override
  String get cityDotonbori => 'Dotonbori';

  @override
  String get cityEbetsu => 'Ebetsu';

  @override
  String get cityEbina => 'Ebina';

  @override
  String get cityEbino => 'Ebino';

  @override
  String get cityEbisu => 'Ebisu';

  @override
  String get cityEchizen => 'Echizen';

  @override
  String get cityEhime => 'Ehime';

  @override
  String get cityEna => 'Ena';

  @override
  String get cityEniwa => 'Eniwa';

  @override
  String get cityEtajima => 'Etajima';

  @override
  String get cityFuchu => 'Fuchu';

  @override
  String get cityFuefuki => 'Fuefuki';

  @override
  String get cityFujieda => 'Fujieda';

  @override
  String get cityFujiidera => 'Fujiidera';

  @override
  String get cityFujimi => 'Fujimi';

  @override
  String get cityFujimino => 'Fujimino';

  @override
  String get cityFujinomiya => 'Fujinomiya';

  @override
  String get cityFujioka => 'Fujioka';

  @override
  String get cityFujisawa => 'Fujisawa';

  @override
  String get cityFujiyoshida => 'Fujiyoshida';

  @override
  String get cityFuji => 'Fuji';

  @override
  String get cityFukuchiyama => 'Fukuchiyama';

  @override
  String get cityFukui => 'Fukui';

  @override
  String get cityFukuiCity => 'Fukui City';

  @override
  String get cityFukuoka => 'Fukuoka';

  @override
  String get cityFukagawa => 'Fukagawa';

  @override
  String get cityFukaya => 'Fukaya';

  @override
  String get cityFukuokaCity => 'Fukuoka City';

  @override
  String get cityFukuroi => 'Fukuroi';

  @override
  String get cityFukushima => 'Fukushima';

  @override
  String get cityFukushimaCity => 'Fukushima City';

  @override
  String get cityFukutsu => 'Fukutsu';

  @override
  String get cityFukuyama => 'Fukuyama';

  @override
  String get cityFushimi => 'Fushimi';

  @override
  String get cityFunabashi => 'Funabashi';

  @override
  String get cityFurano => 'Furano';

  @override
  String get cityFuttsu => 'Futtsu';

  @override
  String get cityGamagori => 'Gamagori';

  @override
  String get cityGero => 'Gero';

  @override
  String get cityGifu => 'Gifu';

  @override
  String get cityGifuCity => 'Gifu City';

  @override
  String get cityGinkakujiArea => 'Ginkakuji Area';

  @override
  String get cityGinza => 'Ginza';

  @override
  String get cityGinowan => 'Ginowan';

  @override
  String get cityGion => 'Gion';

  @override
  String get cityGobo => 'Gobo';

  @override
  String get cityGojo => 'Gojo';

  @override
  String get cityGose => 'Gose';

  @override
  String get cityGosen => 'Gosen';

  @override
  String get cityGoshogawara => 'Goshogawara';

  @override
  String get cityGoto => 'Goto';

  @override
  String get cityGujo => 'Gujo';

  @override
  String get cityGotemba => 'Gotemba';

  @override
  String get cityGotsu => 'Gotsu';

  @override
  String get cityGunma => 'Gunma';

  @override
  String get cityGyoda => 'Gyoda';

  @override
  String get cityHabikino => 'Habikino';

  @override
  String get cityHachinohe => 'Hachinohe';

  @override
  String get cityHachimantai => 'Hachimantai';

  @override
  String get cityHagi => 'Hagi';

  @override
  String get cityHakataStationArea => 'Hakata Station Area';

  @override
  String get cityHakui => 'Hakui';

  @override
  String get cityHakusan => 'Hakusan';

  @override
  String get cityHamada => 'Hamada';

  @override
  String get cityHamamatsu => 'Hamamatsu';

  @override
  String get cityHana => 'Handa';

  @override
  String get cityHanamaki => 'Hanamaki';

  @override
  String get cityHannan => 'Hannan';

  @override
  String get cityHanno => 'Hanno';

  @override
  String get cityHanyu => 'Hanyu';

  @override
  String get cityHarajuku => 'Harajuku';

  @override
  String get cityHashima => 'Hashima';

  @override
  String get cityHashimoto => 'Hashimoto';

  @override
  String get cityHasuda => 'Hasuda';

  @override
  String get cityHatsukaichi => 'Hatsukaichi';

  @override
  String get cityHekinan => 'Hekinan';

  @override
  String get cityHida => 'Hida';

  @override
  String get cityHidaka => 'Hidaka';

  @override
  String get cityHigashi => 'Higashi';

  @override
  String get cityHigashihiroshima => 'Higashihiroshima';

  @override
  String get cityHigashikagawa => 'Higashikagawa';

  @override
  String get cityHigashimatsushima => 'Higashimatsushima';

  @override
  String get cityHigashimatsuyama => 'Higashimatsuyama';

  @override
  String get cityHigashinari => 'Higashinari';

  @override
  String get cityHigashiomi => 'Higashiomi';

  @override
  String get cityHigashiosaka => 'Higashiosaka';

  @override
  String get cityHigashisumiyoshi => 'Higashisumiyoshi';

  @override
  String get cityHigashiyodogawa => 'Higashiyodogawa';

  @override
  String get cityHigashine => 'Higashine';

  @override
  String get cityHikari => 'Hikari';

  @override
  String get cityHikone => 'Hikone';

  @override
  String get cityHimi => 'Himi';

  @override
  String get cityHimeji => 'Himeji';

  @override
  String get cityHioki => 'Hioki';

  @override
  String get cityHirakata => 'Hirakata';

  @override
  String get cityHirakawa => 'Hirakawa';

  @override
  String get cityHirado => 'Hirado';

  @override
  String get cityHirano => 'Hirano';

  @override
  String get cityHiratsuka => 'Hiratsuka';

  @override
  String get cityHirosaki => 'Hirosaki';

  @override
  String get cityHiroshima => 'Hiroshima';

  @override
  String get cityHiroshimaCity => 'Hiroshima City';

  @override
  String get cityHitachi => 'Hitachi';

  @override
  String get cityHitachinaka => 'Hitachinaka';

  @override
  String get cityHitachiomiya => 'Hitachiomiya';

  @override
  String get cityHitachiota => 'Hitachiota';

  @override
  String get cityHitoyoshi => 'Hitoyoshi';

  @override
  String get cityHita => 'Hita';

  @override
  String get cityHofu => 'Hofu';

  @override
  String get cityHokkaido => 'Hokkaido';

  @override
  String get cityHokuto => 'Hokuto';

  @override
  String get cityHonjo => 'Honjo';

  @override
  String get cityHyogo => 'Hyogo';

  @override
  String get cityHyuga => 'Hyuga';

  @override
  String get cityIbaraki => 'Ibaraki';

  @override
  String get cityIbara => 'Ibara';

  @override
  String get cityIbusuki => 'Ibusuki';

  @override
  String get cityIchihara => 'Ichihara';

  @override
  String get cityIchikawa => 'Ichikawa';

  @override
  String get cityIchikikushikino => 'Ichikikushikino';

  @override
  String get cityIchinoseki => 'Ichinoseki';

  @override
  String get cityIchinomiya => 'Ichinomiya';

  @override
  String get cityIda => 'Iida';

  @override
  String get cityIga => 'Iga';

  @override
  String get cityIizuka => 'Iizuka';

  @override
  String get cityIiyama => 'Iiyama';

  @override
  String get cityIkebukuro => 'Ikebukuro';

  @override
  String get cityIkeda => 'Ikeda';

  @override
  String get cityIkoma => 'Ikoma';

  @override
  String get cityIki => 'Iki';

  @override
  String get cityIida => 'Iida';

  @override
  String get cityIkuno => 'Ikuno';

  @override
  String get cityImabari => 'Imabari';

  @override
  String get cityImari => 'Imari';

  @override
  String get cityImizu => 'Imizu';

  @override
  String get cityInabe => 'Inabe';

  @override
  String get cityInashiki => 'Inashiki';

  @override
  String get cityInazawa => 'Inazawa';

  @override
  String get cityIna => 'Ina';

  @override
  String get cityInuyama => 'Inuyama';

  @override
  String get cityInzai => 'Inzai';

  @override
  String get cityIruma => 'Iruma';

  @override
  String get cityIsahaya => 'Isahaya';

  @override
  String get cityIsa => 'Isa';

  @override
  String get cityIse => 'Ise';

  @override
  String get cityIsesaki => 'Isesaki';

  @override
  String get cityIshigaki => 'Ishigaki';

  @override
  String get cityIshikari => 'Ishikari';

  @override
  String get cityIshikawa => 'Ishikawa';

  @override
  String get cityIshioka => 'Ishioka';

  @override
  String get cityIshinomaki => 'Ishinomaki';

  @override
  String get cityIsumi => 'Isumi';

  @override
  String get cityItako => 'Itako';

  @override
  String get cityItami => 'Itami';

  @override
  String get cityIto => 'Ito';

  @override
  String get cityItoigawa => 'Itoigawa';

  @override
  String get cityItoman => 'Itoman';

  @override
  String get cityItoshima => 'Itoshima';

  @override
  String get cityIwade => 'Iwade';

  @override
  String get cityIwaki => 'Iwaki';

  @override
  String get cityIwakuni => 'Iwakuni';

  @override
  String get cityIwakura => 'Iwakura';

  @override
  String get cityIwamizawa => 'Iwamizawa';

  @override
  String get cityIwanuma => 'Iwanuma';

  @override
  String get cityIwate => 'Iwate';

  @override
  String get cityIwata => 'Iwata';

  @override
  String get cityIyo => 'Iyo';

  @override
  String get cityIzu => 'Izu';

  @override
  String get cityIzumi => 'Izumi';

  @override
  String get cityIzumiotsu => 'Izumiotsu';

  @override
  String get cityIzumisano => 'Izumisano';

  @override
  String get cityIzumo => 'Izumo';

  @override
  String get cityIzunokuni => 'Izunokuni';

  @override
  String get cityJoetsu => 'Joetsu';

  @override
  String get cityJonan => 'Jonan';

  @override
  String get cityJoso => 'Joso';

  @override
  String get cityJoto => 'Joto';

  @override
  String get cityJoyo => 'Joyo';

  @override
  String get cityKabukicho => 'Kabukicho';

  @override
  String get cityKadoma => 'Kadoma';

  @override
  String get cityKaga => 'Kaga';

  @override
  String get cityKagawa => 'Kagawa';

  @override
  String get cityKagoshima => 'Kagoshima';

  @override
  String get cityKagoshimaCity => 'Kagoshima City';

  @override
  String get cityKahoku => 'Kahoku';

  @override
  String get cityKai => 'Kai';

  @override
  String get cityKainan => 'Kainan';

  @override
  String get cityKaizuka => 'Kaizuka';

  @override
  String get cityKaizu => 'Kaizu';

  @override
  String get cityKakamigahara => 'Kakamigahara';

  @override
  String get cityKakegawa => 'Kakegawa';

  @override
  String get cityKakogawa => 'Kakogawa';

  @override
  String get cityKakuda => 'Kakuda';

  @override
  String get cityKama => 'Kama';

  @override
  String get cityKamagaya => 'Kamagaya';

  @override
  String get cityKamaishi => 'Kamaishi';

  @override
  String get cityKamakura => 'Kamakura';

  @override
  String get cityKameoka => 'Kameoka';

  @override
  String get cityKameyama => 'Kameyama';

  @override
  String get cityKami => 'Kami';

  @override
  String get cityKamiamakusa => 'Kamiamakusa';

  @override
  String get cityKamigyo => 'Kamigyo';

  @override
  String get cityKaminoyama => 'Kaminoyama';

  @override
  String get cityKamo => 'Kamo';

  @override
  String get cityKamogawa => 'Kamogawa';

  @override
  String get cityKanagawa => 'Kanagawa';

  @override
  String get cityKanda => 'Kanda';

  @override
  String get cityKani => 'Kani';

  @override
  String get cityKannonji => 'Kan\'onji';

  @override
  String get cityKanoya => 'Kanoya';

  @override
  String get cityKanuma => 'Kanuma';

  @override
  String get cityKanzaki => 'Kanzaki';

  @override
  String get cityKanazawa => 'Kanazawa';

  @override
  String get cityKariya => 'Kariya';

  @override
  String get cityKaratsu => 'Karatsu';

  @override
  String get cityKasai => 'Kasai';

  @override
  String get cityKasama => 'Kasama';

  @override
  String get cityKasaoka => 'Kasaoka';

  @override
  String get cityKashiba => 'Kashiba';

  @override
  String get cityKashihara => 'Kashihara';

  @override
  String get cityKashima => 'Kashima';

  @override
  String get cityKashiwa => 'Kashiwa';

  @override
  String get cityKashiwara => 'Kashiwara';

  @override
  String get cityKashiwazaki => 'Kashiwazaki';

  @override
  String get cityKasuga => 'Kasuga';

  @override
  String get cityKasugai => 'Kasugai';

  @override
  String get cityKasukabe => 'Kasukabe';

  @override
  String get cityKatagami => 'Katagami';

  @override
  String get cityKatano => 'Katano';

  @override
  String get cityKato => 'Kato';

  @override
  String get cityKatori => 'Katori';

  @override
  String get cityKatsuragi => 'Katsuragi';

  @override
  String get cityKatsuura => 'Katsuura';

  @override
  String get cityKatsuyama => 'Katsuyama';

  @override
  String get cityKawachinagano => 'Kawachinagano';

  @override
  String get cityKawagoe => 'Kawagoe';

  @override
  String get cityKawaguchi => 'Kawaguchi';

  @override
  String get cityKawanishi => 'Kawanishi';

  @override
  String get cityKawasaki => 'Kawasaki';

  @override
  String get cityKazuno => 'Kazuno';

  @override
  String get cityKazo => 'Kazo';

  @override
  String get cityKesennuma => 'Kesennuma';

  @override
  String get cityKikuchi => 'Kikuchi';

  @override
  String get cityKikugawa => 'Kikugawa';

  @override
  String get cityKimitsu => 'Kimitsu';

  @override
  String get cityKinkakujiArea => 'Kinkakuji Area';

  @override
  String get cityKinokawa => 'Kinokawa';

  @override
  String get cityKirishima => 'Kirishima';

  @override
  String get cityKiryu => 'Kiryu';

  @override
  String get cityKisarazu => 'Kisarazu';

  @override
  String get cityKishiwada => 'Kishiwada';

  @override
  String get cityKitahiroshima => 'Kitahiroshima';

  @override
  String get cityKitaibaraki => 'Kitaibaraki';

  @override
  String get cityKitakami => 'Kitakami';

  @override
  String get cityKitakata => 'Kitakata';

  @override
  String get cityKitakyushu => 'Kitakyushu';

  @override
  String get cityKitami => 'Kitami';

  @override
  String get cityKitamoto => 'Kitamoto';

  @override
  String get cityKitanagoya => 'Kitanagoya';

  @override
  String get cityKitsuki => 'Kitsuki';

  @override
  String get cityKiyomizu => 'Kiyomizu';

  @override
  String get cityKiyosu => 'Kiyosu';

  @override
  String get cityKizugawa => 'Kizugawa';

  @override
  String get cityKobe => 'Kobe';

  @override
  String get cityKobayashi => 'Kobayashi';

  @override
  String get cityKochi => 'Kochi';

  @override
  String get cityKochiCity => 'Kochi City';

  @override
  String get cityKofu => 'Kofu';

  @override
  String get cityKoga => 'Koga';

  @override
  String get cityKoka => 'Koka';

  @override
  String get cityKomagane => 'Komagane';

  @override
  String get cityKomaki => 'Komaki';

  @override
  String get cityKomatsu => 'Komatsu';

  @override
  String get cityKomatsushima => 'Komatsushima';

  @override
  String get cityKomoro => 'Komoro';

  @override
  String get cityKonan => 'Konan';

  @override
  String get cityKonohana => 'Konohana';

  @override
  String get cityKoriyama => 'Koriyama';

  @override
  String get cityKosai => 'Kosai';

  @override
  String get cityKoshigaya => 'Koshigaya';

  @override
  String get cityKoshi => 'Koshi';

  @override
  String get cityKoshu => 'Koshu';

  @override
  String get cityKudamatsu => 'Kudamatsu';

  @override
  String get cityKuki => 'Kuki';

  @override
  String get cityKumamoto => 'Kumamoto';

  @override
  String get cityKumamotoCity => 'Kumamoto City';

  @override
  String get cityKumagaya => 'Kumagaya';

  @override
  String get cityKumano => 'Kumano';

  @override
  String get cityKunisaki => 'Kunisaki';

  @override
  String get cityKurashiki => 'Kurashiki';

  @override
  String get cityKurayoshi => 'Kurayoshi';

  @override
  String get cityKure => 'Kure';

  @override
  String get cityKurihara => 'Kurihara';

  @override
  String get cityKuroishi => 'Kuroishi';

  @override
  String get cityKurobe => 'Kurobe';

  @override
  String get cityKurume => 'Kurume';

  @override
  String get cityKushima => 'Kushima';

  @override
  String get cityKushiro => 'Kushiro';

  @override
  String get cityKusatsu => 'Kusatsu';

  @override
  String get cityKuwana => 'Kuwana';

  @override
  String get cityKyoto => 'Kyoto';

  @override
  String get cityKyotoCity => 'Kyoto City';

  @override
  String get cityKyotanabe => 'Kyotanabe';

  @override
  String get cityKyotango => 'Kyotango';

  @override
  String get cityKyotoStationArea => 'Kyoto Station Area';

  @override
  String get cityMaebashi => 'Maebashi';

  @override
  String get cityMaibara => 'Maibara';

  @override
  String get cityMaizuru => 'Maizuru';

  @override
  String get cityMakinohara => 'Makinohara';

  @override
  String get cityMakurazaki => 'Makurazaki';

  @override
  String get cityManiwa => 'Maniwa';

  @override
  String get cityMarugame => 'Marugame';

  @override
  String get cityMarunouchi => 'Marunouchi';

  @override
  String get cityMasuda => 'Masuda';

  @override
  String get cityMatsubara => 'Matsubara';

  @override
  String get cityMatsudo => 'Matsudo';

  @override
  String get cityMatsue => 'Matsue';

  @override
  String get cityMatsumoto => 'Matsumoto';

  @override
  String get cityMatsusaka => 'Matsusaka';

  @override
  String get cityMatsuura => 'Matsuura';

  @override
  String get cityMatsuyama => 'Matsuyama';

  @override
  String get cityMie => 'Mie';

  @override
  String get cityMihara => 'Mihara';

  @override
  String get cityMikasa => 'Mikasa';

  @override
  String get cityMiki => 'Miki';

  @override
  String get cityMima => 'Mima';

  @override
  String get cityMimasaka => 'Mimasaka';

  @override
  String get cityMinamiAlps => 'Minami-Alps';

  @override
  String get cityMinamiawaji => 'Minamiawaji';

  @override
  String get cityMinamiboso => 'Minamiboso';

  @override
  String get cityMinamisatsuma => 'Minamisatsuma';

  @override
  String get cityMinamata => 'Minamata';

  @override
  String get cityMinamishimabara => 'Minamishimabara';

  @override
  String get cityMinamisoma => 'Minamisoma';

  @override
  String get cityMinamiuonuma => 'Minamiuonuma';

  @override
  String get cityMinatoMirai => 'Minato Mirai';

  @override
  String get cityMine => 'Mine';

  @override
  String get cityMinoh => 'Minoh';

  @override
  String get cityMino => 'Mino';

  @override
  String get cityMinokamo => 'Minokamo';

  @override
  String get cityMisato => 'Misato';

  @override
  String get cityMisawa => 'Misawa';

  @override
  String get cityMishima => 'Mishima';

  @override
  String get cityMito => 'Mito';

  @override
  String get cityMitoyo => 'Mitoyo';

  @override
  String get cityMitsuke => 'Mitsuke';

  @override
  String get cityMiyagi => 'Miyagi';

  @override
  String get cityMiyako => 'Miyako';

  @override
  String get cityMiyakojima => 'Miyakojima';

  @override
  String get cityMiyakonojo => 'Miyakonojo';

  @override
  String get cityMiyama => 'Miyama';

  @override
  String get cityMiyawaka => 'Miyawaka';

  @override
  String get cityMiyazaki => 'Miyazaki';

  @override
  String get cityMiyazakiCity => 'Miyazaki City';

  @override
  String get cityMiyazu => 'Miyazu';

  @override
  String get cityMiyoshi => 'Miyoshi';

  @override
  String get cityMizuho => 'Mizuho';

  @override
  String get cityMizunami => 'Mizunami';

  @override
  String get cityMobara => 'Mobara';

  @override
  String get cityMoka => 'Moka';

  @override
  String get cityMoriguchi => 'Moriguchi';

  @override
  String get cityMorioka => 'Morioka';

  @override
  String get cityMoriya => 'Moriya';

  @override
  String get cityMoriyama => 'Moriyama';

  @override
  String get cityMotomiya => 'Motomiya';

  @override
  String get cityMotosu => 'Motosu';

  @override
  String get cityMuko => 'Muko';

  @override
  String get cityMunakata => 'Munakata';

  @override
  String get cityMurakami => 'Murakami';

  @override
  String get cityMurayama => 'Murayama';

  @override
  String get cityMonbetsu => 'Monbetsu';

  @override
  String get cityMuroran => 'Muroran';

  @override
  String get cityMuroto => 'Muroto';

  @override
  String get cityMutsu => 'Mutsu';

  @override
  String get cityMyoko => 'Myoko';

  @override
  String get cityNabari => 'Nabari';

  @override
  String get cityNagai => 'Nagai';

  @override
  String get cityNagahama => 'Nagahama';

  @override
  String get cityNagakute => 'Nagakute';

  @override
  String get cityNagano => 'Nagano';

  @override
  String get cityNaganoCity => 'Nagano City';

  @override
  String get cityNagaoka => 'Nagaoka';

  @override
  String get cityNagaokakyo => 'Nagaokakyo';

  @override
  String get cityNagareyama => 'Nagareyama';

  @override
  String get cityNagasaki => 'Nagasaki';

  @override
  String get cityNagasakiCity => 'Nagasaki City';

  @override
  String get cityNagato => 'Nagato';

  @override
  String get cityNagoya => 'Nagoya';

  @override
  String get cityNago => 'Nago';

  @override
  String get cityNaha => 'Naha';

  @override
  String get cityNakagawa => 'Nakagawa';

  @override
  String get cityNakagyo => 'Nakagyo';

  @override
  String get cityNakama => 'Nakama';

  @override
  String get cityNakamura => 'Nakamura';

  @override
  String get cityNaniwa => 'Naniwa';

  @override
  String get cityNakanoshima => 'Nakanoshima';

  @override
  String get cityNakatsugawa => 'Nakatsugawa';

  @override
  String get cityNakatsu => 'Nakatsu';

  @override
  String get cityNamba => 'Namba';

  @override
  String get cityNamerikawa => 'Namerikawa';

  @override
  String get cityNankoku => 'Nankoku';

  @override
  String get cityNanao => 'Nanao';

  @override
  String get cityNanjo => 'Nanjo';

  @override
  String get cityNantan => 'Nantan';

  @override
  String get cityNanto => 'Nanto';

  @override
  String get cityNanyo => 'Nanyo';

  @override
  String get cityNayoro => 'Nayoro';

  @override
  String get cityNara => 'Nara';

  @override
  String get cityNaraCity => 'Nara City';

  @override
  String get cityNarashino => 'Narashino';

  @override
  String get cityNarita => 'Narita';

  @override
  String get cityNaruto => 'Naruto';

  @override
  String get cityNasushiobara => 'Nasushiobara';

  @override
  String get cityNasukarasuyama => 'Nasukarasuyama';

  @override
  String get cityNatori => 'Natori';

  @override
  String get cityNemuro => 'Nemuro';

  @override
  String get cityNeyagawa => 'Neyagawa';

  @override
  String get cityNichinan => 'Nichinan';

  @override
  String get cityNiigata => 'Niigata';

  @override
  String get cityNiigataCity => 'Niigata City';

  @override
  String get cityNiihama => 'Niihama';

  @override
  String get cityNiimi => 'Niimi';

  @override
  String get cityNiiza => 'Niiza';

  @override
  String get cityNihonmatsu => 'Nihonmatsu';

  @override
  String get cityNikaho => 'Nikaho';

  @override
  String get cityNikko => 'Nikko';

  @override
  String get cityNirasaki => 'Nirasaki';

  @override
  String get cityNiseko => 'Niseko';

  @override
  String get cityNishikyo => 'Nishikyo';

  @override
  String get cityNishinomiya => 'Nishinomiya';

  @override
  String get cityNishinari => 'Nishinari';

  @override
  String get cityNishinoomote => 'Nishinoomote';

  @override
  String get cityNisshin => 'Nisshin';

  @override
  String get cityNishio => 'Nishio';

  @override
  String get cityNishiwaki => 'Nishiwaki';

  @override
  String get cityNobeoka => 'Nobeoka';

  @override
  String get cityNoboribetsu => 'Noboribetsu';

  @override
  String get cityNoda => 'Noda';

  @override
  String get cityNogata => 'Nogata';

  @override
  String get cityNomi => 'Nomi';

  @override
  String get cityNonoichi => 'Nonoichi';

  @override
  String get cityNoshiro => 'Noshiro';

  @override
  String get cityNumata => 'Numata';

  @override
  String get cityNumazu => 'Numazu';

  @override
  String get cityOamishirasato => 'Oamishirasato';

  @override
  String get cityObanazawa => 'Obanazawa';

  @override
  String get cityObama => 'Obama';

  @override
  String get cityObihiro => 'Obihiro';

  @override
  String get cityObu => 'Obu';

  @override
  String get cityOda => 'Oda';

  @override
  String get cityOdaiba => 'Odaiba';

  @override
  String get cityOdate => 'Odate';

  @override
  String get cityOdawara => 'Odawara';

  @override
  String get cityOfunato => 'Ofunato';

  @override
  String get cityOgaki => 'Ogaki';

  @override
  String get cityOgi => 'Ogi';

  @override
  String get cityOgori => 'Ogori';

  @override
  String get cityOita => 'Oita';

  @override
  String get cityOitaCity => 'Oita City';

  @override
  String get cityOjiya => 'Ojiya';

  @override
  String get cityOkawa => 'Okawa';

  @override
  String get cityOkaya => 'Okaya';

  @override
  String get cityOkayama => 'Okayama';

  @override
  String get cityOkayamaCity => 'Okayama City';

  @override
  String get cityOkazaki => 'Okazaki';

  @override
  String get cityOkegawa => 'Okegawa';

  @override
  String get cityOkinawa => 'Okinawa';

  @override
  String get cityOmaezaki => 'Omaezaki';

  @override
  String get cityOmachi => 'Omachi';

  @override
  String get cityOmihachiman => 'Omihachiman';

  @override
  String get cityOmiya => 'Omiya';

  @override
  String get cityOmuta => 'Omuta';

  @override
  String get cityOmura => 'Omura';

  @override
  String get cityOnojo => 'Onojo';

  @override
  String get cityOnomichi => 'Onomichi';

  @override
  String get cityOno => 'Ono';

  @override
  String get cityOsaka => 'Osaka';

  @override
  String get cityOsakaCity => 'Osaka City';

  @override
  String get cityOsakasayama => 'Osakasayama';

  @override
  String get cityOsaki => 'Osaki';

  @override
  String get cityOshu => 'Oshu';

  @override
  String get cityOtake => 'Otake';

  @override
  String get cityOtaru => 'Otaru';

  @override
  String get cityOhtawara => 'Ohtawara';

  @override
  String get cityOtsu => 'Otsu';

  @override
  String get cityOtsuki => 'Otsuki';

  @override
  String get cityOwariasahi => 'Owariasahi';

  @override
  String get cityOwase => 'Owase';

  @override
  String get cityOyabe => 'Oyabe';

  @override
  String get cityOyama => 'Oyama';

  @override
  String get cityOzu => 'Ozu';

  @override
  String get cityRikuzentakata => 'Rikuzentakata';

  @override
  String get cityRitto => 'Ritto';

  @override
  String get cityRoppongi => 'Roppongi';

  @override
  String get cityRumoi => 'Rumoi';

  @override
  String get cityRyugasaki => 'Ryugasaki';

  @override
  String get citySabae => 'Sabae';

  @override
  String get citySado => 'Sado';

  @override
  String get citySaga => 'Saga';

  @override
  String get citySagaCity => 'Saga City';

  @override
  String get citySagae => 'Sagae';

  @override
  String get citySagamihara => 'Sagamihara';

  @override
  String get citySaijo => 'Saijo';

  @override
  String get citySaiki => 'Saiki';

  @override
  String get citySaikai => 'Saikai';

  @override
  String get citySaitama => 'Saitama';

  @override
  String get citySaito => 'Saito';

  @override
  String get citySakado => 'Sakado';

  @override
  String get citySakai => 'Sakai';

  @override
  String get citySakaide => 'Sakaide';

  @override
  String get citySakaiminato => 'Sakaiminato';

  @override
  String get citySakata => 'Sakata';

  @override
  String get citySakura => 'Sakura';

  @override
  String get citySakurai => 'Sakurai';

  @override
  String get citySaku => 'Saku';

  @override
  String get citySanda => 'Sanda';

  @override
  String get citySangenjaya => 'Sangenjaya';

  @override
  String get citySanjo => 'Sanjo';

  @override
  String get citySanmu => 'Sanmu';

  @override
  String get citySano => 'Sano';

  @override
  String get citySanuki => 'Sanuki';

  @override
  String get citySanyoOnoda => 'Sanyo-Onoda';

  @override
  String get citySasayama => 'Sasayama';

  @override
  String get citySasebo => 'Sasebo';

  @override
  String get citySatsuma => 'Satsuma';

  @override
  String get citySatsumasendai => 'Satsumasendai';

  @override
  String get citySayama => 'Sayama';

  @override
  String get citySawara => 'Sawara';

  @override
  String get citySeiyo => 'Seiyo';

  @override
  String get citySeki => 'Seki';

  @override
  String get citySemboku => 'Semboku';

  @override
  String get citySendai => 'Sendai';

  @override
  String get citySennan => 'Sennan';

  @override
  String get cityShibetsu => 'Shibetsu';

  @override
  String get citySeto => 'Seto';

  @override
  String get citySetouchi => 'Setouchi';

  @override
  String get citySettsu => 'Settsu';

  @override
  String get cityShibata => 'Shibata';

  @override
  String get cityShibukawa => 'Shibukawa';

  @override
  String get cityShiga => 'Shiga';

  @override
  String get cityShiki => 'Shiki';

  @override
  String get cityShikokuchuo => 'Shikokuchuo';

  @override
  String get cityShima => 'Shima';

  @override
  String get cityShimabara => 'Shimabara';

  @override
  String get cityShimada => 'Shimada';

  @override
  String get cityShimane => 'Shimane';

  @override
  String get cityShimanto => 'Shimanto';

  @override
  String get cityShimoda => 'Shimoda';

  @override
  String get cityShimokitazawa => 'Shimokitazawa';

  @override
  String get cityShimonoseki => 'Shimonoseki';

  @override
  String get cityShimotsuke => 'Shimotsuke';

  @override
  String get cityShimotsuma => 'Shimotsuma';

  @override
  String get cityShingu => 'Shingu';

  @override
  String get cityShinjo => 'Shinjo';

  @override
  String get cityShinsaibashi => 'Shinsaibashi';

  @override
  String get cityShinsho => 'Shinshiro';

  @override
  String get cityShiogama => 'Shiogama';

  @override
  String get cityShiojiri => 'Shiojiri';

  @override
  String get cityShijonawate => 'Shijonawate';

  @override
  String get cityShiraoka => 'Shiraoka';

  @override
  String get cityShirakawa => 'Shirakawa';

  @override
  String get cityShiroishi => 'Shiroishi';

  @override
  String get cityShiroi => 'Shiroi';

  @override
  String get cityShiwa => 'Shiwa';

  @override
  String get cityShiso => 'Shiso';

  @override
  String get cityShizuoka => 'Shizuoka';

  @override
  String get cityShizuokaCity => 'Shizuoka City';

  @override
  String get cityShobara => 'Shobara';

  @override
  String get cityShowa => 'Showa';

  @override
  String get cityShunan => 'Shunan';

  @override
  String get citySodegaura => 'Sodegaura';

  @override
  String get citySoja => 'Soja';

  @override
  String get citySoka => 'Soka';

  @override
  String get citySoma => 'Soma';

  @override
  String get citySoo => 'Soo';

  @override
  String get citySosa => 'Sosa';

  @override
  String get citySuita => 'Suita';

  @override
  String get citySukagawa => 'Sukagawa';

  @override
  String get citySukumo => 'Sukumo';

  @override
  String get citySumoto => 'Sumoto';

  @override
  String get citySunagawa => 'Sunagawa';

  @override
  String get citySusaki => 'Susaki';

  @override
  String get citySusono => 'Susono';

  @override
  String get citySusukino => 'Susukino';

  @override
  String get citySuwa => 'Suwa';

  @override
  String get citySuzu => 'Suzu';

  @override
  String get citySuzaka => 'Suzaka';

  @override
  String get citySuzuka => 'Suzuka';

  @override
  String get cityTagajo => 'Tagajo';

  @override
  String get cityTagawa => 'Tagawa';

  @override
  String get cityTainai => 'Tainai';

  @override
  String get cityTaisho => 'Taisho';

  @override
  String get cityTajimi => 'Tajimi';

  @override
  String get cityTakahagi => 'Takahagi';

  @override
  String get cityTakahama => 'Takahama';

  @override
  String get cityTakahashi => 'Takahashi';

  @override
  String get cityTakikawa => 'Takikawa';

  @override
  String get cityTaku => 'Taku';

  @override
  String get cityTakaishi => 'Takaishi';

  @override
  String get cityTakamatsu => 'Takamatsu';

  @override
  String get cityTakaoka => 'Takaoka';

  @override
  String get cityTakasago => 'Takasago';

  @override
  String get cityTakasaki => 'Takasaki';

  @override
  String get cityTakashima => 'Takashima';

  @override
  String get cityTakarazuka => 'Takarazuka';

  @override
  String get cityTakatsuki => 'Takatsuki';

  @override
  String get cityTakayama => 'Takayama';

  @override
  String get cityTakeo => 'Takeo';

  @override
  String get cityTakehara => 'Takehara';

  @override
  String get cityTaketa => 'Taketa';

  @override
  String get cityTakizawa => 'Takizawa';

  @override
  String get cityTamana => 'Tamana';

  @override
  String get cityTamano => 'Tamano';

  @override
  String get cityTamba => 'Tanba';

  @override
  String get cityTambaSasayama => 'Tamba-Sasayama';

  @override
  String get cityTamura => 'Tamura';

  @override
  String get cityTahara => 'Tahara';

  @override
  String get cityTanabe => 'Tanabe';

  @override
  String get cityTatebayashi => 'Tatebayashi';

  @override
  String get cityTatsuno => 'Tatsuno';

  @override
  String get cityTarumizu => 'Tarumizu';

  @override
  String get cityTendo => 'Tendo';

  @override
  String get cityTempaku => 'Tempaku';

  @override
  String get cityTenjinCentral => 'Tenjin Central';

  @override
  String get cityTenri => 'Tenri';

  @override
  String get cityToba => 'Toba';

  @override
  String get cityTochigi => 'Tochigi';

  @override
  String get cityToda => 'Toda';

  @override
  String get cityTogane => 'Togane';

  @override
  String get cityToki => 'Toki';

  @override
  String get cityTomiya => 'Tomiya';

  @override
  String get cityTokai => 'Tokai';

  @override
  String get cityTokamachi => 'Tokamachi';

  @override
  String get cityTokoname => 'Tokoname';

  @override
  String get cityTokorozawa => 'Tokorozawa';

  @override
  String get cityTokushima => 'Tokushima';

  @override
  String get cityTokushimaCity => 'Tokushima City';

  @override
  String get cityTokyo => 'Tokyo';

  @override
  String get cityTomakomai => 'Tomakomai';

  @override
  String get cityTome => 'Tome';

  @override
  String get cityTomi => 'Tomi';

  @override
  String get cityTomigusuku => 'Tomigusuku';

  @override
  String get cityTomioka => 'Tomioka';

  @override
  String get cityTomisato => 'Tomisato';

  @override
  String get cityTonami => 'Tonami';

  @override
  String get cityTondabayashi => 'Tondabayashi';

  @override
  String get cityTono => 'Tono';

  @override
  String get cityToon => 'Toon';

  @override
  String get cityToride => 'Toride';

  @override
  String get cityTosa => 'Tosa';

  @override
  String get cityTosashimizu => 'Tosashimizu';

  @override
  String get cityTosu => 'Tosu';

  @override
  String get cityTottori => 'Tottori';

  @override
  String get cityTottoriCity => 'Tottori City';

  @override
  String get cityTowada => 'Towada';

  @override
  String get cityToyama => 'Toyama';

  @override
  String get cityToyamaCity => 'Toyama City';

  @override
  String get cityToyohashi => 'Toyohashi';

  @override
  String get cityToyokawa => 'Toyokawa';

  @override
  String get cityToyonaka => 'Toyonaka';

  @override
  String get cityToyoake => 'Toyoake';

  @override
  String get cityToyooka => 'Toyooka';

  @override
  String get cityToyota => 'Toyota';

  @override
  String get cityTsubame => 'Tsubame';

  @override
  String get cityTsuchiura => 'Tsuchiura';

  @override
  String get cityTsugaru => 'Tsugaru';

  @override
  String get cityTsukuba => 'Tsukuba';

  @override
  String get cityTsukumi => 'Tsukumi';

  @override
  String get cityTsu => 'Tsu';

  @override
  String get cityTsuruga => 'Tsuruga';

  @override
  String get cityTsurugashima => 'Tsurugashima';

  @override
  String get cityTsuruoka => 'Tsuruoka';

  @override
  String get cityTsuru => 'Tsuru';

  @override
  String get cityTsushima => 'Tsushima';

  @override
  String get cityTsuyama => 'Tsuyama';

  @override
  String get cityUbe => 'Ube';

  @override
  String get cityUchi => 'Uchiko';

  @override
  String get cityUda => 'Uda';

  @override
  String get cityUeda => 'Ueda';

  @override
  String get cityUenohara => 'Uenohara';

  @override
  String get cityUeno => 'Ueno';

  @override
  String get cityUji => 'Uji';

  @override
  String get cityUkiha => 'Ukiha';

  @override
  String get cityUki => 'Uki';

  @override
  String get cityUkyo => 'Ukyo';

  @override
  String get cityUmeda => 'Umeda';

  @override
  String get cityUnnan => 'Unnan';

  @override
  String get cityUnzen => 'Unzen';

  @override
  String get cityUonuma => 'Uonuma';

  @override
  String get cityUozu => 'Uozu';

  @override
  String get cityUrasoe => 'Urasoe';

  @override
  String get cityUrayasu => 'Urayasu';

  @override
  String get cityUreshino => 'Ureshino';

  @override
  String get cityUsuki => 'Usuki';

  @override
  String get cityUruma => 'Uruma';

  @override
  String get cityUrawa => 'Urawa';

  @override
  String get cityUsa => 'Usa';

  @override
  String get cityUtashinai => 'Utashinai';

  @override
  String get cityUshiku => 'Ushiku';

  @override
  String get cityUto => 'Uto';

  @override
  String get cityUtsunomiya => 'Utsunomiya';

  @override
  String get cityUwajima => 'Uwajima';

  @override
  String get cityWajima => 'Wajima';

  @override
  String get cityWakayama => 'Wakayama';

  @override
  String get cityWakayamaCity => 'Wakayama City';

  @override
  String get cityWakkanai => 'Wakkanai';

  @override
  String get cityWako => 'Wako';

  @override
  String get cityWarabi => 'Warabi';

  @override
  String get cityYabu => 'Yabu';

  @override
  String get cityYachimat => 'Yachimata';

  @override
  String get cityYachiyo => 'Yachiyo';

  @override
  String get cityYaita => 'Yaita';

  @override
  String get cityYaizu => 'Yaizu';

  @override
  String get cityYakumo => 'Yame';

  @override
  String get cityYamagata => 'Yamagata';

  @override
  String get cityYamagataCity => 'Yamagata City';

  @override
  String get cityYamaguchi => 'Yamaguchi';

  @override
  String get cityYamaguchiCity => 'Yamaguchi City';

  @override
  String get cityYamaga => 'Yamaga';

  @override
  String get cityYamanashi => 'Yamanashi';

  @override
  String get cityYamashina => 'Yamashina';

  @override
  String get cityYamato => 'Yamato';

  @override
  String get cityYamatokoriyama => 'Yamatokoriyama';

  @override
  String get cityYamatoTakada => 'Yamato-Takada';

  @override
  String get cityYanagawa => 'Yanagawa';

  @override
  String get cityYanai => 'Yanai';

  @override
  String get cityYame => 'Yame';

  @override
  String get cityYao => 'Yao';

  @override
  String get cityYashio => 'Yashio';

  @override
  String get cityYasu => 'Yasu';

  @override
  String get cityYasugi => 'Yasugi';

  @override
  String get cityYatomi => 'Yatomi';

  @override
  String get cityYatsushiro => 'Yatsushiro';

  @override
  String get cityYawata => 'Yawata';

  @override
  String get cityYawatahama => 'Yawatahama';

  @override
  String get cityYokkaichi => 'Yokkaichi';

  @override
  String get cityYokohama => 'Yokohama';

  @override
  String get cityYokosuka => 'Yokosuka';

  @override
  String get cityYodogawa => 'Yodogawa';

  @override
  String get cityYokote => 'Yokote';

  @override
  String get cityYonago => 'Yonago';

  @override
  String get cityYonezawa => 'Yonezawa';

  @override
  String get cityYoshikawa => 'Yoshikawa';

  @override
  String get cityYoshinogawa => 'Yoshinogawa';

  @override
  String get cityYotsukaido => 'Yotsukaido';

  @override
  String get cityYubari => 'Yubari';

  @override
  String get cityYotsuya => 'Yotsuya';

  @override
  String get cityYufu => 'Yufu';

  @override
  String get cityYuki => 'Yuki';

  @override
  String get cityYukuhashi => 'Yukuhashi';

  @override
  String get cityYuzawa => 'Yuzawa';

  @override
  String get cityZama => 'Zama';

  @override
  String get cityZentsuji => 'Zentsuji';

  @override
  String get cityZushi => 'Zushi';
}

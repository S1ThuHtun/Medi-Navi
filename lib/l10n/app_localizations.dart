import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh'),
  ];

  /// Asking the user what Language would they like to start the app with
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// The text to go to the SignUp and Login screen
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Shows the title of the language selection box when the language selection is pressed
  ///
  /// In en, this message translates to:
  /// **'Choose the Language'**
  String get chooseLanguage;

  /// Shows what language is selected in the messagebox
  ///
  /// In en, this message translates to:
  /// **'English is selected'**
  String get selectedLanguage;

  /// Text for Login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// After logged the snackbar will show logged in as email
  ///
  /// In en, this message translates to:
  /// **'Logged in as {email}'**
  String loginAs(Object email);

  /// After signed up the snackbar will show signed up as email
  ///
  /// In en, this message translates to:
  /// **'Singed up as {email}'**
  String signedUpAs(Object email);

  /// When user is not filling email, this message will be shown
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// When user input invalid method, this message will show
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// No description provided for @enteredPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enteredPasswordMessage;

  /// No description provided for @enteredPasswordErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Password must have at least 6 characters'**
  String get enteredPasswordErrorMessage;

  /// No description provided for @confirmPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordMessage;

  /// No description provided for @confirmPasswordErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Password and Confirm Password are not matched'**
  String get confirmPasswordErrorMessage;

  /// Text for Logout
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// Confirmation message before logging out
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// Text for Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Text for SignUp
  ///
  /// In en, this message translates to:
  /// **'SignUp'**
  String get signUp;

  /// Text for SignUp new users
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? SignUp'**
  String get newSignUp;

  /// Text for old users to login
  ///
  /// In en, this message translates to:
  /// **'Already have an account! Login'**
  String get oldLogin;

  /// Input for email address
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// Adding password for the mail
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Adding the same password for confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Title of the endDrawer from the appbar in Login screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get member;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'Your Favorite Facilities List is Empty'**
  String get noFavorites;

  /// No description provided for @tapHeartToSave.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on any facility to save it here'**
  String get tapHeartToSave;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @medicalServices.
  ///
  /// In en, this message translates to:
  /// **'Medical Services'**
  String get medicalServices;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @foundNearby.
  ///
  /// In en, this message translates to:
  /// **'Found {count} nearby'**
  String foundNearby(int count);

  /// No description provided for @within5km.
  ///
  /// In en, this message translates to:
  /// **'Within 5km'**
  String get within5km;

  /// No description provided for @kmAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String kmAway(String distance);

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @viewOnMap.
  ///
  /// In en, this message translates to:
  /// **'View on Map'**
  String get viewOnMap;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @directions.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @openNow.
  ///
  /// In en, this message translates to:
  /// **'Open Now'**
  String get openNow;

  /// No description provided for @away.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String away(Object distance);

  /// No description provided for @getDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get getDirections;

  /// No description provided for @updateRoute.
  ///
  /// In en, this message translates to:
  /// **'Update Route'**
  String get updateRoute;

  /// No description provided for @visitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get visitWebsite;

  /// No description provided for @wheelchairAccessible.
  ///
  /// In en, this message translates to:
  /// **'Wheelchair accessible'**
  String get wheelchairAccessible;

  /// No description provided for @limitedWheelchairAccess.
  ///
  /// In en, this message translates to:
  /// **'Limited wheelchair access'**
  String get limitedWheelchairAccess;

  /// No description provided for @openInGoogleMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in Google Maps'**
  String get openInGoogleMaps;

  /// No description provided for @noPhoneAvailable.
  ///
  /// In en, this message translates to:
  /// **'No phone number available for this service'**
  String get noPhoneAvailable;

  /// No description provided for @invalidPhoneFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format'**
  String get invalidPhoneFormat;

  /// No description provided for @cannotOpenPhoneDialer.
  ///
  /// In en, this message translates to:
  /// **'Cannot open phone dialer'**
  String get cannotOpenPhoneDialer;

  /// No description provided for @errorOpeningMaps.
  ///
  /// In en, this message translates to:
  /// **'Unable to open Google Maps'**
  String get errorOpeningMaps;

  /// No description provided for @transitDirectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Transit Directions'**
  String get transitDirectionsTitle;

  /// No description provided for @transitDirectionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Transit directions are best viewed in Google Maps.\n\nWould you like to open Google Maps for transit directions?'**
  String get transitDirectionsMessage;

  /// No description provided for @openMaps.
  ///
  /// In en, this message translates to:
  /// **'Open Maps'**
  String get openMaps;

  /// No description provided for @categoryGeneralServices.
  ///
  /// In en, this message translates to:
  /// **'General Services'**
  String get categoryGeneralServices;

  /// No description provided for @categorySpecializedServices.
  ///
  /// In en, this message translates to:
  /// **'Specialized Services'**
  String get categorySpecializedServices;

  /// No description provided for @categorySurgicalServices.
  ///
  /// In en, this message translates to:
  /// **'Surgical Services'**
  String get categorySurgicalServices;

  /// No description provided for @categoryRehabilitationServices.
  ///
  /// In en, this message translates to:
  /// **'Rehabilitation Services'**
  String get categoryRehabilitationServices;

  /// No description provided for @categoryDiagnosticServices.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic Services'**
  String get categoryDiagnosticServices;

  /// No description provided for @categoryEmergencyServices.
  ///
  /// In en, this message translates to:
  /// **'Emergency Services'**
  String get categoryEmergencyServices;

  /// No description provided for @categoryMaternityWomensHealth.
  ///
  /// In en, this message translates to:
  /// **'Maternity & Women\'s Health'**
  String get categoryMaternityWomensHealth;

  /// No description provided for @categoryPharmacyServices.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy Services'**
  String get categoryPharmacyServices;

  /// No description provided for @categoryMentalHealthServices.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Services'**
  String get categoryMentalHealthServices;

  /// No description provided for @categoryAlternativeMedicine.
  ///
  /// In en, this message translates to:
  /// **'Alternative Medicine'**
  String get categoryAlternativeMedicine;

  /// No description provided for @serviceGeneralMedicine.
  ///
  /// In en, this message translates to:
  /// **'General Medicine'**
  String get serviceGeneralMedicine;

  /// No description provided for @serviceEmergencyCare.
  ///
  /// In en, this message translates to:
  /// **'Emergency Care'**
  String get serviceEmergencyCare;

  /// No description provided for @serviceFamilyMedicine.
  ///
  /// In en, this message translates to:
  /// **'Family Medicine'**
  String get serviceFamilyMedicine;

  /// No description provided for @servicePreventativeMedicine.
  ///
  /// In en, this message translates to:
  /// **'Preventative Medicine'**
  String get servicePreventativeMedicine;

  /// No description provided for @serviceHealthCheckups.
  ///
  /// In en, this message translates to:
  /// **'Health Check-ups'**
  String get serviceHealthCheckups;

  /// No description provided for @serviceUrgentCare.
  ///
  /// In en, this message translates to:
  /// **'Urgent Care'**
  String get serviceUrgentCare;

  /// No description provided for @serviceCardiology.
  ///
  /// In en, this message translates to:
  /// **'Cardiology'**
  String get serviceCardiology;

  /// No description provided for @serviceDermatology.
  ///
  /// In en, this message translates to:
  /// **'Dermatology'**
  String get serviceDermatology;

  /// No description provided for @serviceEndocrinology.
  ///
  /// In en, this message translates to:
  /// **'Endocrinology'**
  String get serviceEndocrinology;

  /// No description provided for @serviceGastroenterology.
  ///
  /// In en, this message translates to:
  /// **'Gastroenterology'**
  String get serviceGastroenterology;

  /// No description provided for @serviceHematology.
  ///
  /// In en, this message translates to:
  /// **'Hematology'**
  String get serviceHematology;

  /// No description provided for @serviceNephrology.
  ///
  /// In en, this message translates to:
  /// **'Nephrology'**
  String get serviceNephrology;

  /// No description provided for @serviceNeurology.
  ///
  /// In en, this message translates to:
  /// **'Neurology'**
  String get serviceNeurology;

  /// No description provided for @serviceObstetricsGynecology.
  ///
  /// In en, this message translates to:
  /// **'Obstetrics and Gynecology'**
  String get serviceObstetricsGynecology;

  /// No description provided for @serviceOphthalmology.
  ///
  /// In en, this message translates to:
  /// **'Ophthalmology'**
  String get serviceOphthalmology;

  /// No description provided for @serviceOrthopedics.
  ///
  /// In en, this message translates to:
  /// **'Orthopedics'**
  String get serviceOrthopedics;

  /// No description provided for @servicePediatrics.
  ///
  /// In en, this message translates to:
  /// **'Pediatrics'**
  String get servicePediatrics;

  /// No description provided for @servicePsychiatry.
  ///
  /// In en, this message translates to:
  /// **'Psychiatry'**
  String get servicePsychiatry;

  /// No description provided for @serviceRheumatology.
  ///
  /// In en, this message translates to:
  /// **'Rheumatology'**
  String get serviceRheumatology;

  /// No description provided for @servicePulmonology.
  ///
  /// In en, this message translates to:
  /// **'Pulmonology'**
  String get servicePulmonology;

  /// No description provided for @serviceUrology.
  ///
  /// In en, this message translates to:
  /// **'Urology'**
  String get serviceUrology;

  /// No description provided for @serviceGeneralSurgery.
  ///
  /// In en, this message translates to:
  /// **'General Surgery'**
  String get serviceGeneralSurgery;

  /// No description provided for @serviceCardiacSurgery.
  ///
  /// In en, this message translates to:
  /// **'Cardiac Surgery'**
  String get serviceCardiacSurgery;

  /// No description provided for @serviceOrthopedicSurgery.
  ///
  /// In en, this message translates to:
  /// **'Orthopedic Surgery'**
  String get serviceOrthopedicSurgery;

  /// No description provided for @serviceNeurosurgery.
  ///
  /// In en, this message translates to:
  /// **'Neurosurgery'**
  String get serviceNeurosurgery;

  /// No description provided for @servicePlasticSurgery.
  ///
  /// In en, this message translates to:
  /// **'Plastic Surgery'**
  String get servicePlasticSurgery;

  /// No description provided for @servicePediatricSurgery.
  ///
  /// In en, this message translates to:
  /// **'Pediatric Surgery'**
  String get servicePediatricSurgery;

  /// No description provided for @serviceObstetricSurgery.
  ///
  /// In en, this message translates to:
  /// **'Obstetric Surgery'**
  String get serviceObstetricSurgery;

  /// No description provided for @serviceTraumaSurgery.
  ///
  /// In en, this message translates to:
  /// **'Trauma Surgery'**
  String get serviceTraumaSurgery;

  /// No description provided for @servicePhysicalTherapy.
  ///
  /// In en, this message translates to:
  /// **'Physical Therapy'**
  String get servicePhysicalTherapy;

  /// No description provided for @serviceOccupationalTherapy.
  ///
  /// In en, this message translates to:
  /// **'Occupational Therapy'**
  String get serviceOccupationalTherapy;

  /// No description provided for @serviceSpeechTherapy.
  ///
  /// In en, this message translates to:
  /// **'Speech Therapy'**
  String get serviceSpeechTherapy;

  /// No description provided for @serviceCardiacRehabilitation.
  ///
  /// In en, this message translates to:
  /// **'Cardiac Rehabilitation'**
  String get serviceCardiacRehabilitation;

  /// No description provided for @serviceNeurologicalRehabilitation.
  ///
  /// In en, this message translates to:
  /// **'Neurological Rehabilitation'**
  String get serviceNeurologicalRehabilitation;

  /// No description provided for @serviceLaboratoryTests.
  ///
  /// In en, this message translates to:
  /// **'Laboratory Tests'**
  String get serviceLaboratoryTests;

  /// No description provided for @serviceRadiology.
  ///
  /// In en, this message translates to:
  /// **'Radiology'**
  String get serviceRadiology;

  /// No description provided for @servicePathology.
  ///
  /// In en, this message translates to:
  /// **'Pathology'**
  String get servicePathology;

  /// No description provided for @serviceEndoscopy.
  ///
  /// In en, this message translates to:
  /// **'Endoscopy'**
  String get serviceEndoscopy;

  /// No description provided for @serviceECG.
  ///
  /// In en, this message translates to:
  /// **'ECG'**
  String get serviceECG;

  /// No description provided for @serviceEEG.
  ///
  /// In en, this message translates to:
  /// **'EEG'**
  String get serviceEEG;

  /// No description provided for @serviceEmergencyRoom.
  ///
  /// In en, this message translates to:
  /// **'Emergency Room (ER)'**
  String get serviceEmergencyRoom;

  /// No description provided for @serviceTraumaCare.
  ///
  /// In en, this message translates to:
  /// **'Trauma Care'**
  String get serviceTraumaCare;

  /// No description provided for @serviceICU.
  ///
  /// In en, this message translates to:
  /// **'Intensive Care Unit (ICU)'**
  String get serviceICU;

  /// No description provided for @serviceBurnUnit.
  ///
  /// In en, this message translates to:
  /// **'Burn Unit'**
  String get serviceBurnUnit;

  /// No description provided for @serviceObstetrics.
  ///
  /// In en, this message translates to:
  /// **'Obstetrics'**
  String get serviceObstetrics;

  /// No description provided for @serviceGynecology.
  ///
  /// In en, this message translates to:
  /// **'Gynecology'**
  String get serviceGynecology;

  /// No description provided for @serviceFamilyPlanning.
  ///
  /// In en, this message translates to:
  /// **'Family Planning'**
  String get serviceFamilyPlanning;

  /// No description provided for @serviceBreastHealth.
  ///
  /// In en, this message translates to:
  /// **'Breast Health'**
  String get serviceBreastHealth;

  /// No description provided for @servicePrescriptionMedications.
  ///
  /// In en, this message translates to:
  /// **'Prescription Medications'**
  String get servicePrescriptionMedications;

  /// No description provided for @serviceOTCMedications.
  ///
  /// In en, this message translates to:
  /// **'Over-the-Counter Medications'**
  String get serviceOTCMedications;

  /// No description provided for @serviceVaccinations.
  ///
  /// In en, this message translates to:
  /// **'Vaccinations'**
  String get serviceVaccinations;

  /// No description provided for @servicePharmaceuticalConsultations.
  ///
  /// In en, this message translates to:
  /// **'Pharmaceutical Consultations'**
  String get servicePharmaceuticalConsultations;

  /// No description provided for @serviceCompoundingPharmacy.
  ///
  /// In en, this message translates to:
  /// **'Compounding Pharmacy'**
  String get serviceCompoundingPharmacy;

  /// No description provided for @serviceHerbalMedicine.
  ///
  /// In en, this message translates to:
  /// **'Herbal Medicine'**
  String get serviceHerbalMedicine;

  /// No description provided for @serviceCounseling.
  ///
  /// In en, this message translates to:
  /// **'Counseling'**
  String get serviceCounseling;

  /// No description provided for @servicePsychotherapy.
  ///
  /// In en, this message translates to:
  /// **'Psychotherapy'**
  String get servicePsychotherapy;

  /// No description provided for @serviceAddictionTreatment.
  ///
  /// In en, this message translates to:
  /// **'Addiction Treatment'**
  String get serviceAddictionTreatment;

  /// No description provided for @serviceSupportGroups.
  ///
  /// In en, this message translates to:
  /// **'Support Groups'**
  String get serviceSupportGroups;

  /// No description provided for @serviceBehavioralTherapy.
  ///
  /// In en, this message translates to:
  /// **'Behavioral Therapy'**
  String get serviceBehavioralTherapy;

  /// No description provided for @serviceAcupuncture.
  ///
  /// In en, this message translates to:
  /// **'Acupuncture'**
  String get serviceAcupuncture;

  /// No description provided for @serviceChiropracticCare.
  ///
  /// In en, this message translates to:
  /// **'Chiropractic Care'**
  String get serviceChiropracticCare;

  /// No description provided for @serviceMassageTherapy.
  ///
  /// In en, this message translates to:
  /// **'Massage Therapy'**
  String get serviceMassageTherapy;

  /// No description provided for @serviceNaturopathy.
  ///
  /// In en, this message translates to:
  /// **'Naturopathy'**
  String get serviceNaturopathy;

  /// No description provided for @serviceHomeopathy.
  ///
  /// In en, this message translates to:
  /// **'Homeopathy'**
  String get serviceHomeopathy;

  /// No description provided for @selectPrefecture.
  ///
  /// In en, this message translates to:
  /// **'Select Prefecture'**
  String get selectPrefecture;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @selectWard.
  ///
  /// In en, this message translates to:
  /// **'Select Ward'**
  String get selectWard;

  /// No description provided for @useCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get useCurrentLocation;

  /// No description provided for @prefectures.
  ///
  /// In en, this message translates to:
  /// **'Prefectures'**
  String get prefectures;

  /// No description provided for @regionHokkaido.
  ///
  /// In en, this message translates to:
  /// **'Hokkaido Region'**
  String get regionHokkaido;

  /// No description provided for @regionTohoku.
  ///
  /// In en, this message translates to:
  /// **'Tohoku Region'**
  String get regionTohoku;

  /// No description provided for @regionKanto.
  ///
  /// In en, this message translates to:
  /// **'Kanto Region'**
  String get regionKanto;

  /// No description provided for @regionChubu.
  ///
  /// In en, this message translates to:
  /// **'Chubu Region'**
  String get regionChubu;

  /// No description provided for @regionKansai.
  ///
  /// In en, this message translates to:
  /// **'Kansai Region'**
  String get regionKansai;

  /// No description provided for @regionChugoku.
  ///
  /// In en, this message translates to:
  /// **'Chugoku Region'**
  String get regionChugoku;

  /// No description provided for @regionShikoku.
  ///
  /// In en, this message translates to:
  /// **'Shikoku Region'**
  String get regionShikoku;

  /// No description provided for @regionKyushuOkinawa.
  ///
  /// In en, this message translates to:
  /// **'Kyushu & Okinawa Region'**
  String get regionKyushuOkinawa;

  /// No description provided for @citiesDistricts.
  ///
  /// In en, this message translates to:
  /// **'Cities / Districts'**
  String get citiesDistricts;

  /// No description provided for @wardsAreas.
  ///
  /// In en, this message translates to:
  /// **'Wards / Areas'**
  String get wardsAreas;

  /// No description provided for @allOf.
  ///
  /// In en, this message translates to:
  /// **'All of {location}'**
  String allOf(String location);

  /// No description provided for @searchEntirePrefecture.
  ///
  /// In en, this message translates to:
  /// **'Search entire prefecture'**
  String get searchEntirePrefecture;

  /// No description provided for @searchEntireCity.
  ///
  /// In en, this message translates to:
  /// **'Search entire city'**
  String get searchEntireCity;

  /// No description provided for @locationError.
  ///
  /// In en, this message translates to:
  /// **'Unable to get location. Please enable location services and grant permission.'**
  String get locationError;

  /// No description provided for @selectLocationError.
  ///
  /// In en, this message translates to:
  /// **'Please select a location or enable location services.'**
  String get selectLocationError;

  /// No description provided for @noServicesFound.
  ///
  /// In en, this message translates to:
  /// **'No services found'**
  String get noServicesFound;

  /// No description provided for @tryDifferentLocation.
  ///
  /// In en, this message translates to:
  /// **'Try searching in a different location or service type.'**
  String get tryDifferentLocation;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @gettingLocation.
  ///
  /// In en, this message translates to:
  /// **'Getting your location...'**
  String get gettingLocation;

  /// No description provided for @locationNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Location not available'**
  String get locationNotAvailable;

  /// No description provided for @pullDownToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh or select a location to find nearby medical services'**
  String get pullDownToRefresh;

  /// No description provided for @prefectureTokyo.
  ///
  /// In en, this message translates to:
  /// **'Tokyo'**
  String get prefectureTokyo;

  /// No description provided for @prefectureOsaka.
  ///
  /// In en, this message translates to:
  /// **'Osaka'**
  String get prefectureOsaka;

  /// No description provided for @prefectureKyoto.
  ///
  /// In en, this message translates to:
  /// **'Kyoto'**
  String get prefectureKyoto;

  /// No description provided for @prefectureHokkaido.
  ///
  /// In en, this message translates to:
  /// **'Hokkaido'**
  String get prefectureHokkaido;

  /// No description provided for @prefectureFukuoka.
  ///
  /// In en, this message translates to:
  /// **'Fukuoka'**
  String get prefectureFukuoka;

  /// No description provided for @prefectureYokohama.
  ///
  /// In en, this message translates to:
  /// **'Yokohama'**
  String get prefectureYokohama;

  /// No description provided for @prefectureNagoya.
  ///
  /// In en, this message translates to:
  /// **'Nagoya'**
  String get prefectureNagoya;

  /// No description provided for @prefectureKobe.
  ///
  /// In en, this message translates to:
  /// **'Kobe'**
  String get prefectureKobe;

  /// No description provided for @prefectureHiroshima.
  ///
  /// In en, this message translates to:
  /// **'Hiroshima'**
  String get prefectureHiroshima;

  /// No description provided for @prefectureSendai.
  ///
  /// In en, this message translates to:
  /// **'Sendai'**
  String get prefectureSendai;

  /// No description provided for @prefectureChiba.
  ///
  /// In en, this message translates to:
  /// **'Chiba'**
  String get prefectureChiba;

  /// No description provided for @prefectureKanagawa.
  ///
  /// In en, this message translates to:
  /// **'Kanagawa'**
  String get prefectureKanagawa;

  /// No description provided for @prefectureSaitama.
  ///
  /// In en, this message translates to:
  /// **'Saitama'**
  String get prefectureSaitama;

  /// No description provided for @prefectureShizuoka.
  ///
  /// In en, this message translates to:
  /// **'Shizuoka'**
  String get prefectureShizuoka;

  /// No description provided for @prefectureAichi.
  ///
  /// In en, this message translates to:
  /// **'Aichi'**
  String get prefectureAichi;

  /// No description provided for @prefectureHyogo.
  ///
  /// In en, this message translates to:
  /// **'Hyogo'**
  String get prefectureHyogo;

  /// No description provided for @prefectureNiigata.
  ///
  /// In en, this message translates to:
  /// **'Niigata'**
  String get prefectureNiigata;

  /// No description provided for @prefectureMiyagi.
  ///
  /// In en, this message translates to:
  /// **'Miyagi'**
  String get prefectureMiyagi;

  /// No description provided for @prefectureNagano.
  ///
  /// In en, this message translates to:
  /// **'Nagano'**
  String get prefectureNagano;

  /// No description provided for @prefectureGifu.
  ///
  /// In en, this message translates to:
  /// **'Gifu'**
  String get prefectureGifu;

  /// No description provided for @prefectureGunma.
  ///
  /// In en, this message translates to:
  /// **'Gunma'**
  String get prefectureGunma;

  /// No description provided for @prefectureTochigi.
  ///
  /// In en, this message translates to:
  /// **'Tochigi'**
  String get prefectureTochigi;

  /// No description provided for @prefectureIbaraki.
  ///
  /// In en, this message translates to:
  /// **'Ibaraki'**
  String get prefectureIbaraki;

  /// No description provided for @prefectureOkayama.
  ///
  /// In en, this message translates to:
  /// **'Okayama'**
  String get prefectureOkayama;

  /// No description provided for @prefectureKumamoto.
  ///
  /// In en, this message translates to:
  /// **'Kumamoto'**
  String get prefectureKumamoto;

  /// No description provided for @prefectureKagoshima.
  ///
  /// In en, this message translates to:
  /// **'Kagoshima'**
  String get prefectureKagoshima;

  /// No description provided for @prefectureOkinawa.
  ///
  /// In en, this message translates to:
  /// **'Okinawa'**
  String get prefectureOkinawa;

  /// No description provided for @prefectureNara.
  ///
  /// In en, this message translates to:
  /// **'Nara'**
  String get prefectureNara;

  /// No description provided for @prefectureShiga.
  ///
  /// In en, this message translates to:
  /// **'Shiga'**
  String get prefectureShiga;

  /// No description provided for @prefectureMie.
  ///
  /// In en, this message translates to:
  /// **'Mie'**
  String get prefectureMie;

  /// No description provided for @prefectureWakayama.
  ///
  /// In en, this message translates to:
  /// **'Wakayama'**
  String get prefectureWakayama;

  /// No description provided for @prefectureYamaguchi.
  ///
  /// In en, this message translates to:
  /// **'Yamaguchi'**
  String get prefectureYamaguchi;

  /// No description provided for @prefectureEhime.
  ///
  /// In en, this message translates to:
  /// **'Ehime'**
  String get prefectureEhime;

  /// No description provided for @prefectureKagawa.
  ///
  /// In en, this message translates to:
  /// **'Kagawa'**
  String get prefectureKagawa;

  /// No description provided for @prefectureTokushima.
  ///
  /// In en, this message translates to:
  /// **'Tokushima'**
  String get prefectureTokushima;

  /// No description provided for @prefectureKochi.
  ///
  /// In en, this message translates to:
  /// **'Kochi'**
  String get prefectureKochi;

  /// No description provided for @prefectureFukushima.
  ///
  /// In en, this message translates to:
  /// **'Fukushima'**
  String get prefectureFukushima;

  /// No description provided for @prefectureYamagata.
  ///
  /// In en, this message translates to:
  /// **'Yamagata'**
  String get prefectureYamagata;

  /// No description provided for @prefectureIwate.
  ///
  /// In en, this message translates to:
  /// **'Iwate'**
  String get prefectureIwate;

  /// No description provided for @prefectureAkita.
  ///
  /// In en, this message translates to:
  /// **'Akita'**
  String get prefectureAkita;

  /// No description provided for @prefectureAomori.
  ///
  /// In en, this message translates to:
  /// **'Aomori'**
  String get prefectureAomori;

  /// No description provided for @prefectureIshikawa.
  ///
  /// In en, this message translates to:
  /// **'Ishikawa'**
  String get prefectureIshikawa;

  /// No description provided for @prefectureFukui.
  ///
  /// In en, this message translates to:
  /// **'Fukui'**
  String get prefectureFukui;

  /// No description provided for @prefectureToyama.
  ///
  /// In en, this message translates to:
  /// **'Toyama'**
  String get prefectureToyama;

  /// No description provided for @prefectureYamanashi.
  ///
  /// In en, this message translates to:
  /// **'Yamanashi'**
  String get prefectureYamanashi;

  /// No description provided for @prefectureSaga.
  ///
  /// In en, this message translates to:
  /// **'Saga'**
  String get prefectureSaga;

  /// No description provided for @prefectureNagasaki.
  ///
  /// In en, this message translates to:
  /// **'Nagasaki'**
  String get prefectureNagasaki;

  /// No description provided for @prefectureOita.
  ///
  /// In en, this message translates to:
  /// **'Oita'**
  String get prefectureOita;

  /// No description provided for @prefectureMiyazaki.
  ///
  /// In en, this message translates to:
  /// **'Miyazaki'**
  String get prefectureMiyazaki;

  /// No description provided for @cityShibuya.
  ///
  /// In en, this message translates to:
  /// **'Shibuya'**
  String get cityShibuya;

  /// No description provided for @cityShinjuku.
  ///
  /// In en, this message translates to:
  /// **'Shinjuku'**
  String get cityShinjuku;

  /// No description provided for @cityChiyoda.
  ///
  /// In en, this message translates to:
  /// **'Chiyoda'**
  String get cityChiyoda;

  /// No description provided for @cityMinato.
  ///
  /// In en, this message translates to:
  /// **'Minato'**
  String get cityMinato;

  /// No description provided for @citySetagaya.
  ///
  /// In en, this message translates to:
  /// **'Setagaya'**
  String get citySetagaya;

  /// No description provided for @cityKita.
  ///
  /// In en, this message translates to:
  /// **'Kita'**
  String get cityKita;

  /// No description provided for @cityChuo.
  ///
  /// In en, this message translates to:
  /// **'Chuo'**
  String get cityChuo;

  /// No description provided for @cityTennoji.
  ///
  /// In en, this message translates to:
  /// **'Tennoji'**
  String get cityTennoji;

  /// No description provided for @cityShimogyo.
  ///
  /// In en, this message translates to:
  /// **'Shimogyo'**
  String get cityShimogyo;

  /// No description provided for @cityHigashiyama.
  ///
  /// In en, this message translates to:
  /// **'Higashiyama'**
  String get cityHigashiyama;

  /// No description provided for @citySakyo.
  ///
  /// In en, this message translates to:
  /// **'Sakyo'**
  String get citySakyo;

  /// No description provided for @citySapporo.
  ///
  /// In en, this message translates to:
  /// **'Sapporo'**
  String get citySapporo;

  /// No description provided for @cityHakodate.
  ///
  /// In en, this message translates to:
  /// **'Hakodate'**
  String get cityHakodate;

  /// No description provided for @cityAsahikawa.
  ///
  /// In en, this message translates to:
  /// **'Asahikawa'**
  String get cityAsahikawa;

  /// No description provided for @cityHakata.
  ///
  /// In en, this message translates to:
  /// **'Hakata'**
  String get cityHakata;

  /// No description provided for @cityTenjin.
  ///
  /// In en, this message translates to:
  /// **'Tenjin'**
  String get cityTenjin;

  /// No description provided for @cityNaka.
  ///
  /// In en, this message translates to:
  /// **'Naka'**
  String get cityNaka;

  /// No description provided for @wardShibuya.
  ///
  /// In en, this message translates to:
  /// **'Shibuya Ward'**
  String get wardShibuya;

  /// No description provided for @wardShinjuku.
  ///
  /// In en, this message translates to:
  /// **'Shinjuku Ward'**
  String get wardShinjuku;

  /// No description provided for @wardChiyoda.
  ///
  /// In en, this message translates to:
  /// **'Chiyoda Ward'**
  String get wardChiyoda;

  /// No description provided for @wardTennoji.
  ///
  /// In en, this message translates to:
  /// **'Tennoji Ward'**
  String get wardTennoji;

  /// No description provided for @areaHarajuku.
  ///
  /// In en, this message translates to:
  /// **'Harajuku'**
  String get areaHarajuku;

  /// No description provided for @areaEbisu.
  ///
  /// In en, this message translates to:
  /// **'Ebisu'**
  String get areaEbisu;

  /// No description provided for @areaKabukicho.
  ///
  /// In en, this message translates to:
  /// **'Kabukicho'**
  String get areaKabukicho;

  /// No description provided for @areaYotsuya.
  ///
  /// In en, this message translates to:
  /// **'Yotsuya'**
  String get areaYotsuya;

  /// No description provided for @areaMarunouchi.
  ///
  /// In en, this message translates to:
  /// **'Marunouchi'**
  String get areaMarunouchi;

  /// No description provided for @areaAkihabara.
  ///
  /// In en, this message translates to:
  /// **'Akihabara'**
  String get areaAkihabara;

  /// No description provided for @areaKanda.
  ///
  /// In en, this message translates to:
  /// **'Kanda'**
  String get areaKanda;

  /// No description provided for @areaRoppongi.
  ///
  /// In en, this message translates to:
  /// **'Roppongi'**
  String get areaRoppongi;

  /// No description provided for @areaAzabu.
  ///
  /// In en, this message translates to:
  /// **'Azabu'**
  String get areaAzabu;

  /// No description provided for @areaOdaiba.
  ///
  /// In en, this message translates to:
  /// **'Odaiba'**
  String get areaOdaiba;

  /// No description provided for @areaShimokitazawa.
  ///
  /// In en, this message translates to:
  /// **'Shimokitazawa'**
  String get areaShimokitazawa;

  /// No description provided for @areaSangenjaya.
  ///
  /// In en, this message translates to:
  /// **'Sangenjaya'**
  String get areaSangenjaya;

  /// No description provided for @areaUmeda.
  ///
  /// In en, this message translates to:
  /// **'Umeda'**
  String get areaUmeda;

  /// No description provided for @areaNakanoshima.
  ///
  /// In en, this message translates to:
  /// **'Nakanoshima'**
  String get areaNakanoshima;

  /// No description provided for @areaNamba.
  ///
  /// In en, this message translates to:
  /// **'Namba'**
  String get areaNamba;

  /// No description provided for @areaShinsaibashi.
  ///
  /// In en, this message translates to:
  /// **'Shinsaibashi'**
  String get areaShinsaibashi;

  /// No description provided for @areaDotonbori.
  ///
  /// In en, this message translates to:
  /// **'Dotonbori'**
  String get areaDotonbori;

  /// No description provided for @areaAbeno.
  ///
  /// In en, this message translates to:
  /// **'Abeno'**
  String get areaAbeno;

  /// No description provided for @areaKyotoStation.
  ///
  /// In en, this message translates to:
  /// **'Kyoto Station Area'**
  String get areaKyotoStation;

  /// No description provided for @areaGion.
  ///
  /// In en, this message translates to:
  /// **'Gion'**
  String get areaGion;

  /// No description provided for @areaKiyomizu.
  ///
  /// In en, this message translates to:
  /// **'Kiyomizu'**
  String get areaKiyomizu;

  /// No description provided for @areaGinkakuji.
  ///
  /// In en, this message translates to:
  /// **'Ginkakuji Area'**
  String get areaGinkakuji;

  /// No description provided for @areaChuo.
  ///
  /// In en, this message translates to:
  /// **'Chuo'**
  String get areaChuo;

  /// No description provided for @areaKita.
  ///
  /// In en, this message translates to:
  /// **'Kita'**
  String get areaKita;

  /// No description provided for @areaSusukino.
  ///
  /// In en, this message translates to:
  /// **'Susukino'**
  String get areaSusukino;

  /// No description provided for @areaHakataStation.
  ///
  /// In en, this message translates to:
  /// **'Hakata Station Area'**
  String get areaHakataStation;

  /// No description provided for @areaCanal.
  ///
  /// In en, this message translates to:
  /// **'Canal City'**
  String get areaCanal;

  /// No description provided for @areaTenjinCentral.
  ///
  /// In en, this message translates to:
  /// **'Tenjin Central'**
  String get areaTenjinCentral;

  /// No description provided for @areaChinatown.
  ///
  /// In en, this message translates to:
  /// **'Chinatown'**
  String get areaChinatown;

  /// No description provided for @areaMinatoMirai.
  ///
  /// In en, this message translates to:
  /// **'Minato Mirai'**
  String get areaMinatoMirai;

  /// No description provided for @serviceInternalMedicine.
  ///
  /// In en, this message translates to:
  /// **'Internal Medicine'**
  String get serviceInternalMedicine;

  /// No description provided for @serviceSurgery.
  ///
  /// In en, this message translates to:
  /// **'Surgery'**
  String get serviceSurgery;

  /// No description provided for @serviceENT.
  ///
  /// In en, this message translates to:
  /// **'ENT'**
  String get serviceENT;

  /// No description provided for @serviceDentistry.
  ///
  /// In en, this message translates to:
  /// **'Dentistry'**
  String get serviceDentistry;

  /// No description provided for @serviceOBGYN.
  ///
  /// In en, this message translates to:
  /// **'OG/GYN'**
  String get serviceOBGYN;

  /// No description provided for @servicePsychosomaticMedicine.
  ///
  /// In en, this message translates to:
  /// **'Psychosomatic Medicine'**
  String get servicePsychosomaticMedicine;

  /// No description provided for @servicePharmacy.
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get servicePharmacy;

  /// No description provided for @chatbotWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m your medical assistant. You can speak to me or type your questions. How can I help you today?'**
  String get chatbotWelcome;

  /// No description provided for @medicalAssistant.
  ///
  /// In en, this message translates to:
  /// **'Medical Assistant'**
  String get medicalAssistant;

  /// No description provided for @detailed.
  ///
  /// In en, this message translates to:
  /// **'Detailed'**
  String get detailed;

  /// No description provided for @quick.
  ///
  /// In en, this message translates to:
  /// **'Quick'**
  String get quick;

  /// No description provided for @responseType.
  ///
  /// In en, this message translates to:
  /// **'Response Type'**
  String get responseType;

  /// No description provided for @quickMode.
  ///
  /// In en, this message translates to:
  /// **'Quick Mode'**
  String get quickMode;

  /// No description provided for @quickModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Fast, concise responses'**
  String get quickModeDesc;

  /// No description provided for @detailedMode.
  ///
  /// In en, this message translates to:
  /// **'Detailed Mode'**
  String get detailedMode;

  /// No description provided for @detailedModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive medical information'**
  String get detailedModeDesc;

  /// No description provided for @quickModeActivated.
  ///
  /// In en, this message translates to:
  /// **'⚡ Quick mode activated'**
  String get quickModeActivated;

  /// No description provided for @detailedModeActivated.
  ///
  /// In en, this message translates to:
  /// **'📋 Detailed mode activated'**
  String get detailedModeActivated;

  /// No description provided for @chatCleared.
  ///
  /// In en, this message translates to:
  /// **'Chat history cleared'**
  String get chatCleared;

  /// No description provided for @thinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking...'**
  String get thinking;

  /// No description provided for @overloaded.
  ///
  /// In en, this message translates to:
  /// **'The service is currently overloaded. Please try again later.'**
  String get overloaded;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get errorOccurred;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get networkError;

  /// No description provided for @speechNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition is not available'**
  String get speechNotAvailable;

  /// No description provided for @micPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is required for voice input'**
  String get micPermissionRequired;

  /// No description provided for @voiceInputError.
  ///
  /// In en, this message translates to:
  /// **'Voice input error occurred'**
  String get voiceInputError;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Got it. Processing.'**
  String get processing;

  /// No description provided for @listening.
  ///
  /// In en, this message translates to:
  /// **'Listening...'**
  String get listening;

  /// No description provided for @typeOrSpeak.
  ///
  /// In en, this message translates to:
  /// **'Type or speak your symptoms'**
  String get typeOrSpeak;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @assistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get assistant;

  /// No description provided for @findNearbyFacilities.
  ///
  /// In en, this message translates to:
  /// **'🏥 Find Nearby Facilities'**
  String get findNearbyFacilities;

  /// No description provided for @noDepartmentDetected.
  ///
  /// In en, this message translates to:
  /// **'No medical department was recommended yet. Please describe your symptoms first.'**
  String get noDepartmentDetected;

  /// No description provided for @askAssistant.
  ///
  /// In en, this message translates to:
  /// **'Ask AI Assistant'**
  String get askAssistant;

  /// No description provided for @searchingForService.
  ///
  /// In en, this message translates to:
  /// **'Searching for {service}...'**
  String searchingForService(String service);

  /// No description provided for @cannotOpenPhoneDial.
  ///
  /// In en, this message translates to:
  /// **'Cannot open phone dialer'**
  String get cannotOpenPhoneDial;

  /// No description provided for @reminderAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Reminder'**
  String get reminderAddTitle;

  /// No description provided for @reminderEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Reminder'**
  String get reminderEditTitle;

  /// No description provided for @reminderMedicineNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Medicine Name'**
  String get reminderMedicineNameLabel;

  /// No description provided for @reminderMedicineNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter medicine name'**
  String get reminderMedicineNameHint;

  /// No description provided for @reminderPhotoLabel.
  ///
  /// In en, this message translates to:
  /// **'Medicine Photo'**
  String get reminderPhotoLabel;

  /// No description provided for @reminderPhotoOptional.
  ///
  /// In en, this message translates to:
  /// **'(Optional)'**
  String get reminderPhotoOptional;

  /// No description provided for @reminderAddPhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get reminderAddPhotoTitle;

  /// No description provided for @reminderAddPhotoButton.
  ///
  /// In en, this message translates to:
  /// **'Tap to add photo'**
  String get reminderAddPhotoButton;

  /// No description provided for @reminderPhotoFromCamera.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get reminderPhotoFromCamera;

  /// No description provided for @reminderPhotoFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get reminderPhotoFromGallery;

  /// No description provided for @reminderPhotoRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove Photo'**
  String get reminderPhotoRemove;

  /// No description provided for @reminderPhotoPickError.
  ///
  /// In en, this message translates to:
  /// **'Error picking photo: {error}'**
  String reminderPhotoPickError(String error);

  /// No description provided for @reminderTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get reminderTimeLabel;

  /// No description provided for @reminderRepeatLabel.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get reminderRepeatLabel;

  /// No description provided for @reminderRepeatNever.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get reminderRepeatNever;

  /// No description provided for @reminderRepeatEveryday.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get reminderRepeatEveryday;

  /// No description provided for @reminderRepeatWeekdays.
  ///
  /// In en, this message translates to:
  /// **'Weekdays only'**
  String get reminderRepeatWeekdays;

  /// No description provided for @reminderRepeatWeekends.
  ///
  /// In en, this message translates to:
  /// **'Weekends only'**
  String get reminderRepeatWeekends;

  /// No description provided for @reminderRepeatCustomOption.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get reminderRepeatCustomOption;

  /// No description provided for @reminderRepeatSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat Settings'**
  String get reminderRepeatSettingsTitle;

  /// No description provided for @reminderRepeatDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get reminderRepeatDone;

  /// No description provided for @reminderSelectDays.
  ///
  /// In en, this message translates to:
  /// **'Select days'**
  String get reminderSelectDays;

  /// No description provided for @reminderDayMonShort.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get reminderDayMonShort;

  /// No description provided for @reminderDayTueShort.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get reminderDayTueShort;

  /// No description provided for @reminderDayWedShort.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get reminderDayWedShort;

  /// No description provided for @reminderDayThuShort.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get reminderDayThuShort;

  /// No description provided for @reminderDayFriShort.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get reminderDayFriShort;

  /// No description provided for @reminderDaySatShort.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get reminderDaySatShort;

  /// No description provided for @reminderDaySunShort.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get reminderDaySunShort;

  /// No description provided for @reminderDaySeparator.
  ///
  /// In en, this message translates to:
  /// **', '**
  String get reminderDaySeparator;

  /// No description provided for @reminderEveryWeekDays.
  ///
  /// In en, this message translates to:
  /// **'{days}'**
  String reminderEveryWeekDays(String days);

  /// No description provided for @reminderMealTimingLabel.
  ///
  /// In en, this message translates to:
  /// **'Meal Timing'**
  String get reminderMealTimingLabel;

  /// No description provided for @reminderMealTimingNone.
  ///
  /// In en, this message translates to:
  /// **'No specific timing'**
  String get reminderMealTimingNone;

  /// No description provided for @reminderMealTimingBeforeTitle.
  ///
  /// In en, this message translates to:
  /// **'Before Meals'**
  String get reminderMealTimingBeforeTitle;

  /// No description provided for @reminderMealTimingBeforeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take 30 mins before eating'**
  String get reminderMealTimingBeforeSubtitle;

  /// No description provided for @reminderMealTimingAfterTitle.
  ///
  /// In en, this message translates to:
  /// **'After Meals'**
  String get reminderMealTimingAfterTitle;

  /// No description provided for @reminderMealTimingAfterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take 30 mins after eating'**
  String get reminderMealTimingAfterSubtitle;

  /// No description provided for @reminderCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get reminderCancel;

  /// No description provided for @reminderAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get reminderAdd;

  /// No description provided for @reminderUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get reminderUpdate;

  /// No description provided for @reminderDoseMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get reminderDoseMorning;

  /// No description provided for @reminderDoseNoon.
  ///
  /// In en, this message translates to:
  /// **'Noon'**
  String get reminderDoseNoon;

  /// No description provided for @reminderDoseEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get reminderDoseEvening;

  /// No description provided for @reminderDoseNight.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get reminderDoseNight;

  /// No description provided for @reminderNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Time to take your medicine (Dose {dose})'**
  String reminderNotificationBody(int dose);

  /// No description provided for @reminderNotificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Medicine Reminders'**
  String get reminderNotificationChannelName;

  /// No description provided for @reminderNotificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Notifications for medicine reminders'**
  String get reminderNotificationChannelDescription;

  /// No description provided for @reminderAddedMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminder added successfully!'**
  String get reminderAddedMessage;

  /// No description provided for @reminderUpdatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminder updated successfully!'**
  String get reminderUpdatedMessage;

  /// No description provided for @reminderDeletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminder deleted'**
  String get reminderDeletedMessage;

  /// No description provided for @reminderTakenSnackBar.
  ///
  /// In en, this message translates to:
  /// **'Medicine taken!'**
  String get reminderTakenSnackBar;

  /// No description provided for @reminderTimeToTakeMessage.
  ///
  /// In en, this message translates to:
  /// **'Time to take your medicine'**
  String get reminderTimeToTakeMessage;

  /// No description provided for @reminderTakenButton.
  ///
  /// In en, this message translates to:
  /// **'I took it'**
  String get reminderTakenButton;

  /// No description provided for @reminderCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get reminderCloseButton;

  /// No description provided for @reminderMealConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Meal Check'**
  String get reminderMealConfirmTitle;

  /// No description provided for @reminderMealConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This medicine should be taken after meals'**
  String get reminderMealConfirmMessage;

  /// No description provided for @reminderMealConfirmQuestion.
  ///
  /// In en, this message translates to:
  /// **'Have you finished eating?'**
  String get reminderMealConfirmQuestion;

  /// No description provided for @reminderMealConfirmRecommendation.
  ///
  /// In en, this message translates to:
  /// **'For best results, take medicine 30 minutes after eating'**
  String get reminderMealConfirmRecommendation;

  /// No description provided for @reminderMealConfirmNotYet.
  ///
  /// In en, this message translates to:
  /// **'Not yet'**
  String get reminderMealConfirmNotYet;

  /// No description provided for @reminderMealConfirmDone.
  ///
  /// In en, this message translates to:
  /// **'Already finished'**
  String get reminderMealConfirmDone;

  /// No description provided for @reminderLaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder Set'**
  String get reminderLaterTitle;

  /// No description provided for @reminderLaterMessage.
  ///
  /// In en, this message translates to:
  /// **'Please remember to take your medicine after eating!'**
  String get reminderLaterMessage;

  /// No description provided for @reminderLaterOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get reminderLaterOk;

  /// No description provided for @medicineReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Medicine Reminders'**
  String get medicineReminderTitle;

  /// No description provided for @reminderEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No reminders yet'**
  String get reminderEmptyTitle;

  /// No description provided for @reminderEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first medicine reminder'**
  String get reminderEmptySubtitle;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'{name} added to favorites'**
  String addedToFavorites(String name);

  /// No description provided for @removedFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'{name} removed from favorites'**
  String removedFromFavorites(String name);

  /// No description provided for @reminderTestAlarmTooltip.
  ///
  /// In en, this message translates to:
  /// **'Test alarm for this reminder'**
  String get reminderTestAlarmTooltip;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsPrivacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get settingsPrivacySecurity;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingsHelpSupport;

  /// No description provided for @settingsAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About MediNavi'**
  String get settingsAboutApp;

  /// No description provided for @clearChat.
  ///
  /// In en, this message translates to:
  /// **'Clear Chat'**
  String get clearChat;

  /// No description provided for @clearChatMessage.
  ///
  /// In en, this message translates to:
  /// **'Start a new conversation? Current chat will be cleared.'**
  String get clearChatMessage;

  /// No description provided for @clearChatConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearChatConfirm;

  /// No description provided for @favoritesClearAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear All Favorites'**
  String get favoritesClearAllTitle;

  /// No description provided for @favoritesClearAllMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove all favorites? This action cannot be undone.'**
  String get favoritesClearAllMessage;

  /// No description provided for @favoritesClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get favoritesClearAll;

  /// No description provided for @cityAbashiri.
  ///
  /// In en, this message translates to:
  /// **'Abashiri'**
  String get cityAbashiri;

  /// No description provided for @cityAbeno.
  ///
  /// In en, this message translates to:
  /// **'Abeno'**
  String get cityAbeno;

  /// No description provided for @cityAbiko.
  ///
  /// In en, this message translates to:
  /// **'Abiko'**
  String get cityAbiko;

  /// No description provided for @cityAgeo.
  ///
  /// In en, this message translates to:
  /// **'Ageo'**
  String get cityAgeo;

  /// No description provided for @cityAichi.
  ///
  /// In en, this message translates to:
  /// **'Aichi'**
  String get cityAichi;

  /// No description provided for @cityAioi.
  ///
  /// In en, this message translates to:
  /// **'Aioi'**
  String get cityAioi;

  /// No description provided for @cityAira.
  ///
  /// In en, this message translates to:
  /// **'Aira'**
  String get cityAira;

  /// No description provided for @cityAisai.
  ///
  /// In en, this message translates to:
  /// **'Aisai'**
  String get cityAisai;

  /// No description provided for @cityAizuwakamatsu.
  ///
  /// In en, this message translates to:
  /// **'Aizuwakamatsu'**
  String get cityAizuwakamatsu;

  /// No description provided for @cityAkaiwa.
  ///
  /// In en, this message translates to:
  /// **'Akaiwa'**
  String get cityAkaiwa;

  /// No description provided for @cityAkashi.
  ///
  /// In en, this message translates to:
  /// **'Akashi'**
  String get cityAkashi;

  /// No description provided for @cityAki.
  ///
  /// In en, this message translates to:
  /// **'Aki'**
  String get cityAki;

  /// No description provided for @cityAkihabara.
  ///
  /// In en, this message translates to:
  /// **'Akihabara'**
  String get cityAkihabara;

  /// No description provided for @cityAkita.
  ///
  /// In en, this message translates to:
  /// **'Akita'**
  String get cityAkita;

  /// No description provided for @cityAkitaCity.
  ///
  /// In en, this message translates to:
  /// **'Akita City'**
  String get cityAkitaCity;

  /// No description provided for @cityAkitakata.
  ///
  /// In en, this message translates to:
  /// **'Akitakata'**
  String get cityAkitakata;

  /// No description provided for @cityAko.
  ///
  /// In en, this message translates to:
  /// **'Ako'**
  String get cityAko;

  /// No description provided for @cityAkune.
  ///
  /// In en, this message translates to:
  /// **'Akune'**
  String get cityAkune;

  /// No description provided for @cityAma.
  ///
  /// In en, this message translates to:
  /// **'Ama'**
  String get cityAma;

  /// No description provided for @cityAmagasaki.
  ///
  /// In en, this message translates to:
  /// **'Amagasaki'**
  String get cityAmagasaki;

  /// No description provided for @cityAmakusa.
  ///
  /// In en, this message translates to:
  /// **'Amakusa'**
  String get cityAmakusa;

  /// No description provided for @cityAnan.
  ///
  /// In en, this message translates to:
  /// **'Anan'**
  String get cityAnan;

  /// No description provided for @cityAnjo.
  ///
  /// In en, this message translates to:
  /// **'Anjo'**
  String get cityAnjo;

  /// No description provided for @cityAnnaka.
  ///
  /// In en, this message translates to:
  /// **'Annaka'**
  String get cityAnnaka;

  /// No description provided for @cityAomori.
  ///
  /// In en, this message translates to:
  /// **'Aomori'**
  String get cityAomori;

  /// No description provided for @cityAomoriCity.
  ///
  /// In en, this message translates to:
  /// **'Aomori City'**
  String get cityAomoriCity;

  /// No description provided for @cityArao.
  ///
  /// In en, this message translates to:
  /// **'Arao'**
  String get cityArao;

  /// No description provided for @cityArida.
  ///
  /// In en, this message translates to:
  /// **'Arida'**
  String get cityArida;

  /// No description provided for @cityArashiyama.
  ///
  /// In en, this message translates to:
  /// **'Arashiyama'**
  String get cityArashiyama;

  /// No description provided for @cityAsago.
  ///
  /// In en, this message translates to:
  /// **'Asago'**
  String get cityAsago;

  /// No description provided for @cityAsahi.
  ///
  /// In en, this message translates to:
  /// **'Asahi'**
  String get cityAsahi;

  /// No description provided for @cityAsaka.
  ///
  /// In en, this message translates to:
  /// **'Asaka'**
  String get cityAsaka;

  /// No description provided for @cityAsakuchi.
  ///
  /// In en, this message translates to:
  /// **'Asakuchi'**
  String get cityAsakuchi;

  /// No description provided for @cityAsakura.
  ///
  /// In en, this message translates to:
  /// **'Asakura'**
  String get cityAsakura;

  /// No description provided for @cityAsakusa.
  ///
  /// In en, this message translates to:
  /// **'Asakusa'**
  String get cityAsakusa;

  /// No description provided for @cityAshikaga.
  ///
  /// In en, this message translates to:
  /// **'Ashikaga'**
  String get cityAshikaga;

  /// No description provided for @cityAshiya.
  ///
  /// In en, this message translates to:
  /// **'Ashiya'**
  String get cityAshiya;

  /// No description provided for @cityAso.
  ///
  /// In en, this message translates to:
  /// **'Aso'**
  String get cityAso;

  /// No description provided for @cityAtami.
  ///
  /// In en, this message translates to:
  /// **'Atami'**
  String get cityAtami;

  /// No description provided for @cityAtsugi.
  ///
  /// In en, this message translates to:
  /// **'Atsugi'**
  String get cityAtsugi;

  /// No description provided for @cityAtsuta.
  ///
  /// In en, this message translates to:
  /// **'Atsuta'**
  String get cityAtsuta;

  /// No description provided for @cityAwa.
  ///
  /// In en, this message translates to:
  /// **'Awa'**
  String get cityAwa;

  /// No description provided for @cityAwaji.
  ///
  /// In en, this message translates to:
  /// **'Awaji'**
  String get cityAwaji;

  /// No description provided for @cityAwara.
  ///
  /// In en, this message translates to:
  /// **'Awara'**
  String get cityAwara;

  /// No description provided for @cityAyabe.
  ///
  /// In en, this message translates to:
  /// **'Ayabe'**
  String get cityAyabe;

  /// No description provided for @cityAyase.
  ///
  /// In en, this message translates to:
  /// **'Ayase'**
  String get cityAyase;

  /// No description provided for @cityAzabu.
  ///
  /// In en, this message translates to:
  /// **'Azabu'**
  String get cityAzabu;

  /// No description provided for @cityAzumino.
  ///
  /// In en, this message translates to:
  /// **'Azumino'**
  String get cityAzumino;

  /// No description provided for @cityAdachi.
  ///
  /// In en, this message translates to:
  /// **'Adachi'**
  String get cityAdachi;

  /// No description provided for @cityArakawa.
  ///
  /// In en, this message translates to:
  /// **'Arakawa'**
  String get cityArakawa;

  /// No description provided for @cityBunkyo.
  ///
  /// In en, this message translates to:
  /// **'Bunkyo'**
  String get cityBunkyo;

  /// No description provided for @cityEdogawa.
  ///
  /// In en, this message translates to:
  /// **'Edogawa'**
  String get cityEdogawa;

  /// No description provided for @cityItabashi.
  ///
  /// In en, this message translates to:
  /// **'Itabashi'**
  String get cityItabashi;

  /// No description provided for @cityKatsushika.
  ///
  /// In en, this message translates to:
  /// **'Katsushika'**
  String get cityKatsushika;

  /// No description provided for @cityKoto.
  ///
  /// In en, this message translates to:
  /// **'Koto'**
  String get cityKoto;

  /// No description provided for @cityMeguro.
  ///
  /// In en, this message translates to:
  /// **'Meguro'**
  String get cityMeguro;

  /// No description provided for @cityMeito.
  ///
  /// In en, this message translates to:
  /// **'Meito'**
  String get cityMeito;

  /// No description provided for @cityNakano.
  ///
  /// In en, this message translates to:
  /// **'Nakano'**
  String get cityNakano;

  /// No description provided for @cityNerima.
  ///
  /// In en, this message translates to:
  /// **'Nerima'**
  String get cityNerima;

  /// No description provided for @cityOta.
  ///
  /// In en, this message translates to:
  /// **'Ota'**
  String get cityOta;

  /// No description provided for @cityOtaWard.
  ///
  /// In en, this message translates to:
  /// **'Ota Ward'**
  String get cityOtaWard;

  /// No description provided for @cityShinagawa.
  ///
  /// In en, this message translates to:
  /// **'Shinagawa'**
  String get cityShinagawa;

  /// No description provided for @citySuginami.
  ///
  /// In en, this message translates to:
  /// **'Suginami'**
  String get citySuginami;

  /// No description provided for @citySumida.
  ///
  /// In en, this message translates to:
  /// **'Sumida'**
  String get citySumida;

  /// No description provided for @citySuminoe.
  ///
  /// In en, this message translates to:
  /// **'Suminoe'**
  String get citySuminoe;

  /// No description provided for @citySumiyoshi.
  ///
  /// In en, this message translates to:
  /// **'Sumiyoshi'**
  String get citySumiyoshi;

  /// No description provided for @cityTaito.
  ///
  /// In en, this message translates to:
  /// **'Taito'**
  String get cityTaito;

  /// No description provided for @cityToshima.
  ///
  /// In en, this message translates to:
  /// **'Toshima'**
  String get cityToshima;

  /// No description provided for @cityMiura.
  ///
  /// In en, this message translates to:
  /// **'Miura'**
  String get cityMiura;

  /// No description provided for @cityHadano.
  ///
  /// In en, this message translates to:
  /// **'Hadano'**
  String get cityHadano;

  /// No description provided for @cityIsehara.
  ///
  /// In en, this message translates to:
  /// **'Isehara'**
  String get cityIsehara;

  /// No description provided for @cityMinamiashigara.
  ///
  /// In en, this message translates to:
  /// **'Minamiashigara'**
  String get cityMinamiashigara;

  /// No description provided for @cityTsurumi.
  ///
  /// In en, this message translates to:
  /// **'Tsurumi'**
  String get cityTsurumi;

  /// No description provided for @cityKanagawaWard.
  ///
  /// In en, this message translates to:
  /// **'Kanagawa Ward'**
  String get cityKanagawaWard;

  /// No description provided for @cityKohoku.
  ///
  /// In en, this message translates to:
  /// **'Kohoku'**
  String get cityKohoku;

  /// No description provided for @cityTotsuka.
  ///
  /// In en, this message translates to:
  /// **'Totsuka'**
  String get cityTotsuka;

  /// No description provided for @cityHodogaya.
  ///
  /// In en, this message translates to:
  /// **'Hodogaya'**
  String get cityHodogaya;

  /// No description provided for @cityIsogo.
  ///
  /// In en, this message translates to:
  /// **'Isogo'**
  String get cityIsogo;

  /// No description provided for @cityKanazawaWard.
  ///
  /// In en, this message translates to:
  /// **'Kanazawa Ward'**
  String get cityKanazawaWard;

  /// No description provided for @cityKonanWard.
  ///
  /// In en, this message translates to:
  /// **'Konan Ward'**
  String get cityKonanWard;

  /// No description provided for @cityMidori.
  ///
  /// In en, this message translates to:
  /// **'Midori'**
  String get cityMidori;

  /// No description provided for @citySeya.
  ///
  /// In en, this message translates to:
  /// **'Seya'**
  String get citySeya;

  /// No description provided for @citySakae.
  ///
  /// In en, this message translates to:
  /// **'Sakae'**
  String get citySakae;

  /// No description provided for @cityIzumiWard.
  ///
  /// In en, this message translates to:
  /// **'Izumi Ward'**
  String get cityIzumiWard;

  /// No description provided for @cityAoba.
  ///
  /// In en, this message translates to:
  /// **'Aoba'**
  String get cityAoba;

  /// No description provided for @cityTsuzuki.
  ///
  /// In en, this message translates to:
  /// **'Tsuzuki'**
  String get cityTsuzuki;

  /// No description provided for @cityNishi.
  ///
  /// In en, this message translates to:
  /// **'Nishi'**
  String get cityNishi;

  /// No description provided for @cityMinami.
  ///
  /// In en, this message translates to:
  /// **'Minami'**
  String get cityMinami;

  /// No description provided for @cityNakaWard.
  ///
  /// In en, this message translates to:
  /// **'Naka Ward'**
  String get cityNakaWard;

  /// No description provided for @cityBeppu.
  ///
  /// In en, this message translates to:
  /// **'Beppu'**
  String get cityBeppu;

  /// No description provided for @cityBibai.
  ///
  /// In en, this message translates to:
  /// **'Bibai'**
  String get cityBibai;

  /// No description provided for @cityBizen.
  ///
  /// In en, this message translates to:
  /// **'Bizen'**
  String get cityBizen;

  /// No description provided for @cityBungoono.
  ///
  /// In en, this message translates to:
  /// **'Bungoono'**
  String get cityBungoono;

  /// No description provided for @cityBungotakada.
  ///
  /// In en, this message translates to:
  /// **'Bungotakada'**
  String get cityBungotakada;

  /// No description provided for @cityBuzen.
  ///
  /// In en, this message translates to:
  /// **'Buzen'**
  String get cityBuzen;

  /// No description provided for @cityCanalCity.
  ///
  /// In en, this message translates to:
  /// **'Canal City'**
  String get cityCanalCity;

  /// No description provided for @cityChiba.
  ///
  /// In en, this message translates to:
  /// **'Chiba'**
  String get cityChiba;

  /// No description provided for @cityChibaCity.
  ///
  /// In en, this message translates to:
  /// **'Chiba City'**
  String get cityChibaCity;

  /// No description provided for @cityChichibu.
  ///
  /// In en, this message translates to:
  /// **'Chichibu'**
  String get cityChichibu;

  /// No description provided for @cityChigasaki.
  ///
  /// In en, this message translates to:
  /// **'Chigasaki'**
  String get cityChigasaki;

  /// No description provided for @cityChikugo.
  ///
  /// In en, this message translates to:
  /// **'Chikugo'**
  String get cityChikugo;

  /// No description provided for @cityChikuma.
  ///
  /// In en, this message translates to:
  /// **'Chikuma'**
  String get cityChikuma;

  /// No description provided for @cityChikushino.
  ///
  /// In en, this message translates to:
  /// **'Chikushino'**
  String get cityChikushino;

  /// No description provided for @cityChikusa.
  ///
  /// In en, this message translates to:
  /// **'Chikusa'**
  String get cityChikusa;

  /// No description provided for @cityChinatown.
  ///
  /// In en, this message translates to:
  /// **'Chinatown'**
  String get cityChinatown;

  /// No description provided for @cityChino.
  ///
  /// In en, this message translates to:
  /// **'Chino'**
  String get cityChino;

  /// No description provided for @cityChiryu.
  ///
  /// In en, this message translates to:
  /// **'Chiryu'**
  String get cityChiryu;

  /// No description provided for @cityChita.
  ///
  /// In en, this message translates to:
  /// **'Chita'**
  String get cityChita;

  /// No description provided for @cityChitose.
  ///
  /// In en, this message translates to:
  /// **'Chitose'**
  String get cityChitose;

  /// No description provided for @cityDaisen.
  ///
  /// In en, this message translates to:
  /// **'Daisen'**
  String get cityDaisen;

  /// No description provided for @cityDaito.
  ///
  /// In en, this message translates to:
  /// **'Daito'**
  String get cityDaito;

  /// No description provided for @cityDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get cityDate;

  /// No description provided for @cityDazaifu.
  ///
  /// In en, this message translates to:
  /// **'Dazaifu'**
  String get cityDazaifu;

  /// No description provided for @cityDotonbori.
  ///
  /// In en, this message translates to:
  /// **'Dotonbori'**
  String get cityDotonbori;

  /// No description provided for @cityEbetsu.
  ///
  /// In en, this message translates to:
  /// **'Ebetsu'**
  String get cityEbetsu;

  /// No description provided for @cityEbina.
  ///
  /// In en, this message translates to:
  /// **'Ebina'**
  String get cityEbina;

  /// No description provided for @cityEbino.
  ///
  /// In en, this message translates to:
  /// **'Ebino'**
  String get cityEbino;

  /// No description provided for @cityEbisu.
  ///
  /// In en, this message translates to:
  /// **'Ebisu'**
  String get cityEbisu;

  /// No description provided for @cityEchizen.
  ///
  /// In en, this message translates to:
  /// **'Echizen'**
  String get cityEchizen;

  /// No description provided for @cityEhime.
  ///
  /// In en, this message translates to:
  /// **'Ehime'**
  String get cityEhime;

  /// No description provided for @cityEna.
  ///
  /// In en, this message translates to:
  /// **'Ena'**
  String get cityEna;

  /// No description provided for @cityEniwa.
  ///
  /// In en, this message translates to:
  /// **'Eniwa'**
  String get cityEniwa;

  /// No description provided for @cityEtajima.
  ///
  /// In en, this message translates to:
  /// **'Etajima'**
  String get cityEtajima;

  /// No description provided for @cityFuchu.
  ///
  /// In en, this message translates to:
  /// **'Fuchu'**
  String get cityFuchu;

  /// No description provided for @cityFuefuki.
  ///
  /// In en, this message translates to:
  /// **'Fuefuki'**
  String get cityFuefuki;

  /// No description provided for @cityFujieda.
  ///
  /// In en, this message translates to:
  /// **'Fujieda'**
  String get cityFujieda;

  /// No description provided for @cityFujiidera.
  ///
  /// In en, this message translates to:
  /// **'Fujiidera'**
  String get cityFujiidera;

  /// No description provided for @cityFujimi.
  ///
  /// In en, this message translates to:
  /// **'Fujimi'**
  String get cityFujimi;

  /// No description provided for @cityFujimino.
  ///
  /// In en, this message translates to:
  /// **'Fujimino'**
  String get cityFujimino;

  /// No description provided for @cityFujinomiya.
  ///
  /// In en, this message translates to:
  /// **'Fujinomiya'**
  String get cityFujinomiya;

  /// No description provided for @cityFujioka.
  ///
  /// In en, this message translates to:
  /// **'Fujioka'**
  String get cityFujioka;

  /// No description provided for @cityFujisawa.
  ///
  /// In en, this message translates to:
  /// **'Fujisawa'**
  String get cityFujisawa;

  /// No description provided for @cityFujiyoshida.
  ///
  /// In en, this message translates to:
  /// **'Fujiyoshida'**
  String get cityFujiyoshida;

  /// No description provided for @cityFuji.
  ///
  /// In en, this message translates to:
  /// **'Fuji'**
  String get cityFuji;

  /// No description provided for @cityFukuchiyama.
  ///
  /// In en, this message translates to:
  /// **'Fukuchiyama'**
  String get cityFukuchiyama;

  /// No description provided for @cityFukui.
  ///
  /// In en, this message translates to:
  /// **'Fukui'**
  String get cityFukui;

  /// No description provided for @cityFukuiCity.
  ///
  /// In en, this message translates to:
  /// **'Fukui City'**
  String get cityFukuiCity;

  /// No description provided for @cityFukuoka.
  ///
  /// In en, this message translates to:
  /// **'Fukuoka'**
  String get cityFukuoka;

  /// No description provided for @cityFukagawa.
  ///
  /// In en, this message translates to:
  /// **'Fukagawa'**
  String get cityFukagawa;

  /// No description provided for @cityFukaya.
  ///
  /// In en, this message translates to:
  /// **'Fukaya'**
  String get cityFukaya;

  /// No description provided for @cityFukuokaCity.
  ///
  /// In en, this message translates to:
  /// **'Fukuoka City'**
  String get cityFukuokaCity;

  /// No description provided for @cityFukuroi.
  ///
  /// In en, this message translates to:
  /// **'Fukuroi'**
  String get cityFukuroi;

  /// No description provided for @cityFukushima.
  ///
  /// In en, this message translates to:
  /// **'Fukushima'**
  String get cityFukushima;

  /// No description provided for @cityFukushimaCity.
  ///
  /// In en, this message translates to:
  /// **'Fukushima City'**
  String get cityFukushimaCity;

  /// No description provided for @cityFukutsu.
  ///
  /// In en, this message translates to:
  /// **'Fukutsu'**
  String get cityFukutsu;

  /// No description provided for @cityFukuyama.
  ///
  /// In en, this message translates to:
  /// **'Fukuyama'**
  String get cityFukuyama;

  /// No description provided for @cityFushimi.
  ///
  /// In en, this message translates to:
  /// **'Fushimi'**
  String get cityFushimi;

  /// No description provided for @cityFunabashi.
  ///
  /// In en, this message translates to:
  /// **'Funabashi'**
  String get cityFunabashi;

  /// No description provided for @cityFurano.
  ///
  /// In en, this message translates to:
  /// **'Furano'**
  String get cityFurano;

  /// No description provided for @cityFuttsu.
  ///
  /// In en, this message translates to:
  /// **'Futtsu'**
  String get cityFuttsu;

  /// No description provided for @cityGamagori.
  ///
  /// In en, this message translates to:
  /// **'Gamagori'**
  String get cityGamagori;

  /// No description provided for @cityGero.
  ///
  /// In en, this message translates to:
  /// **'Gero'**
  String get cityGero;

  /// No description provided for @cityGifu.
  ///
  /// In en, this message translates to:
  /// **'Gifu'**
  String get cityGifu;

  /// No description provided for @cityGifuCity.
  ///
  /// In en, this message translates to:
  /// **'Gifu City'**
  String get cityGifuCity;

  /// No description provided for @cityGinkakujiArea.
  ///
  /// In en, this message translates to:
  /// **'Ginkakuji Area'**
  String get cityGinkakujiArea;

  /// No description provided for @cityGinza.
  ///
  /// In en, this message translates to:
  /// **'Ginza'**
  String get cityGinza;

  /// No description provided for @cityGinowan.
  ///
  /// In en, this message translates to:
  /// **'Ginowan'**
  String get cityGinowan;

  /// No description provided for @cityGion.
  ///
  /// In en, this message translates to:
  /// **'Gion'**
  String get cityGion;

  /// No description provided for @cityGobo.
  ///
  /// In en, this message translates to:
  /// **'Gobo'**
  String get cityGobo;

  /// No description provided for @cityGojo.
  ///
  /// In en, this message translates to:
  /// **'Gojo'**
  String get cityGojo;

  /// No description provided for @cityGose.
  ///
  /// In en, this message translates to:
  /// **'Gose'**
  String get cityGose;

  /// No description provided for @cityGosen.
  ///
  /// In en, this message translates to:
  /// **'Gosen'**
  String get cityGosen;

  /// No description provided for @cityGoshogawara.
  ///
  /// In en, this message translates to:
  /// **'Goshogawara'**
  String get cityGoshogawara;

  /// No description provided for @cityGoto.
  ///
  /// In en, this message translates to:
  /// **'Goto'**
  String get cityGoto;

  /// No description provided for @cityGujo.
  ///
  /// In en, this message translates to:
  /// **'Gujo'**
  String get cityGujo;

  /// No description provided for @cityGotemba.
  ///
  /// In en, this message translates to:
  /// **'Gotemba'**
  String get cityGotemba;

  /// No description provided for @cityGotsu.
  ///
  /// In en, this message translates to:
  /// **'Gotsu'**
  String get cityGotsu;

  /// No description provided for @cityGunma.
  ///
  /// In en, this message translates to:
  /// **'Gunma'**
  String get cityGunma;

  /// No description provided for @cityGyoda.
  ///
  /// In en, this message translates to:
  /// **'Gyoda'**
  String get cityGyoda;

  /// No description provided for @cityHabikino.
  ///
  /// In en, this message translates to:
  /// **'Habikino'**
  String get cityHabikino;

  /// No description provided for @cityHachinohe.
  ///
  /// In en, this message translates to:
  /// **'Hachinohe'**
  String get cityHachinohe;

  /// No description provided for @cityHachimantai.
  ///
  /// In en, this message translates to:
  /// **'Hachimantai'**
  String get cityHachimantai;

  /// No description provided for @cityHagi.
  ///
  /// In en, this message translates to:
  /// **'Hagi'**
  String get cityHagi;

  /// No description provided for @cityHakataStationArea.
  ///
  /// In en, this message translates to:
  /// **'Hakata Station Area'**
  String get cityHakataStationArea;

  /// No description provided for @cityHakui.
  ///
  /// In en, this message translates to:
  /// **'Hakui'**
  String get cityHakui;

  /// No description provided for @cityHakusan.
  ///
  /// In en, this message translates to:
  /// **'Hakusan'**
  String get cityHakusan;

  /// No description provided for @cityHamada.
  ///
  /// In en, this message translates to:
  /// **'Hamada'**
  String get cityHamada;

  /// No description provided for @cityHamamatsu.
  ///
  /// In en, this message translates to:
  /// **'Hamamatsu'**
  String get cityHamamatsu;

  /// No description provided for @cityHana.
  ///
  /// In en, this message translates to:
  /// **'Handa'**
  String get cityHana;

  /// No description provided for @cityHanamaki.
  ///
  /// In en, this message translates to:
  /// **'Hanamaki'**
  String get cityHanamaki;

  /// No description provided for @cityHannan.
  ///
  /// In en, this message translates to:
  /// **'Hannan'**
  String get cityHannan;

  /// No description provided for @cityHanno.
  ///
  /// In en, this message translates to:
  /// **'Hanno'**
  String get cityHanno;

  /// No description provided for @cityHanyu.
  ///
  /// In en, this message translates to:
  /// **'Hanyu'**
  String get cityHanyu;

  /// No description provided for @cityHarajuku.
  ///
  /// In en, this message translates to:
  /// **'Harajuku'**
  String get cityHarajuku;

  /// No description provided for @cityHashima.
  ///
  /// In en, this message translates to:
  /// **'Hashima'**
  String get cityHashima;

  /// No description provided for @cityHashimoto.
  ///
  /// In en, this message translates to:
  /// **'Hashimoto'**
  String get cityHashimoto;

  /// No description provided for @cityHasuda.
  ///
  /// In en, this message translates to:
  /// **'Hasuda'**
  String get cityHasuda;

  /// No description provided for @cityHatsukaichi.
  ///
  /// In en, this message translates to:
  /// **'Hatsukaichi'**
  String get cityHatsukaichi;

  /// No description provided for @cityHekinan.
  ///
  /// In en, this message translates to:
  /// **'Hekinan'**
  String get cityHekinan;

  /// No description provided for @cityHida.
  ///
  /// In en, this message translates to:
  /// **'Hida'**
  String get cityHida;

  /// No description provided for @cityHidaka.
  ///
  /// In en, this message translates to:
  /// **'Hidaka'**
  String get cityHidaka;

  /// No description provided for @cityHigashi.
  ///
  /// In en, this message translates to:
  /// **'Higashi'**
  String get cityHigashi;

  /// No description provided for @cityHigashihiroshima.
  ///
  /// In en, this message translates to:
  /// **'Higashihiroshima'**
  String get cityHigashihiroshima;

  /// No description provided for @cityHigashikagawa.
  ///
  /// In en, this message translates to:
  /// **'Higashikagawa'**
  String get cityHigashikagawa;

  /// No description provided for @cityHigashimatsushima.
  ///
  /// In en, this message translates to:
  /// **'Higashimatsushima'**
  String get cityHigashimatsushima;

  /// No description provided for @cityHigashimatsuyama.
  ///
  /// In en, this message translates to:
  /// **'Higashimatsuyama'**
  String get cityHigashimatsuyama;

  /// No description provided for @cityHigashinari.
  ///
  /// In en, this message translates to:
  /// **'Higashinari'**
  String get cityHigashinari;

  /// No description provided for @cityHigashiomi.
  ///
  /// In en, this message translates to:
  /// **'Higashiomi'**
  String get cityHigashiomi;

  /// No description provided for @cityHigashiosaka.
  ///
  /// In en, this message translates to:
  /// **'Higashiosaka'**
  String get cityHigashiosaka;

  /// No description provided for @cityHigashisumiyoshi.
  ///
  /// In en, this message translates to:
  /// **'Higashisumiyoshi'**
  String get cityHigashisumiyoshi;

  /// No description provided for @cityHigashiyodogawa.
  ///
  /// In en, this message translates to:
  /// **'Higashiyodogawa'**
  String get cityHigashiyodogawa;

  /// No description provided for @cityHigashine.
  ///
  /// In en, this message translates to:
  /// **'Higashine'**
  String get cityHigashine;

  /// No description provided for @cityHikari.
  ///
  /// In en, this message translates to:
  /// **'Hikari'**
  String get cityHikari;

  /// No description provided for @cityHikone.
  ///
  /// In en, this message translates to:
  /// **'Hikone'**
  String get cityHikone;

  /// No description provided for @cityHimi.
  ///
  /// In en, this message translates to:
  /// **'Himi'**
  String get cityHimi;

  /// No description provided for @cityHimeji.
  ///
  /// In en, this message translates to:
  /// **'Himeji'**
  String get cityHimeji;

  /// No description provided for @cityHioki.
  ///
  /// In en, this message translates to:
  /// **'Hioki'**
  String get cityHioki;

  /// No description provided for @cityHirakata.
  ///
  /// In en, this message translates to:
  /// **'Hirakata'**
  String get cityHirakata;

  /// No description provided for @cityHirakawa.
  ///
  /// In en, this message translates to:
  /// **'Hirakawa'**
  String get cityHirakawa;

  /// No description provided for @cityHirado.
  ///
  /// In en, this message translates to:
  /// **'Hirado'**
  String get cityHirado;

  /// No description provided for @cityHirano.
  ///
  /// In en, this message translates to:
  /// **'Hirano'**
  String get cityHirano;

  /// No description provided for @cityHiratsuka.
  ///
  /// In en, this message translates to:
  /// **'Hiratsuka'**
  String get cityHiratsuka;

  /// No description provided for @cityHirosaki.
  ///
  /// In en, this message translates to:
  /// **'Hirosaki'**
  String get cityHirosaki;

  /// No description provided for @cityHiroshima.
  ///
  /// In en, this message translates to:
  /// **'Hiroshima'**
  String get cityHiroshima;

  /// No description provided for @cityHiroshimaCity.
  ///
  /// In en, this message translates to:
  /// **'Hiroshima City'**
  String get cityHiroshimaCity;

  /// No description provided for @cityHitachi.
  ///
  /// In en, this message translates to:
  /// **'Hitachi'**
  String get cityHitachi;

  /// No description provided for @cityHitachinaka.
  ///
  /// In en, this message translates to:
  /// **'Hitachinaka'**
  String get cityHitachinaka;

  /// No description provided for @cityHitachiomiya.
  ///
  /// In en, this message translates to:
  /// **'Hitachiomiya'**
  String get cityHitachiomiya;

  /// No description provided for @cityHitachiota.
  ///
  /// In en, this message translates to:
  /// **'Hitachiota'**
  String get cityHitachiota;

  /// No description provided for @cityHitoyoshi.
  ///
  /// In en, this message translates to:
  /// **'Hitoyoshi'**
  String get cityHitoyoshi;

  /// No description provided for @cityHita.
  ///
  /// In en, this message translates to:
  /// **'Hita'**
  String get cityHita;

  /// No description provided for @cityHofu.
  ///
  /// In en, this message translates to:
  /// **'Hofu'**
  String get cityHofu;

  /// No description provided for @cityHokkaido.
  ///
  /// In en, this message translates to:
  /// **'Hokkaido'**
  String get cityHokkaido;

  /// No description provided for @cityHokuto.
  ///
  /// In en, this message translates to:
  /// **'Hokuto'**
  String get cityHokuto;

  /// No description provided for @cityHonjo.
  ///
  /// In en, this message translates to:
  /// **'Honjo'**
  String get cityHonjo;

  /// No description provided for @cityHyogo.
  ///
  /// In en, this message translates to:
  /// **'Hyogo'**
  String get cityHyogo;

  /// No description provided for @cityHyuga.
  ///
  /// In en, this message translates to:
  /// **'Hyuga'**
  String get cityHyuga;

  /// No description provided for @cityIbaraki.
  ///
  /// In en, this message translates to:
  /// **'Ibaraki'**
  String get cityIbaraki;

  /// No description provided for @cityIbara.
  ///
  /// In en, this message translates to:
  /// **'Ibara'**
  String get cityIbara;

  /// No description provided for @cityIbusuki.
  ///
  /// In en, this message translates to:
  /// **'Ibusuki'**
  String get cityIbusuki;

  /// No description provided for @cityIchihara.
  ///
  /// In en, this message translates to:
  /// **'Ichihara'**
  String get cityIchihara;

  /// No description provided for @cityIchikawa.
  ///
  /// In en, this message translates to:
  /// **'Ichikawa'**
  String get cityIchikawa;

  /// No description provided for @cityIchikikushikino.
  ///
  /// In en, this message translates to:
  /// **'Ichikikushikino'**
  String get cityIchikikushikino;

  /// No description provided for @cityIchinoseki.
  ///
  /// In en, this message translates to:
  /// **'Ichinoseki'**
  String get cityIchinoseki;

  /// No description provided for @cityIchinomiya.
  ///
  /// In en, this message translates to:
  /// **'Ichinomiya'**
  String get cityIchinomiya;

  /// No description provided for @cityIda.
  ///
  /// In en, this message translates to:
  /// **'Iida'**
  String get cityIda;

  /// No description provided for @cityIga.
  ///
  /// In en, this message translates to:
  /// **'Iga'**
  String get cityIga;

  /// No description provided for @cityIizuka.
  ///
  /// In en, this message translates to:
  /// **'Iizuka'**
  String get cityIizuka;

  /// No description provided for @cityIiyama.
  ///
  /// In en, this message translates to:
  /// **'Iiyama'**
  String get cityIiyama;

  /// No description provided for @cityIkebukuro.
  ///
  /// In en, this message translates to:
  /// **'Ikebukuro'**
  String get cityIkebukuro;

  /// No description provided for @cityIkeda.
  ///
  /// In en, this message translates to:
  /// **'Ikeda'**
  String get cityIkeda;

  /// No description provided for @cityIkoma.
  ///
  /// In en, this message translates to:
  /// **'Ikoma'**
  String get cityIkoma;

  /// No description provided for @cityIki.
  ///
  /// In en, this message translates to:
  /// **'Iki'**
  String get cityIki;

  /// No description provided for @cityIida.
  ///
  /// In en, this message translates to:
  /// **'Iida'**
  String get cityIida;

  /// No description provided for @cityIkuno.
  ///
  /// In en, this message translates to:
  /// **'Ikuno'**
  String get cityIkuno;

  /// No description provided for @cityImabari.
  ///
  /// In en, this message translates to:
  /// **'Imabari'**
  String get cityImabari;

  /// No description provided for @cityImari.
  ///
  /// In en, this message translates to:
  /// **'Imari'**
  String get cityImari;

  /// No description provided for @cityImizu.
  ///
  /// In en, this message translates to:
  /// **'Imizu'**
  String get cityImizu;

  /// No description provided for @cityInabe.
  ///
  /// In en, this message translates to:
  /// **'Inabe'**
  String get cityInabe;

  /// No description provided for @cityInashiki.
  ///
  /// In en, this message translates to:
  /// **'Inashiki'**
  String get cityInashiki;

  /// No description provided for @cityInazawa.
  ///
  /// In en, this message translates to:
  /// **'Inazawa'**
  String get cityInazawa;

  /// No description provided for @cityIna.
  ///
  /// In en, this message translates to:
  /// **'Ina'**
  String get cityIna;

  /// No description provided for @cityInuyama.
  ///
  /// In en, this message translates to:
  /// **'Inuyama'**
  String get cityInuyama;

  /// No description provided for @cityInzai.
  ///
  /// In en, this message translates to:
  /// **'Inzai'**
  String get cityInzai;

  /// No description provided for @cityIruma.
  ///
  /// In en, this message translates to:
  /// **'Iruma'**
  String get cityIruma;

  /// No description provided for @cityIsahaya.
  ///
  /// In en, this message translates to:
  /// **'Isahaya'**
  String get cityIsahaya;

  /// No description provided for @cityIsa.
  ///
  /// In en, this message translates to:
  /// **'Isa'**
  String get cityIsa;

  /// No description provided for @cityIse.
  ///
  /// In en, this message translates to:
  /// **'Ise'**
  String get cityIse;

  /// No description provided for @cityIsesaki.
  ///
  /// In en, this message translates to:
  /// **'Isesaki'**
  String get cityIsesaki;

  /// No description provided for @cityIshigaki.
  ///
  /// In en, this message translates to:
  /// **'Ishigaki'**
  String get cityIshigaki;

  /// No description provided for @cityIshikari.
  ///
  /// In en, this message translates to:
  /// **'Ishikari'**
  String get cityIshikari;

  /// No description provided for @cityIshikawa.
  ///
  /// In en, this message translates to:
  /// **'Ishikawa'**
  String get cityIshikawa;

  /// No description provided for @cityIshioka.
  ///
  /// In en, this message translates to:
  /// **'Ishioka'**
  String get cityIshioka;

  /// No description provided for @cityIshinomaki.
  ///
  /// In en, this message translates to:
  /// **'Ishinomaki'**
  String get cityIshinomaki;

  /// No description provided for @cityIsumi.
  ///
  /// In en, this message translates to:
  /// **'Isumi'**
  String get cityIsumi;

  /// No description provided for @cityItako.
  ///
  /// In en, this message translates to:
  /// **'Itako'**
  String get cityItako;

  /// No description provided for @cityItami.
  ///
  /// In en, this message translates to:
  /// **'Itami'**
  String get cityItami;

  /// No description provided for @cityIto.
  ///
  /// In en, this message translates to:
  /// **'Ito'**
  String get cityIto;

  /// No description provided for @cityItoigawa.
  ///
  /// In en, this message translates to:
  /// **'Itoigawa'**
  String get cityItoigawa;

  /// No description provided for @cityItoman.
  ///
  /// In en, this message translates to:
  /// **'Itoman'**
  String get cityItoman;

  /// No description provided for @cityItoshima.
  ///
  /// In en, this message translates to:
  /// **'Itoshima'**
  String get cityItoshima;

  /// No description provided for @cityIwade.
  ///
  /// In en, this message translates to:
  /// **'Iwade'**
  String get cityIwade;

  /// No description provided for @cityIwaki.
  ///
  /// In en, this message translates to:
  /// **'Iwaki'**
  String get cityIwaki;

  /// No description provided for @cityIwakuni.
  ///
  /// In en, this message translates to:
  /// **'Iwakuni'**
  String get cityIwakuni;

  /// No description provided for @cityIwakura.
  ///
  /// In en, this message translates to:
  /// **'Iwakura'**
  String get cityIwakura;

  /// No description provided for @cityIwamizawa.
  ///
  /// In en, this message translates to:
  /// **'Iwamizawa'**
  String get cityIwamizawa;

  /// No description provided for @cityIwanuma.
  ///
  /// In en, this message translates to:
  /// **'Iwanuma'**
  String get cityIwanuma;

  /// No description provided for @cityIwate.
  ///
  /// In en, this message translates to:
  /// **'Iwate'**
  String get cityIwate;

  /// No description provided for @cityIwata.
  ///
  /// In en, this message translates to:
  /// **'Iwata'**
  String get cityIwata;

  /// No description provided for @cityIyo.
  ///
  /// In en, this message translates to:
  /// **'Iyo'**
  String get cityIyo;

  /// No description provided for @cityIzu.
  ///
  /// In en, this message translates to:
  /// **'Izu'**
  String get cityIzu;

  /// No description provided for @cityIzumi.
  ///
  /// In en, this message translates to:
  /// **'Izumi'**
  String get cityIzumi;

  /// No description provided for @cityIzumiotsu.
  ///
  /// In en, this message translates to:
  /// **'Izumiotsu'**
  String get cityIzumiotsu;

  /// No description provided for @cityIzumisano.
  ///
  /// In en, this message translates to:
  /// **'Izumisano'**
  String get cityIzumisano;

  /// No description provided for @cityIzumo.
  ///
  /// In en, this message translates to:
  /// **'Izumo'**
  String get cityIzumo;

  /// No description provided for @cityIzunokuni.
  ///
  /// In en, this message translates to:
  /// **'Izunokuni'**
  String get cityIzunokuni;

  /// No description provided for @cityJoetsu.
  ///
  /// In en, this message translates to:
  /// **'Joetsu'**
  String get cityJoetsu;

  /// No description provided for @cityJonan.
  ///
  /// In en, this message translates to:
  /// **'Jonan'**
  String get cityJonan;

  /// No description provided for @cityJoso.
  ///
  /// In en, this message translates to:
  /// **'Joso'**
  String get cityJoso;

  /// No description provided for @cityJoto.
  ///
  /// In en, this message translates to:
  /// **'Joto'**
  String get cityJoto;

  /// No description provided for @cityJoyo.
  ///
  /// In en, this message translates to:
  /// **'Joyo'**
  String get cityJoyo;

  /// No description provided for @cityKabukicho.
  ///
  /// In en, this message translates to:
  /// **'Kabukicho'**
  String get cityKabukicho;

  /// No description provided for @cityKadoma.
  ///
  /// In en, this message translates to:
  /// **'Kadoma'**
  String get cityKadoma;

  /// No description provided for @cityKaga.
  ///
  /// In en, this message translates to:
  /// **'Kaga'**
  String get cityKaga;

  /// No description provided for @cityKagawa.
  ///
  /// In en, this message translates to:
  /// **'Kagawa'**
  String get cityKagawa;

  /// No description provided for @cityKagoshima.
  ///
  /// In en, this message translates to:
  /// **'Kagoshima'**
  String get cityKagoshima;

  /// No description provided for @cityKagoshimaCity.
  ///
  /// In en, this message translates to:
  /// **'Kagoshima City'**
  String get cityKagoshimaCity;

  /// No description provided for @cityKahoku.
  ///
  /// In en, this message translates to:
  /// **'Kahoku'**
  String get cityKahoku;

  /// No description provided for @cityKai.
  ///
  /// In en, this message translates to:
  /// **'Kai'**
  String get cityKai;

  /// No description provided for @cityKainan.
  ///
  /// In en, this message translates to:
  /// **'Kainan'**
  String get cityKainan;

  /// No description provided for @cityKaizuka.
  ///
  /// In en, this message translates to:
  /// **'Kaizuka'**
  String get cityKaizuka;

  /// No description provided for @cityKaizu.
  ///
  /// In en, this message translates to:
  /// **'Kaizu'**
  String get cityKaizu;

  /// No description provided for @cityKakamigahara.
  ///
  /// In en, this message translates to:
  /// **'Kakamigahara'**
  String get cityKakamigahara;

  /// No description provided for @cityKakegawa.
  ///
  /// In en, this message translates to:
  /// **'Kakegawa'**
  String get cityKakegawa;

  /// No description provided for @cityKakogawa.
  ///
  /// In en, this message translates to:
  /// **'Kakogawa'**
  String get cityKakogawa;

  /// No description provided for @cityKakuda.
  ///
  /// In en, this message translates to:
  /// **'Kakuda'**
  String get cityKakuda;

  /// No description provided for @cityKama.
  ///
  /// In en, this message translates to:
  /// **'Kama'**
  String get cityKama;

  /// No description provided for @cityKamagaya.
  ///
  /// In en, this message translates to:
  /// **'Kamagaya'**
  String get cityKamagaya;

  /// No description provided for @cityKamaishi.
  ///
  /// In en, this message translates to:
  /// **'Kamaishi'**
  String get cityKamaishi;

  /// No description provided for @cityKamakura.
  ///
  /// In en, this message translates to:
  /// **'Kamakura'**
  String get cityKamakura;

  /// No description provided for @cityKameoka.
  ///
  /// In en, this message translates to:
  /// **'Kameoka'**
  String get cityKameoka;

  /// No description provided for @cityKameyama.
  ///
  /// In en, this message translates to:
  /// **'Kameyama'**
  String get cityKameyama;

  /// No description provided for @cityKami.
  ///
  /// In en, this message translates to:
  /// **'Kami'**
  String get cityKami;

  /// No description provided for @cityKamiamakusa.
  ///
  /// In en, this message translates to:
  /// **'Kamiamakusa'**
  String get cityKamiamakusa;

  /// No description provided for @cityKamigyo.
  ///
  /// In en, this message translates to:
  /// **'Kamigyo'**
  String get cityKamigyo;

  /// No description provided for @cityKaminoyama.
  ///
  /// In en, this message translates to:
  /// **'Kaminoyama'**
  String get cityKaminoyama;

  /// No description provided for @cityKamo.
  ///
  /// In en, this message translates to:
  /// **'Kamo'**
  String get cityKamo;

  /// No description provided for @cityKamogawa.
  ///
  /// In en, this message translates to:
  /// **'Kamogawa'**
  String get cityKamogawa;

  /// No description provided for @cityKanagawa.
  ///
  /// In en, this message translates to:
  /// **'Kanagawa'**
  String get cityKanagawa;

  /// No description provided for @cityKanda.
  ///
  /// In en, this message translates to:
  /// **'Kanda'**
  String get cityKanda;

  /// No description provided for @cityKani.
  ///
  /// In en, this message translates to:
  /// **'Kani'**
  String get cityKani;

  /// No description provided for @cityKannonji.
  ///
  /// In en, this message translates to:
  /// **'Kan\'onji'**
  String get cityKannonji;

  /// No description provided for @cityKanoya.
  ///
  /// In en, this message translates to:
  /// **'Kanoya'**
  String get cityKanoya;

  /// No description provided for @cityKanuma.
  ///
  /// In en, this message translates to:
  /// **'Kanuma'**
  String get cityKanuma;

  /// No description provided for @cityKanzaki.
  ///
  /// In en, this message translates to:
  /// **'Kanzaki'**
  String get cityKanzaki;

  /// No description provided for @cityKanazawa.
  ///
  /// In en, this message translates to:
  /// **'Kanazawa'**
  String get cityKanazawa;

  /// No description provided for @cityKariya.
  ///
  /// In en, this message translates to:
  /// **'Kariya'**
  String get cityKariya;

  /// No description provided for @cityKaratsu.
  ///
  /// In en, this message translates to:
  /// **'Karatsu'**
  String get cityKaratsu;

  /// No description provided for @cityKasai.
  ///
  /// In en, this message translates to:
  /// **'Kasai'**
  String get cityKasai;

  /// No description provided for @cityKasama.
  ///
  /// In en, this message translates to:
  /// **'Kasama'**
  String get cityKasama;

  /// No description provided for @cityKasaoka.
  ///
  /// In en, this message translates to:
  /// **'Kasaoka'**
  String get cityKasaoka;

  /// No description provided for @cityKashiba.
  ///
  /// In en, this message translates to:
  /// **'Kashiba'**
  String get cityKashiba;

  /// No description provided for @cityKashihara.
  ///
  /// In en, this message translates to:
  /// **'Kashihara'**
  String get cityKashihara;

  /// No description provided for @cityKashima.
  ///
  /// In en, this message translates to:
  /// **'Kashima'**
  String get cityKashima;

  /// No description provided for @cityKashiwa.
  ///
  /// In en, this message translates to:
  /// **'Kashiwa'**
  String get cityKashiwa;

  /// No description provided for @cityKashiwara.
  ///
  /// In en, this message translates to:
  /// **'Kashiwara'**
  String get cityKashiwara;

  /// No description provided for @cityKashiwazaki.
  ///
  /// In en, this message translates to:
  /// **'Kashiwazaki'**
  String get cityKashiwazaki;

  /// No description provided for @cityKasuga.
  ///
  /// In en, this message translates to:
  /// **'Kasuga'**
  String get cityKasuga;

  /// No description provided for @cityKasugai.
  ///
  /// In en, this message translates to:
  /// **'Kasugai'**
  String get cityKasugai;

  /// No description provided for @cityKasukabe.
  ///
  /// In en, this message translates to:
  /// **'Kasukabe'**
  String get cityKasukabe;

  /// No description provided for @cityKatagami.
  ///
  /// In en, this message translates to:
  /// **'Katagami'**
  String get cityKatagami;

  /// No description provided for @cityKatano.
  ///
  /// In en, this message translates to:
  /// **'Katano'**
  String get cityKatano;

  /// No description provided for @cityKato.
  ///
  /// In en, this message translates to:
  /// **'Kato'**
  String get cityKato;

  /// No description provided for @cityKatori.
  ///
  /// In en, this message translates to:
  /// **'Katori'**
  String get cityKatori;

  /// No description provided for @cityKatsuragi.
  ///
  /// In en, this message translates to:
  /// **'Katsuragi'**
  String get cityKatsuragi;

  /// No description provided for @cityKatsuura.
  ///
  /// In en, this message translates to:
  /// **'Katsuura'**
  String get cityKatsuura;

  /// No description provided for @cityKatsuyama.
  ///
  /// In en, this message translates to:
  /// **'Katsuyama'**
  String get cityKatsuyama;

  /// No description provided for @cityKawachinagano.
  ///
  /// In en, this message translates to:
  /// **'Kawachinagano'**
  String get cityKawachinagano;

  /// No description provided for @cityKawagoe.
  ///
  /// In en, this message translates to:
  /// **'Kawagoe'**
  String get cityKawagoe;

  /// No description provided for @cityKawaguchi.
  ///
  /// In en, this message translates to:
  /// **'Kawaguchi'**
  String get cityKawaguchi;

  /// No description provided for @cityKawanishi.
  ///
  /// In en, this message translates to:
  /// **'Kawanishi'**
  String get cityKawanishi;

  /// No description provided for @cityKawasaki.
  ///
  /// In en, this message translates to:
  /// **'Kawasaki'**
  String get cityKawasaki;

  /// No description provided for @cityKazuno.
  ///
  /// In en, this message translates to:
  /// **'Kazuno'**
  String get cityKazuno;

  /// No description provided for @cityKazo.
  ///
  /// In en, this message translates to:
  /// **'Kazo'**
  String get cityKazo;

  /// No description provided for @cityKesennuma.
  ///
  /// In en, this message translates to:
  /// **'Kesennuma'**
  String get cityKesennuma;

  /// No description provided for @cityKikuchi.
  ///
  /// In en, this message translates to:
  /// **'Kikuchi'**
  String get cityKikuchi;

  /// No description provided for @cityKikugawa.
  ///
  /// In en, this message translates to:
  /// **'Kikugawa'**
  String get cityKikugawa;

  /// No description provided for @cityKimitsu.
  ///
  /// In en, this message translates to:
  /// **'Kimitsu'**
  String get cityKimitsu;

  /// No description provided for @cityKinkakujiArea.
  ///
  /// In en, this message translates to:
  /// **'Kinkakuji Area'**
  String get cityKinkakujiArea;

  /// No description provided for @cityKinokawa.
  ///
  /// In en, this message translates to:
  /// **'Kinokawa'**
  String get cityKinokawa;

  /// No description provided for @cityKirishima.
  ///
  /// In en, this message translates to:
  /// **'Kirishima'**
  String get cityKirishima;

  /// No description provided for @cityKiryu.
  ///
  /// In en, this message translates to:
  /// **'Kiryu'**
  String get cityKiryu;

  /// No description provided for @cityKisarazu.
  ///
  /// In en, this message translates to:
  /// **'Kisarazu'**
  String get cityKisarazu;

  /// No description provided for @cityKishiwada.
  ///
  /// In en, this message translates to:
  /// **'Kishiwada'**
  String get cityKishiwada;

  /// No description provided for @cityKitahiroshima.
  ///
  /// In en, this message translates to:
  /// **'Kitahiroshima'**
  String get cityKitahiroshima;

  /// No description provided for @cityKitaibaraki.
  ///
  /// In en, this message translates to:
  /// **'Kitaibaraki'**
  String get cityKitaibaraki;

  /// No description provided for @cityKitakami.
  ///
  /// In en, this message translates to:
  /// **'Kitakami'**
  String get cityKitakami;

  /// No description provided for @cityKitakata.
  ///
  /// In en, this message translates to:
  /// **'Kitakata'**
  String get cityKitakata;

  /// No description provided for @cityKitakyushu.
  ///
  /// In en, this message translates to:
  /// **'Kitakyushu'**
  String get cityKitakyushu;

  /// No description provided for @cityKitami.
  ///
  /// In en, this message translates to:
  /// **'Kitami'**
  String get cityKitami;

  /// No description provided for @cityKitamoto.
  ///
  /// In en, this message translates to:
  /// **'Kitamoto'**
  String get cityKitamoto;

  /// No description provided for @cityKitanagoya.
  ///
  /// In en, this message translates to:
  /// **'Kitanagoya'**
  String get cityKitanagoya;

  /// No description provided for @cityKitsuki.
  ///
  /// In en, this message translates to:
  /// **'Kitsuki'**
  String get cityKitsuki;

  /// No description provided for @cityKiyomizu.
  ///
  /// In en, this message translates to:
  /// **'Kiyomizu'**
  String get cityKiyomizu;

  /// No description provided for @cityKiyosu.
  ///
  /// In en, this message translates to:
  /// **'Kiyosu'**
  String get cityKiyosu;

  /// No description provided for @cityKizugawa.
  ///
  /// In en, this message translates to:
  /// **'Kizugawa'**
  String get cityKizugawa;

  /// No description provided for @cityKobe.
  ///
  /// In en, this message translates to:
  /// **'Kobe'**
  String get cityKobe;

  /// No description provided for @cityKobayashi.
  ///
  /// In en, this message translates to:
  /// **'Kobayashi'**
  String get cityKobayashi;

  /// No description provided for @cityKochi.
  ///
  /// In en, this message translates to:
  /// **'Kochi'**
  String get cityKochi;

  /// No description provided for @cityKochiCity.
  ///
  /// In en, this message translates to:
  /// **'Kochi City'**
  String get cityKochiCity;

  /// No description provided for @cityKofu.
  ///
  /// In en, this message translates to:
  /// **'Kofu'**
  String get cityKofu;

  /// No description provided for @cityKoga.
  ///
  /// In en, this message translates to:
  /// **'Koga'**
  String get cityKoga;

  /// No description provided for @cityKoka.
  ///
  /// In en, this message translates to:
  /// **'Koka'**
  String get cityKoka;

  /// No description provided for @cityKomagane.
  ///
  /// In en, this message translates to:
  /// **'Komagane'**
  String get cityKomagane;

  /// No description provided for @cityKomaki.
  ///
  /// In en, this message translates to:
  /// **'Komaki'**
  String get cityKomaki;

  /// No description provided for @cityKomatsu.
  ///
  /// In en, this message translates to:
  /// **'Komatsu'**
  String get cityKomatsu;

  /// No description provided for @cityKomatsushima.
  ///
  /// In en, this message translates to:
  /// **'Komatsushima'**
  String get cityKomatsushima;

  /// No description provided for @cityKomoro.
  ///
  /// In en, this message translates to:
  /// **'Komoro'**
  String get cityKomoro;

  /// No description provided for @cityKonan.
  ///
  /// In en, this message translates to:
  /// **'Konan'**
  String get cityKonan;

  /// No description provided for @cityKonohana.
  ///
  /// In en, this message translates to:
  /// **'Konohana'**
  String get cityKonohana;

  /// No description provided for @cityKoriyama.
  ///
  /// In en, this message translates to:
  /// **'Koriyama'**
  String get cityKoriyama;

  /// No description provided for @cityKosai.
  ///
  /// In en, this message translates to:
  /// **'Kosai'**
  String get cityKosai;

  /// No description provided for @cityKoshigaya.
  ///
  /// In en, this message translates to:
  /// **'Koshigaya'**
  String get cityKoshigaya;

  /// No description provided for @cityKoshi.
  ///
  /// In en, this message translates to:
  /// **'Koshi'**
  String get cityKoshi;

  /// No description provided for @cityKoshu.
  ///
  /// In en, this message translates to:
  /// **'Koshu'**
  String get cityKoshu;

  /// No description provided for @cityKudamatsu.
  ///
  /// In en, this message translates to:
  /// **'Kudamatsu'**
  String get cityKudamatsu;

  /// No description provided for @cityKuki.
  ///
  /// In en, this message translates to:
  /// **'Kuki'**
  String get cityKuki;

  /// No description provided for @cityKumamoto.
  ///
  /// In en, this message translates to:
  /// **'Kumamoto'**
  String get cityKumamoto;

  /// No description provided for @cityKumamotoCity.
  ///
  /// In en, this message translates to:
  /// **'Kumamoto City'**
  String get cityKumamotoCity;

  /// No description provided for @cityKumagaya.
  ///
  /// In en, this message translates to:
  /// **'Kumagaya'**
  String get cityKumagaya;

  /// No description provided for @cityKumano.
  ///
  /// In en, this message translates to:
  /// **'Kumano'**
  String get cityKumano;

  /// No description provided for @cityKunisaki.
  ///
  /// In en, this message translates to:
  /// **'Kunisaki'**
  String get cityKunisaki;

  /// No description provided for @cityKurashiki.
  ///
  /// In en, this message translates to:
  /// **'Kurashiki'**
  String get cityKurashiki;

  /// No description provided for @cityKurayoshi.
  ///
  /// In en, this message translates to:
  /// **'Kurayoshi'**
  String get cityKurayoshi;

  /// No description provided for @cityKure.
  ///
  /// In en, this message translates to:
  /// **'Kure'**
  String get cityKure;

  /// No description provided for @cityKurihara.
  ///
  /// In en, this message translates to:
  /// **'Kurihara'**
  String get cityKurihara;

  /// No description provided for @cityKuroishi.
  ///
  /// In en, this message translates to:
  /// **'Kuroishi'**
  String get cityKuroishi;

  /// No description provided for @cityKurobe.
  ///
  /// In en, this message translates to:
  /// **'Kurobe'**
  String get cityKurobe;

  /// No description provided for @cityKurume.
  ///
  /// In en, this message translates to:
  /// **'Kurume'**
  String get cityKurume;

  /// No description provided for @cityKushima.
  ///
  /// In en, this message translates to:
  /// **'Kushima'**
  String get cityKushima;

  /// No description provided for @cityKushiro.
  ///
  /// In en, this message translates to:
  /// **'Kushiro'**
  String get cityKushiro;

  /// No description provided for @cityKusatsu.
  ///
  /// In en, this message translates to:
  /// **'Kusatsu'**
  String get cityKusatsu;

  /// No description provided for @cityKuwana.
  ///
  /// In en, this message translates to:
  /// **'Kuwana'**
  String get cityKuwana;

  /// No description provided for @cityKyoto.
  ///
  /// In en, this message translates to:
  /// **'Kyoto'**
  String get cityKyoto;

  /// No description provided for @cityKyotoCity.
  ///
  /// In en, this message translates to:
  /// **'Kyoto City'**
  String get cityKyotoCity;

  /// No description provided for @cityKyotanabe.
  ///
  /// In en, this message translates to:
  /// **'Kyotanabe'**
  String get cityKyotanabe;

  /// No description provided for @cityKyotango.
  ///
  /// In en, this message translates to:
  /// **'Kyotango'**
  String get cityKyotango;

  /// No description provided for @cityKyotoStationArea.
  ///
  /// In en, this message translates to:
  /// **'Kyoto Station Area'**
  String get cityKyotoStationArea;

  /// No description provided for @cityMaebashi.
  ///
  /// In en, this message translates to:
  /// **'Maebashi'**
  String get cityMaebashi;

  /// No description provided for @cityMaibara.
  ///
  /// In en, this message translates to:
  /// **'Maibara'**
  String get cityMaibara;

  /// No description provided for @cityMaizuru.
  ///
  /// In en, this message translates to:
  /// **'Maizuru'**
  String get cityMaizuru;

  /// No description provided for @cityMakinohara.
  ///
  /// In en, this message translates to:
  /// **'Makinohara'**
  String get cityMakinohara;

  /// No description provided for @cityMakurazaki.
  ///
  /// In en, this message translates to:
  /// **'Makurazaki'**
  String get cityMakurazaki;

  /// No description provided for @cityManiwa.
  ///
  /// In en, this message translates to:
  /// **'Maniwa'**
  String get cityManiwa;

  /// No description provided for @cityMarugame.
  ///
  /// In en, this message translates to:
  /// **'Marugame'**
  String get cityMarugame;

  /// No description provided for @cityMarunouchi.
  ///
  /// In en, this message translates to:
  /// **'Marunouchi'**
  String get cityMarunouchi;

  /// No description provided for @cityMasuda.
  ///
  /// In en, this message translates to:
  /// **'Masuda'**
  String get cityMasuda;

  /// No description provided for @cityMatsubara.
  ///
  /// In en, this message translates to:
  /// **'Matsubara'**
  String get cityMatsubara;

  /// No description provided for @cityMatsudo.
  ///
  /// In en, this message translates to:
  /// **'Matsudo'**
  String get cityMatsudo;

  /// No description provided for @cityMatsue.
  ///
  /// In en, this message translates to:
  /// **'Matsue'**
  String get cityMatsue;

  /// No description provided for @cityMatsumoto.
  ///
  /// In en, this message translates to:
  /// **'Matsumoto'**
  String get cityMatsumoto;

  /// No description provided for @cityMatsusaka.
  ///
  /// In en, this message translates to:
  /// **'Matsusaka'**
  String get cityMatsusaka;

  /// No description provided for @cityMatsuura.
  ///
  /// In en, this message translates to:
  /// **'Matsuura'**
  String get cityMatsuura;

  /// No description provided for @cityMatsuyama.
  ///
  /// In en, this message translates to:
  /// **'Matsuyama'**
  String get cityMatsuyama;

  /// No description provided for @cityMie.
  ///
  /// In en, this message translates to:
  /// **'Mie'**
  String get cityMie;

  /// No description provided for @cityMihara.
  ///
  /// In en, this message translates to:
  /// **'Mihara'**
  String get cityMihara;

  /// No description provided for @cityMikasa.
  ///
  /// In en, this message translates to:
  /// **'Mikasa'**
  String get cityMikasa;

  /// No description provided for @cityMiki.
  ///
  /// In en, this message translates to:
  /// **'Miki'**
  String get cityMiki;

  /// No description provided for @cityMima.
  ///
  /// In en, this message translates to:
  /// **'Mima'**
  String get cityMima;

  /// No description provided for @cityMimasaka.
  ///
  /// In en, this message translates to:
  /// **'Mimasaka'**
  String get cityMimasaka;

  /// No description provided for @cityMinamiAlps.
  ///
  /// In en, this message translates to:
  /// **'Minami-Alps'**
  String get cityMinamiAlps;

  /// No description provided for @cityMinamiawaji.
  ///
  /// In en, this message translates to:
  /// **'Minamiawaji'**
  String get cityMinamiawaji;

  /// No description provided for @cityMinamiboso.
  ///
  /// In en, this message translates to:
  /// **'Minamiboso'**
  String get cityMinamiboso;

  /// No description provided for @cityMinamisatsuma.
  ///
  /// In en, this message translates to:
  /// **'Minamisatsuma'**
  String get cityMinamisatsuma;

  /// No description provided for @cityMinamata.
  ///
  /// In en, this message translates to:
  /// **'Minamata'**
  String get cityMinamata;

  /// No description provided for @cityMinamishimabara.
  ///
  /// In en, this message translates to:
  /// **'Minamishimabara'**
  String get cityMinamishimabara;

  /// No description provided for @cityMinamisoma.
  ///
  /// In en, this message translates to:
  /// **'Minamisoma'**
  String get cityMinamisoma;

  /// No description provided for @cityMinamiuonuma.
  ///
  /// In en, this message translates to:
  /// **'Minamiuonuma'**
  String get cityMinamiuonuma;

  /// No description provided for @cityMinatoMirai.
  ///
  /// In en, this message translates to:
  /// **'Minato Mirai'**
  String get cityMinatoMirai;

  /// No description provided for @cityMine.
  ///
  /// In en, this message translates to:
  /// **'Mine'**
  String get cityMine;

  /// No description provided for @cityMinoh.
  ///
  /// In en, this message translates to:
  /// **'Minoh'**
  String get cityMinoh;

  /// No description provided for @cityMino.
  ///
  /// In en, this message translates to:
  /// **'Mino'**
  String get cityMino;

  /// No description provided for @cityMinokamo.
  ///
  /// In en, this message translates to:
  /// **'Minokamo'**
  String get cityMinokamo;

  /// No description provided for @cityMisato.
  ///
  /// In en, this message translates to:
  /// **'Misato'**
  String get cityMisato;

  /// No description provided for @cityMisawa.
  ///
  /// In en, this message translates to:
  /// **'Misawa'**
  String get cityMisawa;

  /// No description provided for @cityMishima.
  ///
  /// In en, this message translates to:
  /// **'Mishima'**
  String get cityMishima;

  /// No description provided for @cityMito.
  ///
  /// In en, this message translates to:
  /// **'Mito'**
  String get cityMito;

  /// No description provided for @cityMitoyo.
  ///
  /// In en, this message translates to:
  /// **'Mitoyo'**
  String get cityMitoyo;

  /// No description provided for @cityMitsuke.
  ///
  /// In en, this message translates to:
  /// **'Mitsuke'**
  String get cityMitsuke;

  /// No description provided for @cityMiyagi.
  ///
  /// In en, this message translates to:
  /// **'Miyagi'**
  String get cityMiyagi;

  /// No description provided for @cityMiyako.
  ///
  /// In en, this message translates to:
  /// **'Miyako'**
  String get cityMiyako;

  /// No description provided for @cityMiyakojima.
  ///
  /// In en, this message translates to:
  /// **'Miyakojima'**
  String get cityMiyakojima;

  /// No description provided for @cityMiyakonojo.
  ///
  /// In en, this message translates to:
  /// **'Miyakonojo'**
  String get cityMiyakonojo;

  /// No description provided for @cityMiyama.
  ///
  /// In en, this message translates to:
  /// **'Miyama'**
  String get cityMiyama;

  /// No description provided for @cityMiyawaka.
  ///
  /// In en, this message translates to:
  /// **'Miyawaka'**
  String get cityMiyawaka;

  /// No description provided for @cityMiyazaki.
  ///
  /// In en, this message translates to:
  /// **'Miyazaki'**
  String get cityMiyazaki;

  /// No description provided for @cityMiyazakiCity.
  ///
  /// In en, this message translates to:
  /// **'Miyazaki City'**
  String get cityMiyazakiCity;

  /// No description provided for @cityMiyazu.
  ///
  /// In en, this message translates to:
  /// **'Miyazu'**
  String get cityMiyazu;

  /// No description provided for @cityMiyoshi.
  ///
  /// In en, this message translates to:
  /// **'Miyoshi'**
  String get cityMiyoshi;

  /// No description provided for @cityMizuho.
  ///
  /// In en, this message translates to:
  /// **'Mizuho'**
  String get cityMizuho;

  /// No description provided for @cityMizunami.
  ///
  /// In en, this message translates to:
  /// **'Mizunami'**
  String get cityMizunami;

  /// No description provided for @cityMobara.
  ///
  /// In en, this message translates to:
  /// **'Mobara'**
  String get cityMobara;

  /// No description provided for @cityMoka.
  ///
  /// In en, this message translates to:
  /// **'Moka'**
  String get cityMoka;

  /// No description provided for @cityMoriguchi.
  ///
  /// In en, this message translates to:
  /// **'Moriguchi'**
  String get cityMoriguchi;

  /// No description provided for @cityMorioka.
  ///
  /// In en, this message translates to:
  /// **'Morioka'**
  String get cityMorioka;

  /// No description provided for @cityMoriya.
  ///
  /// In en, this message translates to:
  /// **'Moriya'**
  String get cityMoriya;

  /// No description provided for @cityMoriyama.
  ///
  /// In en, this message translates to:
  /// **'Moriyama'**
  String get cityMoriyama;

  /// No description provided for @cityMotomiya.
  ///
  /// In en, this message translates to:
  /// **'Motomiya'**
  String get cityMotomiya;

  /// No description provided for @cityMotosu.
  ///
  /// In en, this message translates to:
  /// **'Motosu'**
  String get cityMotosu;

  /// No description provided for @cityMuko.
  ///
  /// In en, this message translates to:
  /// **'Muko'**
  String get cityMuko;

  /// No description provided for @cityMunakata.
  ///
  /// In en, this message translates to:
  /// **'Munakata'**
  String get cityMunakata;

  /// No description provided for @cityMurakami.
  ///
  /// In en, this message translates to:
  /// **'Murakami'**
  String get cityMurakami;

  /// No description provided for @cityMurayama.
  ///
  /// In en, this message translates to:
  /// **'Murayama'**
  String get cityMurayama;

  /// No description provided for @cityMonbetsu.
  ///
  /// In en, this message translates to:
  /// **'Monbetsu'**
  String get cityMonbetsu;

  /// No description provided for @cityMuroran.
  ///
  /// In en, this message translates to:
  /// **'Muroran'**
  String get cityMuroran;

  /// No description provided for @cityMuroto.
  ///
  /// In en, this message translates to:
  /// **'Muroto'**
  String get cityMuroto;

  /// No description provided for @cityMutsu.
  ///
  /// In en, this message translates to:
  /// **'Mutsu'**
  String get cityMutsu;

  /// No description provided for @cityMyoko.
  ///
  /// In en, this message translates to:
  /// **'Myoko'**
  String get cityMyoko;

  /// No description provided for @cityNabari.
  ///
  /// In en, this message translates to:
  /// **'Nabari'**
  String get cityNabari;

  /// No description provided for @cityNagai.
  ///
  /// In en, this message translates to:
  /// **'Nagai'**
  String get cityNagai;

  /// No description provided for @cityNagahama.
  ///
  /// In en, this message translates to:
  /// **'Nagahama'**
  String get cityNagahama;

  /// No description provided for @cityNagakute.
  ///
  /// In en, this message translates to:
  /// **'Nagakute'**
  String get cityNagakute;

  /// No description provided for @cityNagano.
  ///
  /// In en, this message translates to:
  /// **'Nagano'**
  String get cityNagano;

  /// No description provided for @cityNaganoCity.
  ///
  /// In en, this message translates to:
  /// **'Nagano City'**
  String get cityNaganoCity;

  /// No description provided for @cityNagaoka.
  ///
  /// In en, this message translates to:
  /// **'Nagaoka'**
  String get cityNagaoka;

  /// No description provided for @cityNagaokakyo.
  ///
  /// In en, this message translates to:
  /// **'Nagaokakyo'**
  String get cityNagaokakyo;

  /// No description provided for @cityNagareyama.
  ///
  /// In en, this message translates to:
  /// **'Nagareyama'**
  String get cityNagareyama;

  /// No description provided for @cityNagasaki.
  ///
  /// In en, this message translates to:
  /// **'Nagasaki'**
  String get cityNagasaki;

  /// No description provided for @cityNagasakiCity.
  ///
  /// In en, this message translates to:
  /// **'Nagasaki City'**
  String get cityNagasakiCity;

  /// No description provided for @cityNagato.
  ///
  /// In en, this message translates to:
  /// **'Nagato'**
  String get cityNagato;

  /// No description provided for @cityNagoya.
  ///
  /// In en, this message translates to:
  /// **'Nagoya'**
  String get cityNagoya;

  /// No description provided for @cityNago.
  ///
  /// In en, this message translates to:
  /// **'Nago'**
  String get cityNago;

  /// No description provided for @cityNaha.
  ///
  /// In en, this message translates to:
  /// **'Naha'**
  String get cityNaha;

  /// No description provided for @cityNakagawa.
  ///
  /// In en, this message translates to:
  /// **'Nakagawa'**
  String get cityNakagawa;

  /// No description provided for @cityNakagyo.
  ///
  /// In en, this message translates to:
  /// **'Nakagyo'**
  String get cityNakagyo;

  /// No description provided for @cityNakama.
  ///
  /// In en, this message translates to:
  /// **'Nakama'**
  String get cityNakama;

  /// No description provided for @cityNakamura.
  ///
  /// In en, this message translates to:
  /// **'Nakamura'**
  String get cityNakamura;

  /// No description provided for @cityNaniwa.
  ///
  /// In en, this message translates to:
  /// **'Naniwa'**
  String get cityNaniwa;

  /// No description provided for @cityNakanoshima.
  ///
  /// In en, this message translates to:
  /// **'Nakanoshima'**
  String get cityNakanoshima;

  /// No description provided for @cityNakatsugawa.
  ///
  /// In en, this message translates to:
  /// **'Nakatsugawa'**
  String get cityNakatsugawa;

  /// No description provided for @cityNakatsu.
  ///
  /// In en, this message translates to:
  /// **'Nakatsu'**
  String get cityNakatsu;

  /// No description provided for @cityNamba.
  ///
  /// In en, this message translates to:
  /// **'Namba'**
  String get cityNamba;

  /// No description provided for @cityNamerikawa.
  ///
  /// In en, this message translates to:
  /// **'Namerikawa'**
  String get cityNamerikawa;

  /// No description provided for @cityNankoku.
  ///
  /// In en, this message translates to:
  /// **'Nankoku'**
  String get cityNankoku;

  /// No description provided for @cityNanao.
  ///
  /// In en, this message translates to:
  /// **'Nanao'**
  String get cityNanao;

  /// No description provided for @cityNanjo.
  ///
  /// In en, this message translates to:
  /// **'Nanjo'**
  String get cityNanjo;

  /// No description provided for @cityNantan.
  ///
  /// In en, this message translates to:
  /// **'Nantan'**
  String get cityNantan;

  /// No description provided for @cityNanto.
  ///
  /// In en, this message translates to:
  /// **'Nanto'**
  String get cityNanto;

  /// No description provided for @cityNanyo.
  ///
  /// In en, this message translates to:
  /// **'Nanyo'**
  String get cityNanyo;

  /// No description provided for @cityNayoro.
  ///
  /// In en, this message translates to:
  /// **'Nayoro'**
  String get cityNayoro;

  /// No description provided for @cityNara.
  ///
  /// In en, this message translates to:
  /// **'Nara'**
  String get cityNara;

  /// No description provided for @cityNaraCity.
  ///
  /// In en, this message translates to:
  /// **'Nara City'**
  String get cityNaraCity;

  /// No description provided for @cityNarashino.
  ///
  /// In en, this message translates to:
  /// **'Narashino'**
  String get cityNarashino;

  /// No description provided for @cityNarita.
  ///
  /// In en, this message translates to:
  /// **'Narita'**
  String get cityNarita;

  /// No description provided for @cityNaruto.
  ///
  /// In en, this message translates to:
  /// **'Naruto'**
  String get cityNaruto;

  /// No description provided for @cityNasushiobara.
  ///
  /// In en, this message translates to:
  /// **'Nasushiobara'**
  String get cityNasushiobara;

  /// No description provided for @cityNasukarasuyama.
  ///
  /// In en, this message translates to:
  /// **'Nasukarasuyama'**
  String get cityNasukarasuyama;

  /// No description provided for @cityNatori.
  ///
  /// In en, this message translates to:
  /// **'Natori'**
  String get cityNatori;

  /// No description provided for @cityNemuro.
  ///
  /// In en, this message translates to:
  /// **'Nemuro'**
  String get cityNemuro;

  /// No description provided for @cityNeyagawa.
  ///
  /// In en, this message translates to:
  /// **'Neyagawa'**
  String get cityNeyagawa;

  /// No description provided for @cityNichinan.
  ///
  /// In en, this message translates to:
  /// **'Nichinan'**
  String get cityNichinan;

  /// No description provided for @cityNiigata.
  ///
  /// In en, this message translates to:
  /// **'Niigata'**
  String get cityNiigata;

  /// No description provided for @cityNiigataCity.
  ///
  /// In en, this message translates to:
  /// **'Niigata City'**
  String get cityNiigataCity;

  /// No description provided for @cityNiihama.
  ///
  /// In en, this message translates to:
  /// **'Niihama'**
  String get cityNiihama;

  /// No description provided for @cityNiimi.
  ///
  /// In en, this message translates to:
  /// **'Niimi'**
  String get cityNiimi;

  /// No description provided for @cityNiiza.
  ///
  /// In en, this message translates to:
  /// **'Niiza'**
  String get cityNiiza;

  /// No description provided for @cityNihonmatsu.
  ///
  /// In en, this message translates to:
  /// **'Nihonmatsu'**
  String get cityNihonmatsu;

  /// No description provided for @cityNikaho.
  ///
  /// In en, this message translates to:
  /// **'Nikaho'**
  String get cityNikaho;

  /// No description provided for @cityNikko.
  ///
  /// In en, this message translates to:
  /// **'Nikko'**
  String get cityNikko;

  /// No description provided for @cityNirasaki.
  ///
  /// In en, this message translates to:
  /// **'Nirasaki'**
  String get cityNirasaki;

  /// No description provided for @cityNiseko.
  ///
  /// In en, this message translates to:
  /// **'Niseko'**
  String get cityNiseko;

  /// No description provided for @cityNishikyo.
  ///
  /// In en, this message translates to:
  /// **'Nishikyo'**
  String get cityNishikyo;

  /// No description provided for @cityNishinomiya.
  ///
  /// In en, this message translates to:
  /// **'Nishinomiya'**
  String get cityNishinomiya;

  /// No description provided for @cityNishinari.
  ///
  /// In en, this message translates to:
  /// **'Nishinari'**
  String get cityNishinari;

  /// No description provided for @cityNishinoomote.
  ///
  /// In en, this message translates to:
  /// **'Nishinoomote'**
  String get cityNishinoomote;

  /// No description provided for @cityNisshin.
  ///
  /// In en, this message translates to:
  /// **'Nisshin'**
  String get cityNisshin;

  /// No description provided for @cityNishio.
  ///
  /// In en, this message translates to:
  /// **'Nishio'**
  String get cityNishio;

  /// No description provided for @cityNishiwaki.
  ///
  /// In en, this message translates to:
  /// **'Nishiwaki'**
  String get cityNishiwaki;

  /// No description provided for @cityNobeoka.
  ///
  /// In en, this message translates to:
  /// **'Nobeoka'**
  String get cityNobeoka;

  /// No description provided for @cityNoboribetsu.
  ///
  /// In en, this message translates to:
  /// **'Noboribetsu'**
  String get cityNoboribetsu;

  /// No description provided for @cityNoda.
  ///
  /// In en, this message translates to:
  /// **'Noda'**
  String get cityNoda;

  /// No description provided for @cityNogata.
  ///
  /// In en, this message translates to:
  /// **'Nogata'**
  String get cityNogata;

  /// No description provided for @cityNomi.
  ///
  /// In en, this message translates to:
  /// **'Nomi'**
  String get cityNomi;

  /// No description provided for @cityNonoichi.
  ///
  /// In en, this message translates to:
  /// **'Nonoichi'**
  String get cityNonoichi;

  /// No description provided for @cityNoshiro.
  ///
  /// In en, this message translates to:
  /// **'Noshiro'**
  String get cityNoshiro;

  /// No description provided for @cityNumata.
  ///
  /// In en, this message translates to:
  /// **'Numata'**
  String get cityNumata;

  /// No description provided for @cityNumazu.
  ///
  /// In en, this message translates to:
  /// **'Numazu'**
  String get cityNumazu;

  /// No description provided for @cityOamishirasato.
  ///
  /// In en, this message translates to:
  /// **'Oamishirasato'**
  String get cityOamishirasato;

  /// No description provided for @cityObanazawa.
  ///
  /// In en, this message translates to:
  /// **'Obanazawa'**
  String get cityObanazawa;

  /// No description provided for @cityObama.
  ///
  /// In en, this message translates to:
  /// **'Obama'**
  String get cityObama;

  /// No description provided for @cityObihiro.
  ///
  /// In en, this message translates to:
  /// **'Obihiro'**
  String get cityObihiro;

  /// No description provided for @cityObu.
  ///
  /// In en, this message translates to:
  /// **'Obu'**
  String get cityObu;

  /// No description provided for @cityOda.
  ///
  /// In en, this message translates to:
  /// **'Oda'**
  String get cityOda;

  /// No description provided for @cityOdaiba.
  ///
  /// In en, this message translates to:
  /// **'Odaiba'**
  String get cityOdaiba;

  /// No description provided for @cityOdate.
  ///
  /// In en, this message translates to:
  /// **'Odate'**
  String get cityOdate;

  /// No description provided for @cityOdawara.
  ///
  /// In en, this message translates to:
  /// **'Odawara'**
  String get cityOdawara;

  /// No description provided for @cityOfunato.
  ///
  /// In en, this message translates to:
  /// **'Ofunato'**
  String get cityOfunato;

  /// No description provided for @cityOgaki.
  ///
  /// In en, this message translates to:
  /// **'Ogaki'**
  String get cityOgaki;

  /// No description provided for @cityOgi.
  ///
  /// In en, this message translates to:
  /// **'Ogi'**
  String get cityOgi;

  /// No description provided for @cityOgori.
  ///
  /// In en, this message translates to:
  /// **'Ogori'**
  String get cityOgori;

  /// No description provided for @cityOita.
  ///
  /// In en, this message translates to:
  /// **'Oita'**
  String get cityOita;

  /// No description provided for @cityOitaCity.
  ///
  /// In en, this message translates to:
  /// **'Oita City'**
  String get cityOitaCity;

  /// No description provided for @cityOjiya.
  ///
  /// In en, this message translates to:
  /// **'Ojiya'**
  String get cityOjiya;

  /// No description provided for @cityOkawa.
  ///
  /// In en, this message translates to:
  /// **'Okawa'**
  String get cityOkawa;

  /// No description provided for @cityOkaya.
  ///
  /// In en, this message translates to:
  /// **'Okaya'**
  String get cityOkaya;

  /// No description provided for @cityOkayama.
  ///
  /// In en, this message translates to:
  /// **'Okayama'**
  String get cityOkayama;

  /// No description provided for @cityOkayamaCity.
  ///
  /// In en, this message translates to:
  /// **'Okayama City'**
  String get cityOkayamaCity;

  /// No description provided for @cityOkazaki.
  ///
  /// In en, this message translates to:
  /// **'Okazaki'**
  String get cityOkazaki;

  /// No description provided for @cityOkegawa.
  ///
  /// In en, this message translates to:
  /// **'Okegawa'**
  String get cityOkegawa;

  /// No description provided for @cityOkinawa.
  ///
  /// In en, this message translates to:
  /// **'Okinawa'**
  String get cityOkinawa;

  /// No description provided for @cityOmaezaki.
  ///
  /// In en, this message translates to:
  /// **'Omaezaki'**
  String get cityOmaezaki;

  /// No description provided for @cityOmachi.
  ///
  /// In en, this message translates to:
  /// **'Omachi'**
  String get cityOmachi;

  /// No description provided for @cityOmihachiman.
  ///
  /// In en, this message translates to:
  /// **'Omihachiman'**
  String get cityOmihachiman;

  /// No description provided for @cityOmiya.
  ///
  /// In en, this message translates to:
  /// **'Omiya'**
  String get cityOmiya;

  /// No description provided for @cityOmuta.
  ///
  /// In en, this message translates to:
  /// **'Omuta'**
  String get cityOmuta;

  /// No description provided for @cityOmura.
  ///
  /// In en, this message translates to:
  /// **'Omura'**
  String get cityOmura;

  /// No description provided for @cityOnojo.
  ///
  /// In en, this message translates to:
  /// **'Onojo'**
  String get cityOnojo;

  /// No description provided for @cityOnomichi.
  ///
  /// In en, this message translates to:
  /// **'Onomichi'**
  String get cityOnomichi;

  /// No description provided for @cityOno.
  ///
  /// In en, this message translates to:
  /// **'Ono'**
  String get cityOno;

  /// No description provided for @cityOsaka.
  ///
  /// In en, this message translates to:
  /// **'Osaka'**
  String get cityOsaka;

  /// No description provided for @cityOsakaCity.
  ///
  /// In en, this message translates to:
  /// **'Osaka City'**
  String get cityOsakaCity;

  /// No description provided for @cityOsakasayama.
  ///
  /// In en, this message translates to:
  /// **'Osakasayama'**
  String get cityOsakasayama;

  /// No description provided for @cityOsaki.
  ///
  /// In en, this message translates to:
  /// **'Osaki'**
  String get cityOsaki;

  /// No description provided for @cityOshu.
  ///
  /// In en, this message translates to:
  /// **'Oshu'**
  String get cityOshu;

  /// No description provided for @cityOtake.
  ///
  /// In en, this message translates to:
  /// **'Otake'**
  String get cityOtake;

  /// No description provided for @cityOtaru.
  ///
  /// In en, this message translates to:
  /// **'Otaru'**
  String get cityOtaru;

  /// No description provided for @cityOhtawara.
  ///
  /// In en, this message translates to:
  /// **'Ohtawara'**
  String get cityOhtawara;

  /// No description provided for @cityOtsu.
  ///
  /// In en, this message translates to:
  /// **'Otsu'**
  String get cityOtsu;

  /// No description provided for @cityOtsuki.
  ///
  /// In en, this message translates to:
  /// **'Otsuki'**
  String get cityOtsuki;

  /// No description provided for @cityOwariasahi.
  ///
  /// In en, this message translates to:
  /// **'Owariasahi'**
  String get cityOwariasahi;

  /// No description provided for @cityOwase.
  ///
  /// In en, this message translates to:
  /// **'Owase'**
  String get cityOwase;

  /// No description provided for @cityOyabe.
  ///
  /// In en, this message translates to:
  /// **'Oyabe'**
  String get cityOyabe;

  /// No description provided for @cityOyama.
  ///
  /// In en, this message translates to:
  /// **'Oyama'**
  String get cityOyama;

  /// No description provided for @cityOzu.
  ///
  /// In en, this message translates to:
  /// **'Ozu'**
  String get cityOzu;

  /// No description provided for @cityRikuzentakata.
  ///
  /// In en, this message translates to:
  /// **'Rikuzentakata'**
  String get cityRikuzentakata;

  /// No description provided for @cityRitto.
  ///
  /// In en, this message translates to:
  /// **'Ritto'**
  String get cityRitto;

  /// No description provided for @cityRoppongi.
  ///
  /// In en, this message translates to:
  /// **'Roppongi'**
  String get cityRoppongi;

  /// No description provided for @cityRumoi.
  ///
  /// In en, this message translates to:
  /// **'Rumoi'**
  String get cityRumoi;

  /// No description provided for @cityRyugasaki.
  ///
  /// In en, this message translates to:
  /// **'Ryugasaki'**
  String get cityRyugasaki;

  /// No description provided for @citySabae.
  ///
  /// In en, this message translates to:
  /// **'Sabae'**
  String get citySabae;

  /// No description provided for @citySado.
  ///
  /// In en, this message translates to:
  /// **'Sado'**
  String get citySado;

  /// No description provided for @citySaga.
  ///
  /// In en, this message translates to:
  /// **'Saga'**
  String get citySaga;

  /// No description provided for @citySagaCity.
  ///
  /// In en, this message translates to:
  /// **'Saga City'**
  String get citySagaCity;

  /// No description provided for @citySagae.
  ///
  /// In en, this message translates to:
  /// **'Sagae'**
  String get citySagae;

  /// No description provided for @citySagamihara.
  ///
  /// In en, this message translates to:
  /// **'Sagamihara'**
  String get citySagamihara;

  /// No description provided for @citySaijo.
  ///
  /// In en, this message translates to:
  /// **'Saijo'**
  String get citySaijo;

  /// No description provided for @citySaiki.
  ///
  /// In en, this message translates to:
  /// **'Saiki'**
  String get citySaiki;

  /// No description provided for @citySaikai.
  ///
  /// In en, this message translates to:
  /// **'Saikai'**
  String get citySaikai;

  /// No description provided for @citySaitama.
  ///
  /// In en, this message translates to:
  /// **'Saitama'**
  String get citySaitama;

  /// No description provided for @citySaito.
  ///
  /// In en, this message translates to:
  /// **'Saito'**
  String get citySaito;

  /// No description provided for @citySakado.
  ///
  /// In en, this message translates to:
  /// **'Sakado'**
  String get citySakado;

  /// No description provided for @citySakai.
  ///
  /// In en, this message translates to:
  /// **'Sakai'**
  String get citySakai;

  /// No description provided for @citySakaide.
  ///
  /// In en, this message translates to:
  /// **'Sakaide'**
  String get citySakaide;

  /// No description provided for @citySakaiminato.
  ///
  /// In en, this message translates to:
  /// **'Sakaiminato'**
  String get citySakaiminato;

  /// No description provided for @citySakata.
  ///
  /// In en, this message translates to:
  /// **'Sakata'**
  String get citySakata;

  /// No description provided for @citySakura.
  ///
  /// In en, this message translates to:
  /// **'Sakura'**
  String get citySakura;

  /// No description provided for @citySakurai.
  ///
  /// In en, this message translates to:
  /// **'Sakurai'**
  String get citySakurai;

  /// No description provided for @citySaku.
  ///
  /// In en, this message translates to:
  /// **'Saku'**
  String get citySaku;

  /// No description provided for @citySanda.
  ///
  /// In en, this message translates to:
  /// **'Sanda'**
  String get citySanda;

  /// No description provided for @citySangenjaya.
  ///
  /// In en, this message translates to:
  /// **'Sangenjaya'**
  String get citySangenjaya;

  /// No description provided for @citySanjo.
  ///
  /// In en, this message translates to:
  /// **'Sanjo'**
  String get citySanjo;

  /// No description provided for @citySanmu.
  ///
  /// In en, this message translates to:
  /// **'Sanmu'**
  String get citySanmu;

  /// No description provided for @citySano.
  ///
  /// In en, this message translates to:
  /// **'Sano'**
  String get citySano;

  /// No description provided for @citySanuki.
  ///
  /// In en, this message translates to:
  /// **'Sanuki'**
  String get citySanuki;

  /// No description provided for @citySanyoOnoda.
  ///
  /// In en, this message translates to:
  /// **'Sanyo-Onoda'**
  String get citySanyoOnoda;

  /// No description provided for @citySasayama.
  ///
  /// In en, this message translates to:
  /// **'Sasayama'**
  String get citySasayama;

  /// No description provided for @citySasebo.
  ///
  /// In en, this message translates to:
  /// **'Sasebo'**
  String get citySasebo;

  /// No description provided for @citySatsuma.
  ///
  /// In en, this message translates to:
  /// **'Satsuma'**
  String get citySatsuma;

  /// No description provided for @citySatsumasendai.
  ///
  /// In en, this message translates to:
  /// **'Satsumasendai'**
  String get citySatsumasendai;

  /// No description provided for @citySayama.
  ///
  /// In en, this message translates to:
  /// **'Sayama'**
  String get citySayama;

  /// No description provided for @citySawara.
  ///
  /// In en, this message translates to:
  /// **'Sawara'**
  String get citySawara;

  /// No description provided for @citySeiyo.
  ///
  /// In en, this message translates to:
  /// **'Seiyo'**
  String get citySeiyo;

  /// No description provided for @citySeki.
  ///
  /// In en, this message translates to:
  /// **'Seki'**
  String get citySeki;

  /// No description provided for @citySemboku.
  ///
  /// In en, this message translates to:
  /// **'Semboku'**
  String get citySemboku;

  /// No description provided for @citySendai.
  ///
  /// In en, this message translates to:
  /// **'Sendai'**
  String get citySendai;

  /// No description provided for @citySennan.
  ///
  /// In en, this message translates to:
  /// **'Sennan'**
  String get citySennan;

  /// No description provided for @cityShibetsu.
  ///
  /// In en, this message translates to:
  /// **'Shibetsu'**
  String get cityShibetsu;

  /// No description provided for @citySeto.
  ///
  /// In en, this message translates to:
  /// **'Seto'**
  String get citySeto;

  /// No description provided for @citySetouchi.
  ///
  /// In en, this message translates to:
  /// **'Setouchi'**
  String get citySetouchi;

  /// No description provided for @citySettsu.
  ///
  /// In en, this message translates to:
  /// **'Settsu'**
  String get citySettsu;

  /// No description provided for @cityShibata.
  ///
  /// In en, this message translates to:
  /// **'Shibata'**
  String get cityShibata;

  /// No description provided for @cityShibukawa.
  ///
  /// In en, this message translates to:
  /// **'Shibukawa'**
  String get cityShibukawa;

  /// No description provided for @cityShiga.
  ///
  /// In en, this message translates to:
  /// **'Shiga'**
  String get cityShiga;

  /// No description provided for @cityShiki.
  ///
  /// In en, this message translates to:
  /// **'Shiki'**
  String get cityShiki;

  /// No description provided for @cityShikokuchuo.
  ///
  /// In en, this message translates to:
  /// **'Shikokuchuo'**
  String get cityShikokuchuo;

  /// No description provided for @cityShima.
  ///
  /// In en, this message translates to:
  /// **'Shima'**
  String get cityShima;

  /// No description provided for @cityShimabara.
  ///
  /// In en, this message translates to:
  /// **'Shimabara'**
  String get cityShimabara;

  /// No description provided for @cityShimada.
  ///
  /// In en, this message translates to:
  /// **'Shimada'**
  String get cityShimada;

  /// No description provided for @cityShimane.
  ///
  /// In en, this message translates to:
  /// **'Shimane'**
  String get cityShimane;

  /// No description provided for @cityShimanto.
  ///
  /// In en, this message translates to:
  /// **'Shimanto'**
  String get cityShimanto;

  /// No description provided for @cityShimoda.
  ///
  /// In en, this message translates to:
  /// **'Shimoda'**
  String get cityShimoda;

  /// No description provided for @cityShimokitazawa.
  ///
  /// In en, this message translates to:
  /// **'Shimokitazawa'**
  String get cityShimokitazawa;

  /// No description provided for @cityShimonoseki.
  ///
  /// In en, this message translates to:
  /// **'Shimonoseki'**
  String get cityShimonoseki;

  /// No description provided for @cityShimotsuke.
  ///
  /// In en, this message translates to:
  /// **'Shimotsuke'**
  String get cityShimotsuke;

  /// No description provided for @cityShimotsuma.
  ///
  /// In en, this message translates to:
  /// **'Shimotsuma'**
  String get cityShimotsuma;

  /// No description provided for @cityShingu.
  ///
  /// In en, this message translates to:
  /// **'Shingu'**
  String get cityShingu;

  /// No description provided for @cityShinjo.
  ///
  /// In en, this message translates to:
  /// **'Shinjo'**
  String get cityShinjo;

  /// No description provided for @cityShinsaibashi.
  ///
  /// In en, this message translates to:
  /// **'Shinsaibashi'**
  String get cityShinsaibashi;

  /// No description provided for @cityShinsho.
  ///
  /// In en, this message translates to:
  /// **'Shinshiro'**
  String get cityShinsho;

  /// No description provided for @cityShiogama.
  ///
  /// In en, this message translates to:
  /// **'Shiogama'**
  String get cityShiogama;

  /// No description provided for @cityShiojiri.
  ///
  /// In en, this message translates to:
  /// **'Shiojiri'**
  String get cityShiojiri;

  /// No description provided for @cityShijonawate.
  ///
  /// In en, this message translates to:
  /// **'Shijonawate'**
  String get cityShijonawate;

  /// No description provided for @cityShiraoka.
  ///
  /// In en, this message translates to:
  /// **'Shiraoka'**
  String get cityShiraoka;

  /// No description provided for @cityShirakawa.
  ///
  /// In en, this message translates to:
  /// **'Shirakawa'**
  String get cityShirakawa;

  /// No description provided for @cityShiroishi.
  ///
  /// In en, this message translates to:
  /// **'Shiroishi'**
  String get cityShiroishi;

  /// No description provided for @cityShiroi.
  ///
  /// In en, this message translates to:
  /// **'Shiroi'**
  String get cityShiroi;

  /// No description provided for @cityShiwa.
  ///
  /// In en, this message translates to:
  /// **'Shiwa'**
  String get cityShiwa;

  /// No description provided for @cityShiso.
  ///
  /// In en, this message translates to:
  /// **'Shiso'**
  String get cityShiso;

  /// No description provided for @cityShizuoka.
  ///
  /// In en, this message translates to:
  /// **'Shizuoka'**
  String get cityShizuoka;

  /// No description provided for @cityShizuokaCity.
  ///
  /// In en, this message translates to:
  /// **'Shizuoka City'**
  String get cityShizuokaCity;

  /// No description provided for @cityShobara.
  ///
  /// In en, this message translates to:
  /// **'Shobara'**
  String get cityShobara;

  /// No description provided for @cityShowa.
  ///
  /// In en, this message translates to:
  /// **'Showa'**
  String get cityShowa;

  /// No description provided for @cityShunan.
  ///
  /// In en, this message translates to:
  /// **'Shunan'**
  String get cityShunan;

  /// No description provided for @citySodegaura.
  ///
  /// In en, this message translates to:
  /// **'Sodegaura'**
  String get citySodegaura;

  /// No description provided for @citySoja.
  ///
  /// In en, this message translates to:
  /// **'Soja'**
  String get citySoja;

  /// No description provided for @citySoka.
  ///
  /// In en, this message translates to:
  /// **'Soka'**
  String get citySoka;

  /// No description provided for @citySoma.
  ///
  /// In en, this message translates to:
  /// **'Soma'**
  String get citySoma;

  /// No description provided for @citySoo.
  ///
  /// In en, this message translates to:
  /// **'Soo'**
  String get citySoo;

  /// No description provided for @citySosa.
  ///
  /// In en, this message translates to:
  /// **'Sosa'**
  String get citySosa;

  /// No description provided for @citySuita.
  ///
  /// In en, this message translates to:
  /// **'Suita'**
  String get citySuita;

  /// No description provided for @citySukagawa.
  ///
  /// In en, this message translates to:
  /// **'Sukagawa'**
  String get citySukagawa;

  /// No description provided for @citySukumo.
  ///
  /// In en, this message translates to:
  /// **'Sukumo'**
  String get citySukumo;

  /// No description provided for @citySumoto.
  ///
  /// In en, this message translates to:
  /// **'Sumoto'**
  String get citySumoto;

  /// No description provided for @citySunagawa.
  ///
  /// In en, this message translates to:
  /// **'Sunagawa'**
  String get citySunagawa;

  /// No description provided for @citySusaki.
  ///
  /// In en, this message translates to:
  /// **'Susaki'**
  String get citySusaki;

  /// No description provided for @citySusono.
  ///
  /// In en, this message translates to:
  /// **'Susono'**
  String get citySusono;

  /// No description provided for @citySusukino.
  ///
  /// In en, this message translates to:
  /// **'Susukino'**
  String get citySusukino;

  /// No description provided for @citySuwa.
  ///
  /// In en, this message translates to:
  /// **'Suwa'**
  String get citySuwa;

  /// No description provided for @citySuzu.
  ///
  /// In en, this message translates to:
  /// **'Suzu'**
  String get citySuzu;

  /// No description provided for @citySuzaka.
  ///
  /// In en, this message translates to:
  /// **'Suzaka'**
  String get citySuzaka;

  /// No description provided for @citySuzuka.
  ///
  /// In en, this message translates to:
  /// **'Suzuka'**
  String get citySuzuka;

  /// No description provided for @cityTagajo.
  ///
  /// In en, this message translates to:
  /// **'Tagajo'**
  String get cityTagajo;

  /// No description provided for @cityTagawa.
  ///
  /// In en, this message translates to:
  /// **'Tagawa'**
  String get cityTagawa;

  /// No description provided for @cityTainai.
  ///
  /// In en, this message translates to:
  /// **'Tainai'**
  String get cityTainai;

  /// No description provided for @cityTaisho.
  ///
  /// In en, this message translates to:
  /// **'Taisho'**
  String get cityTaisho;

  /// No description provided for @cityTajimi.
  ///
  /// In en, this message translates to:
  /// **'Tajimi'**
  String get cityTajimi;

  /// No description provided for @cityTakahagi.
  ///
  /// In en, this message translates to:
  /// **'Takahagi'**
  String get cityTakahagi;

  /// No description provided for @cityTakahama.
  ///
  /// In en, this message translates to:
  /// **'Takahama'**
  String get cityTakahama;

  /// No description provided for @cityTakahashi.
  ///
  /// In en, this message translates to:
  /// **'Takahashi'**
  String get cityTakahashi;

  /// No description provided for @cityTakikawa.
  ///
  /// In en, this message translates to:
  /// **'Takikawa'**
  String get cityTakikawa;

  /// No description provided for @cityTaku.
  ///
  /// In en, this message translates to:
  /// **'Taku'**
  String get cityTaku;

  /// No description provided for @cityTakaishi.
  ///
  /// In en, this message translates to:
  /// **'Takaishi'**
  String get cityTakaishi;

  /// No description provided for @cityTakamatsu.
  ///
  /// In en, this message translates to:
  /// **'Takamatsu'**
  String get cityTakamatsu;

  /// No description provided for @cityTakaoka.
  ///
  /// In en, this message translates to:
  /// **'Takaoka'**
  String get cityTakaoka;

  /// No description provided for @cityTakasago.
  ///
  /// In en, this message translates to:
  /// **'Takasago'**
  String get cityTakasago;

  /// No description provided for @cityTakasaki.
  ///
  /// In en, this message translates to:
  /// **'Takasaki'**
  String get cityTakasaki;

  /// No description provided for @cityTakashima.
  ///
  /// In en, this message translates to:
  /// **'Takashima'**
  String get cityTakashima;

  /// No description provided for @cityTakarazuka.
  ///
  /// In en, this message translates to:
  /// **'Takarazuka'**
  String get cityTakarazuka;

  /// No description provided for @cityTakatsuki.
  ///
  /// In en, this message translates to:
  /// **'Takatsuki'**
  String get cityTakatsuki;

  /// No description provided for @cityTakayama.
  ///
  /// In en, this message translates to:
  /// **'Takayama'**
  String get cityTakayama;

  /// No description provided for @cityTakeo.
  ///
  /// In en, this message translates to:
  /// **'Takeo'**
  String get cityTakeo;

  /// No description provided for @cityTakehara.
  ///
  /// In en, this message translates to:
  /// **'Takehara'**
  String get cityTakehara;

  /// No description provided for @cityTaketa.
  ///
  /// In en, this message translates to:
  /// **'Taketa'**
  String get cityTaketa;

  /// No description provided for @cityTakizawa.
  ///
  /// In en, this message translates to:
  /// **'Takizawa'**
  String get cityTakizawa;

  /// No description provided for @cityTamana.
  ///
  /// In en, this message translates to:
  /// **'Tamana'**
  String get cityTamana;

  /// No description provided for @cityTamano.
  ///
  /// In en, this message translates to:
  /// **'Tamano'**
  String get cityTamano;

  /// No description provided for @cityTamba.
  ///
  /// In en, this message translates to:
  /// **'Tanba'**
  String get cityTamba;

  /// No description provided for @cityTambaSasayama.
  ///
  /// In en, this message translates to:
  /// **'Tamba-Sasayama'**
  String get cityTambaSasayama;

  /// No description provided for @cityTamura.
  ///
  /// In en, this message translates to:
  /// **'Tamura'**
  String get cityTamura;

  /// No description provided for @cityTahara.
  ///
  /// In en, this message translates to:
  /// **'Tahara'**
  String get cityTahara;

  /// No description provided for @cityTanabe.
  ///
  /// In en, this message translates to:
  /// **'Tanabe'**
  String get cityTanabe;

  /// No description provided for @cityTatebayashi.
  ///
  /// In en, this message translates to:
  /// **'Tatebayashi'**
  String get cityTatebayashi;

  /// No description provided for @cityTatsuno.
  ///
  /// In en, this message translates to:
  /// **'Tatsuno'**
  String get cityTatsuno;

  /// No description provided for @cityTarumizu.
  ///
  /// In en, this message translates to:
  /// **'Tarumizu'**
  String get cityTarumizu;

  /// No description provided for @cityTendo.
  ///
  /// In en, this message translates to:
  /// **'Tendo'**
  String get cityTendo;

  /// No description provided for @cityTempaku.
  ///
  /// In en, this message translates to:
  /// **'Tempaku'**
  String get cityTempaku;

  /// No description provided for @cityTenjinCentral.
  ///
  /// In en, this message translates to:
  /// **'Tenjin Central'**
  String get cityTenjinCentral;

  /// No description provided for @cityTenri.
  ///
  /// In en, this message translates to:
  /// **'Tenri'**
  String get cityTenri;

  /// No description provided for @cityToba.
  ///
  /// In en, this message translates to:
  /// **'Toba'**
  String get cityToba;

  /// No description provided for @cityTochigi.
  ///
  /// In en, this message translates to:
  /// **'Tochigi'**
  String get cityTochigi;

  /// No description provided for @cityToda.
  ///
  /// In en, this message translates to:
  /// **'Toda'**
  String get cityToda;

  /// No description provided for @cityTogane.
  ///
  /// In en, this message translates to:
  /// **'Togane'**
  String get cityTogane;

  /// No description provided for @cityToki.
  ///
  /// In en, this message translates to:
  /// **'Toki'**
  String get cityToki;

  /// No description provided for @cityTomiya.
  ///
  /// In en, this message translates to:
  /// **'Tomiya'**
  String get cityTomiya;

  /// No description provided for @cityTokai.
  ///
  /// In en, this message translates to:
  /// **'Tokai'**
  String get cityTokai;

  /// No description provided for @cityTokamachi.
  ///
  /// In en, this message translates to:
  /// **'Tokamachi'**
  String get cityTokamachi;

  /// No description provided for @cityTokoname.
  ///
  /// In en, this message translates to:
  /// **'Tokoname'**
  String get cityTokoname;

  /// No description provided for @cityTokorozawa.
  ///
  /// In en, this message translates to:
  /// **'Tokorozawa'**
  String get cityTokorozawa;

  /// No description provided for @cityTokushima.
  ///
  /// In en, this message translates to:
  /// **'Tokushima'**
  String get cityTokushima;

  /// No description provided for @cityTokushimaCity.
  ///
  /// In en, this message translates to:
  /// **'Tokushima City'**
  String get cityTokushimaCity;

  /// No description provided for @cityTokyo.
  ///
  /// In en, this message translates to:
  /// **'Tokyo'**
  String get cityTokyo;

  /// No description provided for @cityTomakomai.
  ///
  /// In en, this message translates to:
  /// **'Tomakomai'**
  String get cityTomakomai;

  /// No description provided for @cityTome.
  ///
  /// In en, this message translates to:
  /// **'Tome'**
  String get cityTome;

  /// No description provided for @cityTomi.
  ///
  /// In en, this message translates to:
  /// **'Tomi'**
  String get cityTomi;

  /// No description provided for @cityTomigusuku.
  ///
  /// In en, this message translates to:
  /// **'Tomigusuku'**
  String get cityTomigusuku;

  /// No description provided for @cityTomioka.
  ///
  /// In en, this message translates to:
  /// **'Tomioka'**
  String get cityTomioka;

  /// No description provided for @cityTomisato.
  ///
  /// In en, this message translates to:
  /// **'Tomisato'**
  String get cityTomisato;

  /// No description provided for @cityTonami.
  ///
  /// In en, this message translates to:
  /// **'Tonami'**
  String get cityTonami;

  /// No description provided for @cityTondabayashi.
  ///
  /// In en, this message translates to:
  /// **'Tondabayashi'**
  String get cityTondabayashi;

  /// No description provided for @cityTono.
  ///
  /// In en, this message translates to:
  /// **'Tono'**
  String get cityTono;

  /// No description provided for @cityToon.
  ///
  /// In en, this message translates to:
  /// **'Toon'**
  String get cityToon;

  /// No description provided for @cityToride.
  ///
  /// In en, this message translates to:
  /// **'Toride'**
  String get cityToride;

  /// No description provided for @cityTosa.
  ///
  /// In en, this message translates to:
  /// **'Tosa'**
  String get cityTosa;

  /// No description provided for @cityTosashimizu.
  ///
  /// In en, this message translates to:
  /// **'Tosashimizu'**
  String get cityTosashimizu;

  /// No description provided for @cityTosu.
  ///
  /// In en, this message translates to:
  /// **'Tosu'**
  String get cityTosu;

  /// No description provided for @cityTottori.
  ///
  /// In en, this message translates to:
  /// **'Tottori'**
  String get cityTottori;

  /// No description provided for @cityTottoriCity.
  ///
  /// In en, this message translates to:
  /// **'Tottori City'**
  String get cityTottoriCity;

  /// No description provided for @cityTowada.
  ///
  /// In en, this message translates to:
  /// **'Towada'**
  String get cityTowada;

  /// No description provided for @cityToyama.
  ///
  /// In en, this message translates to:
  /// **'Toyama'**
  String get cityToyama;

  /// No description provided for @cityToyamaCity.
  ///
  /// In en, this message translates to:
  /// **'Toyama City'**
  String get cityToyamaCity;

  /// No description provided for @cityToyohashi.
  ///
  /// In en, this message translates to:
  /// **'Toyohashi'**
  String get cityToyohashi;

  /// No description provided for @cityToyokawa.
  ///
  /// In en, this message translates to:
  /// **'Toyokawa'**
  String get cityToyokawa;

  /// No description provided for @cityToyonaka.
  ///
  /// In en, this message translates to:
  /// **'Toyonaka'**
  String get cityToyonaka;

  /// No description provided for @cityToyoake.
  ///
  /// In en, this message translates to:
  /// **'Toyoake'**
  String get cityToyoake;

  /// No description provided for @cityToyooka.
  ///
  /// In en, this message translates to:
  /// **'Toyooka'**
  String get cityToyooka;

  /// No description provided for @cityToyota.
  ///
  /// In en, this message translates to:
  /// **'Toyota'**
  String get cityToyota;

  /// No description provided for @cityTsubame.
  ///
  /// In en, this message translates to:
  /// **'Tsubame'**
  String get cityTsubame;

  /// No description provided for @cityTsuchiura.
  ///
  /// In en, this message translates to:
  /// **'Tsuchiura'**
  String get cityTsuchiura;

  /// No description provided for @cityTsugaru.
  ///
  /// In en, this message translates to:
  /// **'Tsugaru'**
  String get cityTsugaru;

  /// No description provided for @cityTsukuba.
  ///
  /// In en, this message translates to:
  /// **'Tsukuba'**
  String get cityTsukuba;

  /// No description provided for @cityTsukumi.
  ///
  /// In en, this message translates to:
  /// **'Tsukumi'**
  String get cityTsukumi;

  /// No description provided for @cityTsu.
  ///
  /// In en, this message translates to:
  /// **'Tsu'**
  String get cityTsu;

  /// No description provided for @cityTsuruga.
  ///
  /// In en, this message translates to:
  /// **'Tsuruga'**
  String get cityTsuruga;

  /// No description provided for @cityTsurugashima.
  ///
  /// In en, this message translates to:
  /// **'Tsurugashima'**
  String get cityTsurugashima;

  /// No description provided for @cityTsuruoka.
  ///
  /// In en, this message translates to:
  /// **'Tsuruoka'**
  String get cityTsuruoka;

  /// No description provided for @cityTsuru.
  ///
  /// In en, this message translates to:
  /// **'Tsuru'**
  String get cityTsuru;

  /// No description provided for @cityTsushima.
  ///
  /// In en, this message translates to:
  /// **'Tsushima'**
  String get cityTsushima;

  /// No description provided for @cityTsuyama.
  ///
  /// In en, this message translates to:
  /// **'Tsuyama'**
  String get cityTsuyama;

  /// No description provided for @cityUbe.
  ///
  /// In en, this message translates to:
  /// **'Ube'**
  String get cityUbe;

  /// No description provided for @cityUchi.
  ///
  /// In en, this message translates to:
  /// **'Uchiko'**
  String get cityUchi;

  /// No description provided for @cityUda.
  ///
  /// In en, this message translates to:
  /// **'Uda'**
  String get cityUda;

  /// No description provided for @cityUeda.
  ///
  /// In en, this message translates to:
  /// **'Ueda'**
  String get cityUeda;

  /// No description provided for @cityUenohara.
  ///
  /// In en, this message translates to:
  /// **'Uenohara'**
  String get cityUenohara;

  /// No description provided for @cityUeno.
  ///
  /// In en, this message translates to:
  /// **'Ueno'**
  String get cityUeno;

  /// No description provided for @cityUji.
  ///
  /// In en, this message translates to:
  /// **'Uji'**
  String get cityUji;

  /// No description provided for @cityUkiha.
  ///
  /// In en, this message translates to:
  /// **'Ukiha'**
  String get cityUkiha;

  /// No description provided for @cityUki.
  ///
  /// In en, this message translates to:
  /// **'Uki'**
  String get cityUki;

  /// No description provided for @cityUkyo.
  ///
  /// In en, this message translates to:
  /// **'Ukyo'**
  String get cityUkyo;

  /// No description provided for @cityUmeda.
  ///
  /// In en, this message translates to:
  /// **'Umeda'**
  String get cityUmeda;

  /// No description provided for @cityUnnan.
  ///
  /// In en, this message translates to:
  /// **'Unnan'**
  String get cityUnnan;

  /// No description provided for @cityUnzen.
  ///
  /// In en, this message translates to:
  /// **'Unzen'**
  String get cityUnzen;

  /// No description provided for @cityUonuma.
  ///
  /// In en, this message translates to:
  /// **'Uonuma'**
  String get cityUonuma;

  /// No description provided for @cityUozu.
  ///
  /// In en, this message translates to:
  /// **'Uozu'**
  String get cityUozu;

  /// No description provided for @cityUrasoe.
  ///
  /// In en, this message translates to:
  /// **'Urasoe'**
  String get cityUrasoe;

  /// No description provided for @cityUrayasu.
  ///
  /// In en, this message translates to:
  /// **'Urayasu'**
  String get cityUrayasu;

  /// No description provided for @cityUreshino.
  ///
  /// In en, this message translates to:
  /// **'Ureshino'**
  String get cityUreshino;

  /// No description provided for @cityUsuki.
  ///
  /// In en, this message translates to:
  /// **'Usuki'**
  String get cityUsuki;

  /// No description provided for @cityUruma.
  ///
  /// In en, this message translates to:
  /// **'Uruma'**
  String get cityUruma;

  /// No description provided for @cityUrawa.
  ///
  /// In en, this message translates to:
  /// **'Urawa'**
  String get cityUrawa;

  /// No description provided for @cityUsa.
  ///
  /// In en, this message translates to:
  /// **'Usa'**
  String get cityUsa;

  /// No description provided for @cityUtashinai.
  ///
  /// In en, this message translates to:
  /// **'Utashinai'**
  String get cityUtashinai;

  /// No description provided for @cityUshiku.
  ///
  /// In en, this message translates to:
  /// **'Ushiku'**
  String get cityUshiku;

  /// No description provided for @cityUto.
  ///
  /// In en, this message translates to:
  /// **'Uto'**
  String get cityUto;

  /// No description provided for @cityUtsunomiya.
  ///
  /// In en, this message translates to:
  /// **'Utsunomiya'**
  String get cityUtsunomiya;

  /// No description provided for @cityUwajima.
  ///
  /// In en, this message translates to:
  /// **'Uwajima'**
  String get cityUwajima;

  /// No description provided for @cityWajima.
  ///
  /// In en, this message translates to:
  /// **'Wajima'**
  String get cityWajima;

  /// No description provided for @cityWakayama.
  ///
  /// In en, this message translates to:
  /// **'Wakayama'**
  String get cityWakayama;

  /// No description provided for @cityWakayamaCity.
  ///
  /// In en, this message translates to:
  /// **'Wakayama City'**
  String get cityWakayamaCity;

  /// No description provided for @cityWakkanai.
  ///
  /// In en, this message translates to:
  /// **'Wakkanai'**
  String get cityWakkanai;

  /// No description provided for @cityWako.
  ///
  /// In en, this message translates to:
  /// **'Wako'**
  String get cityWako;

  /// No description provided for @cityWarabi.
  ///
  /// In en, this message translates to:
  /// **'Warabi'**
  String get cityWarabi;

  /// No description provided for @cityYabu.
  ///
  /// In en, this message translates to:
  /// **'Yabu'**
  String get cityYabu;

  /// No description provided for @cityYachimat.
  ///
  /// In en, this message translates to:
  /// **'Yachimata'**
  String get cityYachimat;

  /// No description provided for @cityYachiyo.
  ///
  /// In en, this message translates to:
  /// **'Yachiyo'**
  String get cityYachiyo;

  /// No description provided for @cityYaita.
  ///
  /// In en, this message translates to:
  /// **'Yaita'**
  String get cityYaita;

  /// No description provided for @cityYaizu.
  ///
  /// In en, this message translates to:
  /// **'Yaizu'**
  String get cityYaizu;

  /// No description provided for @cityYakumo.
  ///
  /// In en, this message translates to:
  /// **'Yame'**
  String get cityYakumo;

  /// No description provided for @cityYamagata.
  ///
  /// In en, this message translates to:
  /// **'Yamagata'**
  String get cityYamagata;

  /// No description provided for @cityYamagataCity.
  ///
  /// In en, this message translates to:
  /// **'Yamagata City'**
  String get cityYamagataCity;

  /// No description provided for @cityYamaguchi.
  ///
  /// In en, this message translates to:
  /// **'Yamaguchi'**
  String get cityYamaguchi;

  /// No description provided for @cityYamaguchiCity.
  ///
  /// In en, this message translates to:
  /// **'Yamaguchi City'**
  String get cityYamaguchiCity;

  /// No description provided for @cityYamaga.
  ///
  /// In en, this message translates to:
  /// **'Yamaga'**
  String get cityYamaga;

  /// No description provided for @cityYamanashi.
  ///
  /// In en, this message translates to:
  /// **'Yamanashi'**
  String get cityYamanashi;

  /// No description provided for @cityYamashina.
  ///
  /// In en, this message translates to:
  /// **'Yamashina'**
  String get cityYamashina;

  /// No description provided for @cityYamato.
  ///
  /// In en, this message translates to:
  /// **'Yamato'**
  String get cityYamato;

  /// No description provided for @cityYamatokoriyama.
  ///
  /// In en, this message translates to:
  /// **'Yamatokoriyama'**
  String get cityYamatokoriyama;

  /// No description provided for @cityYamatoTakada.
  ///
  /// In en, this message translates to:
  /// **'Yamato-Takada'**
  String get cityYamatoTakada;

  /// No description provided for @cityYanagawa.
  ///
  /// In en, this message translates to:
  /// **'Yanagawa'**
  String get cityYanagawa;

  /// No description provided for @cityYanai.
  ///
  /// In en, this message translates to:
  /// **'Yanai'**
  String get cityYanai;

  /// No description provided for @cityYame.
  ///
  /// In en, this message translates to:
  /// **'Yame'**
  String get cityYame;

  /// No description provided for @cityYao.
  ///
  /// In en, this message translates to:
  /// **'Yao'**
  String get cityYao;

  /// No description provided for @cityYashio.
  ///
  /// In en, this message translates to:
  /// **'Yashio'**
  String get cityYashio;

  /// No description provided for @cityYasu.
  ///
  /// In en, this message translates to:
  /// **'Yasu'**
  String get cityYasu;

  /// No description provided for @cityYasugi.
  ///
  /// In en, this message translates to:
  /// **'Yasugi'**
  String get cityYasugi;

  /// No description provided for @cityYatomi.
  ///
  /// In en, this message translates to:
  /// **'Yatomi'**
  String get cityYatomi;

  /// No description provided for @cityYatsushiro.
  ///
  /// In en, this message translates to:
  /// **'Yatsushiro'**
  String get cityYatsushiro;

  /// No description provided for @cityYawata.
  ///
  /// In en, this message translates to:
  /// **'Yawata'**
  String get cityYawata;

  /// No description provided for @cityYawatahama.
  ///
  /// In en, this message translates to:
  /// **'Yawatahama'**
  String get cityYawatahama;

  /// No description provided for @cityYokkaichi.
  ///
  /// In en, this message translates to:
  /// **'Yokkaichi'**
  String get cityYokkaichi;

  /// No description provided for @cityYokohama.
  ///
  /// In en, this message translates to:
  /// **'Yokohama'**
  String get cityYokohama;

  /// No description provided for @cityYokosuka.
  ///
  /// In en, this message translates to:
  /// **'Yokosuka'**
  String get cityYokosuka;

  /// No description provided for @cityYodogawa.
  ///
  /// In en, this message translates to:
  /// **'Yodogawa'**
  String get cityYodogawa;

  /// No description provided for @cityYokote.
  ///
  /// In en, this message translates to:
  /// **'Yokote'**
  String get cityYokote;

  /// No description provided for @cityYonago.
  ///
  /// In en, this message translates to:
  /// **'Yonago'**
  String get cityYonago;

  /// No description provided for @cityYonezawa.
  ///
  /// In en, this message translates to:
  /// **'Yonezawa'**
  String get cityYonezawa;

  /// No description provided for @cityYoshikawa.
  ///
  /// In en, this message translates to:
  /// **'Yoshikawa'**
  String get cityYoshikawa;

  /// No description provided for @cityYoshinogawa.
  ///
  /// In en, this message translates to:
  /// **'Yoshinogawa'**
  String get cityYoshinogawa;

  /// No description provided for @cityYotsukaido.
  ///
  /// In en, this message translates to:
  /// **'Yotsukaido'**
  String get cityYotsukaido;

  /// No description provided for @cityYubari.
  ///
  /// In en, this message translates to:
  /// **'Yubari'**
  String get cityYubari;

  /// No description provided for @cityYotsuya.
  ///
  /// In en, this message translates to:
  /// **'Yotsuya'**
  String get cityYotsuya;

  /// No description provided for @cityYufu.
  ///
  /// In en, this message translates to:
  /// **'Yufu'**
  String get cityYufu;

  /// No description provided for @cityYuki.
  ///
  /// In en, this message translates to:
  /// **'Yuki'**
  String get cityYuki;

  /// No description provided for @cityYukuhashi.
  ///
  /// In en, this message translates to:
  /// **'Yukuhashi'**
  String get cityYukuhashi;

  /// No description provided for @cityYuzawa.
  ///
  /// In en, this message translates to:
  /// **'Yuzawa'**
  String get cityYuzawa;

  /// No description provided for @cityZama.
  ///
  /// In en, this message translates to:
  /// **'Zama'**
  String get cityZama;

  /// No description provided for @cityZentsuji.
  ///
  /// In en, this message translates to:
  /// **'Zentsuji'**
  String get cityZentsuji;

  /// No description provided for @cityZushi.
  ///
  /// In en, this message translates to:
  /// **'Zushi'**
  String get cityZushi;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

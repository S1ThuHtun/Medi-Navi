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

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

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
  /// **'✅ Chat history cleared'**
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

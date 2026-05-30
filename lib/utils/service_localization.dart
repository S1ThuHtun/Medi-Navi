import '../l10n/app_localizations.dart';

/// Maps service names to their localization key names
String getLocalizedServiceName(String serviceName, AppLocalizations localizations) {
  final localizationMap = {
    // Core 11 Medical Services
    'Internal Medicine': localizations.serviceInternalMedicine,
    'Surgery': localizations.serviceSurgery,
    'Orthopedics': localizations.serviceOrthopedics,
    'Dermatology': localizations.serviceDermatology,
    'Ophthalmology': localizations.serviceOphthalmology,
    'ENT': localizations.serviceENT,
    'Dentistry': localizations.serviceDentistry,
    'Pediatrics': localizations.servicePediatrics,
    'OG/GYN': localizations.serviceOBGYN,
    'Psychiatry': localizations.servicePsychiatry,
    'Psychosomatic Medicine': localizations.servicePsychosomaticMedicine,
  };
  
  return localizationMap[serviceName] ?? serviceName;
}

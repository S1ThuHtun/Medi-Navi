// IMPORTANT: Before using this file, you MUST run: flutter gen-l10n
// This will generate the AppLocalizations class from your ARB files

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

/// Helper class to get localized names for medical services and categories
class MedicalServicesLocalization {
  /// Get localized category name
  static String getCategoryName(
    BuildContext context,
    String category,
  ) {
    final l10n = AppLocalizations.of(
      context,
    )!;

    switch (category) {
      case 'General Services':
        return l10n
            .categoryGeneralServices;
      case 'Specialized Services':
        return l10n
            .categorySpecializedServices;
      case 'Surgical Services':
        return l10n
            .categorySurgicalServices;
      case 'Rehabilitation Services':
        return l10n
            .categoryRehabilitationServices;
      case 'Diagnostic Services':
        return l10n
            .categoryDiagnosticServices;
      case 'Emergency Services':
        return l10n
            .categoryEmergencyServices;
      case 'Maternity and Women\'s Health':
        return l10n
            .categoryMaternityWomensHealth;
      case 'Pharmacy Services':
        return l10n
            .categoryPharmacyServices;
      case 'Mental Health Services':
        return l10n
            .categoryMentalHealthServices;
      case 'Alternative Medicine':
        return l10n
            .categoryAlternativeMedicine;
      default:
        return category;
    }
  }

  /// Get localized service name
  static String getServiceName(
    BuildContext context,
    String service,
  ) {
    final l10n = AppLocalizations.of(
      context,
    )!;

    switch (service) {
      // General Services
      case 'General Medicine':
        return l10n
            .serviceGeneralMedicine;
      case 'Emergency Care':
        return l10n
            .serviceEmergencyCare;
      case 'Family Medicine':
        return l10n
            .serviceFamilyMedicine;
      case 'Preventative Medicine':
        return l10n
            .servicePreventativeMedicine;
      case 'Health Check-ups':
        return l10n
            .serviceHealthCheckups;
      case 'Urgent Care':
        return l10n.serviceUrgentCare;

      // Specialized Services
      case 'Cardiology':
        return l10n.serviceCardiology;
      case 'Dermatology':
        return l10n.serviceDermatology;
      case 'Endocrinology':
        return l10n
            .serviceEndocrinology;
      case 'Gastroenterology':
        return l10n
            .serviceGastroenterology;
      case 'Hematology':
        return l10n.serviceHematology;
      case 'Nephrology':
        return l10n.serviceNephrology;
      case 'Neurology':
        return l10n.serviceNeurology;
      case 'Obstetrics and Gynecology':
        return l10n
            .serviceObstetricsGynecology;
      case 'Ophthalmology':
        return l10n
            .serviceOphthalmology;
      case 'Orthopedics':
        return l10n.serviceOrthopedics;
      case 'Pediatrics':
        return l10n.servicePediatrics;
      case 'Psychiatry':
        return l10n.servicePsychiatry;
      case 'Rheumatology':
        return l10n.serviceRheumatology;
      case 'Pulmonology':
        return l10n.servicePulmonology;
      case 'Urology':
        return l10n.serviceUrology;

      // Surgical Services
      case 'General Surgery':
        return l10n
            .serviceGeneralSurgery;
      case 'Cardiac Surgery':
        return l10n
            .serviceCardiacSurgery;
      case 'Orthopedic Surgery':
        return l10n
            .serviceOrthopedicSurgery;
      case 'Neurosurgery':
        return l10n.serviceNeurosurgery;
      case 'Plastic Surgery':
        return l10n
            .servicePlasticSurgery;
      case 'Pediatric Surgery':
        return l10n
            .servicePediatricSurgery;
      case 'Obstetric Surgery':
        return l10n
            .serviceObstetricSurgery;
      case 'Trauma Surgery':
        return l10n
            .serviceTraumaSurgery;

      // Rehabilitation Services
      case 'Physical Therapy':
        return l10n
            .servicePhysicalTherapy;
      case 'Occupational Therapy':
        return l10n
            .serviceOccupationalTherapy;
      case 'Speech Therapy':
        return l10n
            .serviceSpeechTherapy;
      case 'Cardiac Rehabilitation':
        return l10n
            .serviceCardiacRehabilitation;
      case 'Neurological Rehabilitation':
        return l10n
            .serviceNeurologicalRehabilitation;

      // Diagnostic Services
      case 'Laboratory Tests':
        return l10n
            .serviceLaboratoryTests;
      case 'Radiology':
        return l10n.serviceRadiology;
      case 'Pathology':
        return l10n.servicePathology;
      case 'Endoscopy':
        return l10n.serviceEndoscopy;
      case 'ECG':
        return l10n.serviceECG;
      case 'EEG':
        return l10n.serviceEEG;

      // Emergency Services
      case 'Emergency Room (ER)':
        return l10n
            .serviceEmergencyRoom;
      case 'Trauma Care':
        return l10n.serviceTraumaCare;
      case 'Intensive Care Unit (ICU)':
        return l10n.serviceICU;
      case 'Burn Unit':
        return l10n.serviceBurnUnit;

      // Maternity and Women's Health
      case 'Obstetrics':
        return l10n.serviceObstetrics;
      case 'Gynecology':
        return l10n.serviceGynecology;
      case 'Family Planning':
        return l10n
            .serviceFamilyPlanning;
      case 'Breast Health':
        return l10n.serviceBreastHealth;

      // Pharmacy Services
      case 'Prescription Medications':
        return l10n
            .servicePrescriptionMedications;
      case 'Over-the-Counter Medications':
        return l10n
            .serviceOTCMedications;
      case 'Vaccinations':
        return l10n.serviceVaccinations;
      case 'Pharmaceutical Consultations':
        return l10n
            .servicePharmaceuticalConsultations;
      case 'Compounding Pharmacy':
        return l10n
            .serviceCompoundingPharmacy;
      case 'Herbal Medicine':
        return l10n
            .serviceHerbalMedicine;

      // Mental Health Services
      case 'Counseling':
        return l10n.serviceCounseling;
      case 'Psychotherapy':
        return l10n
            .servicePsychotherapy;
      case 'Addiction Treatment':
        return l10n
            .serviceAddictionTreatment;
      case 'Support Groups':
        return l10n
            .serviceSupportGroups;
      case 'Behavioral Therapy':
        return l10n
            .serviceBehavioralTherapy;

      // Alternative Medicine
      case 'Acupuncture':
        return l10n.serviceAcupuncture;
      case 'Chiropractic Care':
        return l10n
            .serviceChiropracticCare;
      case 'Massage Therapy':
        return l10n
            .serviceMassageTherapy;
      case 'Naturopathy':
        return l10n.serviceNaturopathy;
      case 'Homeopathy':
        return l10n.serviceHomeopathy;

      default:
        return service;
    }
  }
}

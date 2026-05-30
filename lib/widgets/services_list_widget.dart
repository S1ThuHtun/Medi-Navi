import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../data/prefecture_data.dart';
import '../l10n/app_localizations.dart';
import '../models/medical_service.dart';
import '../screens/map_screen.dart';
import 'service_card_widget.dart';

class ServicesListWidget extends StatelessWidget {
  final bool isLoading;
  final List<MedicalService> nearbyServices;
  final Position? currentPosition;
  final LocationData? selectedLocation;
  final VoidCallback onRetry;

  const ServicesListWidget({
    super.key,
    required this.isLoading,
    required this.nearbyServices,
    required this.currentPosition,
    required this.selectedLocation,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Color(0xFF2E7D32),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.gettingLocation,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    if (nearbyServices.isEmpty && currentPosition == null && selectedLocation == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.locationNotAvailable,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                AppLocalizations.of(context)!.pullDownToRefresh,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(AppLocalizations.of(context)!.retry),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
      );
    }

    if (nearbyServices.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: nearbyServices.length,
      itemBuilder: (context, index) {
        final service = nearbyServices[index];
        return ServiceCardWidget(
          service: service,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapScreen(
                  service: service,
                  currentPosition: currentPosition!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/medical_service.dart';
import '../services/favorites_service.dart';
import '../widgets/service_card_widget.dart';
import '../l10n/app_localizations.dart';
import 'map_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  List<MedicalService> _favorites = [];
  bool _isLoading = true;
  Position? _currentPosition;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadFavorites();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Reload favorites when app comes to foreground or tab is switched
      print('🔄 App resumed, reloading favorites...');
      _loadFavorites();
    }
  }

  @override
  void didUpdateWidget(FavoritesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reload when widget is updated
    print('🔄 Widget updated, reloading favorites...');
    _loadFavorites();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      if (mounted) {
        setState(() {
          _currentPosition = position;
        });
        // Reload favorites after getting location to recalculate distances
        _loadFavorites();
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _loadFavorites() async {
    print('🔄 FavoritesScreen: Loading favorites...');
    if (mounted) {
      setState(() => _isLoading = true);
    }
    final favorites = await FavoritesService.getFavorites();
    print('✅ FavoritesScreen: Loaded ${favorites.length} favorites');

    // Recalculate distances based on current position
    List<MedicalService> updatedFavorites = favorites;
    if (_currentPosition != null) {
      updatedFavorites = favorites.map((service) {
        final distance = _calculateDistance(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
          service.latitude,
          service.longitude,
        );
        return service.copyWith(distance: distance);
      }).toList();

      // Sort by distance
      updatedFavorites.sort((a, b) => a.distance.compareTo(b.distance));
    }

    if (mounted) {
      setState(() {
        _favorites = updatedFavorites;
        _isLoading = false;
      });
    }
  }

  // Calculate distance using Haversine formula
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Earth's radius in kilometers
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  // Public method to reload favorites from external calls
  void reloadFavorites() {
    print('🔄 External reload requested');
    _loadFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        surfaceTintColor: Colors.transparent,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.favorites,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          if (_favorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: _showClearAllDialog,
              tooltip: 'Clear all favorites',
            ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFF2E7D32)),
            )
          : _favorites.isEmpty
          ? _buildEmptyState()
          : RefreshIndicator(
              onRefresh: _loadFavorites,
              color: const Color(0xFF2E7D32),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  final service = _favorites[index];
                  return Dismissible(
                    key: Key(service.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    onDismissed: (direction) async {
                      await FavoritesService.removeFavorite(service.id);
                      setState(() {
                        _favorites.removeAt(index);
                      });
                      if (mounted) {
                        final l10n = AppLocalizations.of(context)!;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.removedFromFavorites(service.name),
                            ),
                            backgroundColor: const Color(0xFF2E7D32),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: ServiceCardWidget(
                      service: service,
                      onTap: () async {
                        if (_currentPosition != null) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapScreen(
                                service: service,
                                currentPosition: _currentPosition!,
                              ),
                            ),
                          );
                          // Refresh favorites after returning from map screen
                          _loadFavorites();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Getting your location...'),
                              backgroundColor: Colors.orange,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Colors.grey[500]),
            const SizedBox(height: 15),
            Text(
              AppLocalizations.of(context)!.noFavorites,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.tapHeartToSave,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showClearAllDialog() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.favoritesClearAllTitle),
        content: Text(l10n.favoritesClearAllMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.favoritesClearAll),
          ),
        ],
      ),
    );

    if (confirm == true) {
      for (var service in _favorites) {
        await FavoritesService.removeFavorite(service.id);
      }
      _loadFavorites();
    }
  }
}

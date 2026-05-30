import 'package:flutter/material.dart';
import '../data/prefecture_data.dart';
import '../l10n/app_localizations.dart';
import '../utils/prefecture_localization.dart';

class LocationSelectorScreen extends StatefulWidget {
  final LocationData? currentLocation;
  final Function(LocationData?, String?, String?, String?) onLocationSelected;

  const LocationSelectorScreen({
    super.key,
    required this.currentLocation,
    required this.onLocationSelected,
  });

  @override
  State<LocationSelectorScreen> createState() => _LocationSelectorScreenState();
}

class _LocationSelectorScreenState extends State<LocationSelectorScreen> {
  String? _selectedPrefecture;
  String? _selectedCity;
  // ignore: unused_field
  String? _selectedWard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          _selectedCity != null
              ? AppLocalizations.of(context)!.selectWard
              : _selectedPrefecture != null
                  ? AppLocalizations.of(context)!.selectCity
                  : AppLocalizations.of(context)!.selectPrefecture,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_selectedCity != null) {
              setState(() {
                _selectedCity = null;
                _selectedWard = null;
              });
            } else if (_selectedPrefecture != null) {
              setState(() {
                _selectedPrefecture = null;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: _selectedCity != null
          ? _buildWardList()
          : _selectedPrefecture != null
              ? _buildCityList()
              : _buildPrefectureList(),
    );
  }

  Widget _buildPrefectureList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildLocationTile(
          icon: Icons.my_location,
          title: AppLocalizations.of(context)!.useCurrentLocation,
          isSelected: widget.currentLocation == null,
          onTap: () {
            widget.onLocationSelected(null, null, null, null);
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            AppLocalizations.of(context)!.prefectures,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        ...japanesePrefectures.keys.map((prefecture) {
          final prefectureData = japanesePrefectures[prefecture]!;
          final hasChildren = prefectureData.children != null;

          return _buildLocationTile(
            icon: Icons.location_city,
            title: getLocalizedLocationName(prefecture, AppLocalizations.of(context)!),
            isSelected: false,
            trailing: hasChildren ? Icons.chevron_right : null,
            onTap: () {
              if (hasChildren) {
                setState(() {
                  _selectedPrefecture = prefecture;
                });
              } else {
                widget.onLocationSelected(prefectureData, prefecture, null, null);
                Navigator.pop(context);
              }
            },
          );
        }),
      ],
    );
  }

  Widget _buildCityList() {
    final prefectureData = japanesePrefectures[_selectedPrefecture]!;
    final cities = prefectureData.children!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildLocationTile(
          icon: Icons.location_city,
          title: AppLocalizations.of(context)!.allOf(getLocalizedLocationName(_selectedPrefecture!, AppLocalizations.of(context)!)),
          subtitle: AppLocalizations.of(context)!.searchEntirePrefecture,
          isSelected: false,
          onTap: () {
            widget.onLocationSelected(prefectureData, _selectedPrefecture, null, null);
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            AppLocalizations.of(context)!.citiesDistricts,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        ...cities.keys.map((city) {
          final cityData = cities[city]!;
          final hasChildren = cityData.children != null;

          return _buildLocationTile(
            icon: Icons.location_on,
            title: getLocalizedLocationName(city, AppLocalizations.of(context)!),
            isSelected: false,
            trailing: hasChildren ? Icons.chevron_right : null,
            onTap: () {
              if (hasChildren) {
                setState(() {
                  _selectedCity = city;
                });
              } else {
                widget.onLocationSelected(cityData, _selectedPrefecture, city, null);
                Navigator.pop(context);
              }
            },
          );
        }),
      ],
    );
  }

  Widget _buildWardList() {
    final prefectureData = japanesePrefectures[_selectedPrefecture]!;
    final cityData = prefectureData.children![_selectedCity]!;
    final wards = cityData.children!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildLocationTile(
          icon: Icons.location_on,
          title: AppLocalizations.of(context)!.allOf(getLocalizedLocationName(_selectedCity!, AppLocalizations.of(context)!)),
          subtitle: AppLocalizations.of(context)!.searchEntireCity,
          isSelected: false,
          onTap: () {
            widget.onLocationSelected(cityData, _selectedPrefecture, _selectedCity, null);
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            AppLocalizations.of(context)!.wardsAreas,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        ...wards.keys.map((ward) {
          final wardData = wards[ward]!;

          return _buildLocationTile(
            icon: Icons.place,
            title: getLocalizedLocationName(ward, AppLocalizations.of(context)!),
            isSelected: false,
            onTap: () {
              widget.onLocationSelected(wardData, _selectedPrefecture, _selectedCity, ward);
              Navigator.pop(context);
            },
          );
        }),
      ],
    );
  }

  Widget _buildLocationTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool isSelected,
    IconData? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[200]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF2E7D32).withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[700],
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? const Color(0xFF2E7D32) : Colors.black87,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              )
            : null,
        trailing: trailing != null
            ? Icon(trailing, color: Colors.grey[400])
            : (isSelected
                ? const Icon(Icons.check, color: Color(0xFF2E7D32))
                : null),
        onTap: onTap,
      ),
    );
  }
}

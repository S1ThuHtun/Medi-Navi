import 'package:flutter/material.dart';

class ServiceGridWidget extends StatelessWidget {
  final String selectedCategory;
  final String? selectedService;
  final Function(String) onServiceSelected;

  const ServiceGridWidget({
    super.key,
    required this.selectedCategory,
    required this.selectedService,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

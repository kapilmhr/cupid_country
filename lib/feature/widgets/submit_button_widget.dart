import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants.dart';
import '../../routes/routes.dart';
import '../model/country.dart';
import '../providers/country_providers.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectedCountryProvider);
    final selectedState = ref.watch(selectedCountryStateProvider);
    return ElevatedButton(
      onPressed: () =>
          _handleSubmitButton(context, selectedCountry, selectedState),
      child: const Text('Submit'),
    );
  }

  void _handleSubmitButton(BuildContext context, Country? selectedCountry,
      CountryState? selectedState) {
    if (selectedCountry != null && selectedState != null) {
      Map<String, dynamic> args = {
        Constants.country: selectedCountry,
        Constants.state: selectedState,
      };
      Navigator.pushNamed(context, Routes.detail, arguments: args);
    }
  }
}

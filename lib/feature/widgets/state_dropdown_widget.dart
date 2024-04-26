import 'package:cupid_country/core/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/country.dart';
import '../providers/country_providers.dart';

class StateDropdown extends ConsumerWidget {
  const StateDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectedCountryProvider);
    if (selectedCountry == null) {
      return const SizedBox.shrink();
    }

    final stateAsyncValue =
        ref.watch(countryStateProvider(selectedCountry.id!));

    return stateAsyncValue.when(
        data: (countryStates) => DropdownButtonFormField<CountryState>(
              items: countryStates.map((CountryState value) {
                return DropdownMenuItem<CountryState>(
                  value: value,
                  child: Text(value.value.toString()),
                );
              }).toList(),
              value: ref.watch(selectedCountryStateProvider),
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text('Select State'),
              onChanged: (stateSelected) => ref
                  .read(selectedCountryStateProvider.notifier)
                  .state = stateSelected!,
            ),
        error: (error, stack) => Text('Error: $error'),
        loading: () => const Loading());
  }
}

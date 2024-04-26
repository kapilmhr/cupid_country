import 'package:cupid_country/feature/model/country.dart';
import 'package:cupid_country/feature/providers/country_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/loading.dart';
import '../widgets/state_dropdown_widget.dart';
import '../widgets/submit_button_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryAsyncValue = ref.watch(countryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            countryAsyncValue.when(
                data: (countries) => DropdownButtonFormField<Country>(
                      items: countries.map((Country value) {
                        return DropdownMenuItem<Country>(
                          value: value,
                          child: Text(value.value.toString()),
                        );
                      }).toList(),
                      // value: state.selectedCountry,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Select Country'),
                      onChanged: (value) {
                        ref.read(selectedCountryProvider.notifier).state =
                            value;
                        ref.read(selectedCountryStateProvider.notifier).state =
                            null;
                      },
                    ),
                error: (error, stack) => Text('Error: $error'),
                loading: () => const Loading()),
            const SizedBox(height: 20),
            const StateDropdown(),
            const SizedBox(height: 20),
            const SubmitButton()
          ],
        ),
      ),
    );
  }
}

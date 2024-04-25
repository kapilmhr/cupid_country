import 'package:cupid_country/feature/model/country.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Country country;
  final CountryState countryState;

  const DetailScreen(
      {required this.country, required this.countryState, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Scaffold(
          body: Center(
        child: Column(
          children: [
            Text(
              'Country Name: ${country.value}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'State Name: ${countryState.value}',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      )),
    );
  }
}

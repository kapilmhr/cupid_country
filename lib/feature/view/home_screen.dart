import 'package:cupid_country/core/constants.dart';
import 'package:cupid_country/feature/bloc/country/get_country_bloc.dart';
import 'package:cupid_country/feature/bloc/states/get_states_bloc.dart';
import 'package:cupid_country/feature/model/country.dart';
import 'package:cupid_country/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            _buildCountryDropdown(context),
            const SizedBox(height: 20),
            _buildStateDropdown(context),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _handleSubmitButton(context),
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  Widget _buildCountryDropdown(context) {
    return BlocBuilder<GetCountryBloc, GetCountryState>(
        builder: (context, state) {
      switch (state) {
        case GetCountryInitialState():
          return const SizedBox(child: CircularProgressIndicator());
        case GetCountryLoadingState():
          return const SizedBox(child: CircularProgressIndicator());
        case GetCountryLoadedState():
          return DropdownButtonFormField<Country>(
            items: state.countries.map((Country value) {
              return DropdownMenuItem<Country>(
                value: value,
                child: Text(value.value.toString()),
              );
            }).toList(),
            value: state.selectedCountry,
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: const Text('Select Country'),
            onChanged: (value) {
              context
                  .read<GetCountryBloc>()
                  .add(UpdateSelectedCountryEvent(value));

              context.read<GetStatesBloc>().add(GetStates(value!));
            },
          );
        case GetCountryErrorState():
          return const Text('Error');

        default:
          return const SizedBox(child: CircularProgressIndicator());
      }
    });
  }

  Widget _buildStateDropdown(context) {
    return BlocBuilder<GetStatesBloc, GetStatesState>(
        builder: (context, state) {
      switch (state) {
        case GetCountryStatesLoadedState():
          return DropdownButtonFormField<CountryState>(
            items: state.countryStates.map((CountryState value) {
              return DropdownMenuItem<CountryState>(
                value: value,
                child: Text(value.value.toString()),
              );
            }).toList(),
            value: state.selectedCountryState,
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            hint: const Text('Select State'),
            onChanged: (value) {
              context.read<GetStatesBloc>().add(UpdateSelectedCState(value));
            },
          );
        case GetErrorState():
          return const Text('Error');
        case GetStatesInitialState():
          return const SizedBox.shrink();
        default:
          return const SizedBox(child: CircularProgressIndicator());
      }
    });
  }

  void _handleSubmitButton(BuildContext context) {
    final countryState = context.read<GetStatesBloc>().state;
    if (countryState is GetCountryStatesLoadedState &&
        countryState.selectedCountryState != null) {
      Map<String, dynamic> args = {
        Constants.country: countryState.selectedCountry,
        Constants.state: countryState.selectedCountryState,
      };
      Navigator.pushNamed(context, Routes.detail, arguments: args);
    }
  }
}

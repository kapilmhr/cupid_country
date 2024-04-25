part of 'get_country_bloc.dart';

abstract class GetCountryState extends Equatable {
  const GetCountryState();
}

class GetCountryInitialState extends GetCountryState {
  @override
  List<Object> get props => [];
}

class GetCountryLoadingState extends GetCountryState {
  @override
  List<Object> get props => [];
}

class GetCountryLoadedState extends GetCountryState {
  final List<Country> countries;
  final Country? selectedCountry; // Add selectedCountry property

  const GetCountryLoadedState(this.countries, {this.selectedCountry});

  @override
  List<Object?> get props => [countries, selectedCountry];
}

class GetCountryErrorState extends GetCountryState {
  @override
  List<Object> get props => [];
}

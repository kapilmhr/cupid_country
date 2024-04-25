part of 'get_states_bloc.dart';

sealed class GetStatesState extends Equatable {
  const GetStatesState();
}

final class GetStatesInitialState extends GetStatesState {
  @override
  List<Object> get props => [];
}

final class GetStatesLoadingState extends GetStatesState {
  @override
  List<Object> get props => [];
}

class GetCountryStatesLoadedState extends GetStatesState {
  final List<CountryState> countryStates;
  final Country selectedCountry;
  final CountryState? selectedCountryState;

  const GetCountryStatesLoadedState(this.countryStates, this.selectedCountry,
      {this.selectedCountryState});

  @override
  List<Object?> get props =>
      [countryStates, selectedCountry, selectedCountryState];
}

class GetErrorState extends GetStatesState {
  @override
  List<Object> get props => [];
}

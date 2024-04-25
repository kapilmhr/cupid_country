part of 'get_states_bloc.dart';

sealed class GetStatesEvent extends Equatable {
  const GetStatesEvent();
}

class GetStates extends GetStatesEvent {
  final Country country;

  const GetStates(this.country);

  @override
  List<Object?> get props => [country];
}

class UpdateSelectedCState extends GetStatesEvent {
  final CountryState? selectedCountryState;

  const UpdateSelectedCState(this.selectedCountryState);

  @override
  List<Object?> get props => [selectedCountryState];
}

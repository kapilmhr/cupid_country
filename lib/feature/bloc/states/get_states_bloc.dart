import 'dart:async';

import 'package:cupid_country/feature/model/country.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/country_repository.dart';

part 'get_states_event.dart';

part 'get_states_state.dart';

class GetStatesBloc extends Bloc<GetStatesEvent, GetStatesState> {
  final CountryRepository repository;

  GetStatesBloc({required this.repository}) : super(GetStatesInitialState()) {
    on<GetStatesEvent>(_onGetStates);
  }

  FutureOr<void> _onGetStates(
      GetStatesEvent event, Emitter<GetStatesState> emit) async {
    if (event is UpdateSelectedCState) {
      emit(GetCountryStatesLoadedState(
          (state as GetCountryStatesLoadedState).countryStates,
          (state as GetCountryStatesLoadedState).selectedCountry,
          selectedCountryState: event.selectedCountryState));
    } else {
      emit(GetStatesLoadingState());
      try {
        var e = event as GetStates;
        var countryStates = await repository.getStates(e.country.id!);

        emit(GetCountryStatesLoadedState(countryStates, e.country));
      } catch (e) {
        emit(GetErrorState());
      }
    }
  }
}

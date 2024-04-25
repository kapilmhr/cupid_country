import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/country.dart';
import '../../repository/country_repository.dart';

part 'get_country_event.dart';

part 'get_country_state.dart';

class GetCountryBloc extends Bloc<GetCountryEvent, GetCountryState> {
  final CountryRepository repository;

  GetCountryBloc({required this.repository}) : super(GetCountryInitialState()) {
    on<GetCountryEvent>(_onGetCountry);
  }

  FutureOr<void> _onGetCountry(
      GetCountryEvent event, Emitter<GetCountryState> emit) async {
    if (event is UpdateSelectedCountryEvent) {
      emit(GetCountryLoadedState((state as GetCountryLoadedState).countries,
          selectedCountry: event.selectedCountry));
    } else {
      emit(GetCountryLoadingState());
      try {
        var countries = await repository.getCountry();

        emit(GetCountryLoadedState(countries));
      } catch (e) {
        emit(GetCountryErrorState());
      }
    }
  }
}

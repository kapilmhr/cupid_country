import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/bloc/country/get_country_bloc.dart';
import '../feature/bloc/states/get_states_bloc.dart';
import '../feature/repository/country_repository_impl.dart';

BlocProvider<GetCountryBloc> provideGetCountryBloc() {
  return BlocProvider<GetCountryBloc>(
    create: (context) =>
    GetCountryBloc(repository: CountryRepositoryImpl())..add(GetCountry()),
  );
}

BlocProvider<GetStatesBloc> provideGetStatesBloc() {
  return BlocProvider<GetStatesBloc>(
    create: (context) => GetStatesBloc(repository: CountryRepositoryImpl()),
  );
}
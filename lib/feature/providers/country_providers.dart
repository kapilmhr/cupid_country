import 'package:cupid_country/feature/repository/country_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/country.dart';
import '../repository/country_repository.dart';

final countryProvider = FutureProvider.autoDispose<List<Country>>((ref) async {
  final countryRepository = ref.watch(countryRepositoryProvider);

  return countryRepository.getCountry();
});

final countryRepositoryProvider = Provider<CountryRepository>((ref) {
  return CountryRepositoryImpl(); // declared elsewhere
});

final countryStateProvider = FutureProvider.autoDispose
    .family<List<CountryState>, int>((ref, countryId) async {
  if (countryId > 0) {
    final countryrRepository = ref.watch(countryRepositoryProvider);

    return countryrRepository.getStates(countryId);
  } else {
    return [];
  }
});

final selectedCountryProvider = StateProvider<Country?>((ref) => null);
final selectedCountryStateProvider =
    StateProvider<CountryState?>((ref) => null);

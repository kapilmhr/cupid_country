import 'package:cupid_country/feature/bloc/country/get_country_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_service.dart';

void main() {
  group('get Country bloc', () {
    late MockService mockService;

    setUp(() {
      mockService = MockService();
    });

    test('initial state is get country loading', () {
      expect(GetCountryBloc(repository: mockService).state,
          GetCountryInitialState());
    });

    blocTest<GetCountryBloc, GetCountryState>(
      'emits [ GetCountryLoading,GetCountryError ] when loading fails',
      setUp: () => when(mockService.getCountry).thenThrow(Exception()),
      build: () => GetCountryBloc(repository: mockService),
      act: (bloc) => bloc.add(GetCountry()),
      expect: () =>
          <GetCountryState>[GetCountryLoadingState(), GetCountryErrorState()],
      verify: (_) => verify(mockService.getCountry).called(1),
    );

    blocTest<GetCountryBloc, GetCountryState>(
      'emits [ GetCountryLoading,GetCountryLoaded ] when loaded successfully',
      setUp: () => when(mockService.getCountry).thenAnswer((_) async => []),
      build: () => GetCountryBloc(repository: mockService),
      act: (bloc) => bloc.add(GetCountry()),
      expect: () => <GetCountryState>[
        GetCountryLoadingState(),
        const GetCountryLoadedState([])
      ],
      verify: (_) => verify(mockService.getCountry).called(1),
    );
  });
}

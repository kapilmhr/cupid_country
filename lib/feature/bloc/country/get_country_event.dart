part of 'get_country_bloc.dart';

sealed class GetCountryEvent extends Equatable {
  const GetCountryEvent();
}

class GetCountry extends GetCountryEvent {
  @override
  List<Object?> get props => [];
}

class UpdateSelectedCountryEvent extends GetCountryEvent {
  final Country? selectedCountry;

  const UpdateSelectedCountryEvent(this.selectedCountry);

  @override
  List<Object?> get props => [selectedCountry];
}

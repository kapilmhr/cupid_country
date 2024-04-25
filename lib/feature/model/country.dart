import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  final int? id;
  final String? value;

  const BaseModel({this.id, this.value});

  @override
  List<Object?> get props => [id, value];

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(id: json['id'], value: json['value']);
  }
}

class Country extends BaseModel {
  const Country({super.id, super.value});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(id: json['id'], value: json['value']);
  }
}

class CountryState extends BaseModel {
  const CountryState({super.id, super.value});

  factory CountryState.fromJson(Map<String, dynamic> json) {
    return CountryState(id: json['id'], value: json['value']);
  }
}

class CountryList extends Equatable {
  final List<Country> countries;

  const CountryList(this.countries);

  @override
  List<Object?> get props => [countries];

  factory CountryList.fromJson(List<dynamic> json) {
    return CountryList(json.map((e) => Country.fromJson(e)).toList());
  }
}

class CountryStateList extends Equatable {
  final List<CountryState> states;

  const CountryStateList(this.states);

  @override
  List<Object?> get props => [states];

  factory CountryStateList.fromJson(List<dynamic> json) {
    return CountryStateList(json.map((e) => CountryState.fromJson(e)).toList());
  }
}

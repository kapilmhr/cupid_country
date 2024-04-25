import 'package:cupid_country/feature/model/country.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CountryRepository {
  Future<List<Country>> getCountry();

  Future<List<CountryState>> getStates(int id);
}

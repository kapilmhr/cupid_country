import 'package:cupid_country/feature/model/country.dart';
import 'package:cupid_country/feature/repository/country_repository.dart';
import 'package:cupid_country/network/dio_client.dart';
import 'package:cupid_country/network/paths.dart';

class CountryRepositoryImpl implements CountryRepository {
  @override
  Future<List<Country>> getCountry() async {
    final response = await DioClient.instance.get(Paths.countries);
    final countryList = CountryList.fromJson(response);
    return countryList.countries;
  }

  @override
  Future<List<CountryState>> getStates(int id) async {
    final response = await DioClient.instance.get(Paths.getStates(id));
    final stateList = CountryStateList.fromJson(response);
    return stateList.states;
  }
}

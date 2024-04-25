class Paths {
  static String baseUrl = '';
  static String countries = '/countries';

  static String getStates(countryId) => '/countries/$countryId/states';
}

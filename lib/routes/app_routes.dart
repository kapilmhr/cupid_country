import 'package:cupid_country/core/constants.dart';
import 'package:cupid_country/feature/model/country.dart';
import 'package:cupid_country/feature/view/detail_screen.dart';
import 'package:cupid_country/feature/view/home_screen.dart';
import 'package:cupid_country/routes/routes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, RouteType> _resolveRoutes() {
    return {
      ...mainRoutes,
    };
  }

  static Route onGeneratedRoutes(RouteSettings settings) {
    var routes = _resolveRoutes();
    try {
      final child = routes[settings.name];
      Widget builder(BuildContext context) => child!(context, settings);

      return MaterialPageRoute(builder: builder);
    } catch (e) {
      throw const FormatException('Routes doesnot exist');
    }
  }
}

typedef RouteType = Widget Function(BuildContext, RouteSettings);

Map<String, RouteType> mainRoutes = {
  Routes.home: (context, settings) => const HomeScreen(),
  Routes.detail: (context, settings) {
    final args = settings.arguments as Map<String, dynamic>;
    return DetailScreen(
        country: args[Constants.country] as Country,
        countryState: args[Constants.state] as CountryState);
  }
};

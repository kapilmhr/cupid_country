import 'package:cupid_country/core/app_theme.dart';
import 'package:cupid_country/routes/app_routes.dart';
import 'package:cupid_country/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_providers.dart';
import 'core/constants.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    provideGetCountryBloc(),
    provideGetStatesBloc(),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: AppRoutes.onGeneratedRoutes,
      initialRoute: Routes.home,
    );
  }
}

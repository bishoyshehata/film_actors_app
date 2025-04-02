import 'package:film_actors_app/presentation/screens/character_details_screen.dart';

import 'presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homeRoute = "/";
  static const String characterDetailsRoute = "/characterDetailsRoute";
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case characterDetailsRoute:
        return MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Un Defined Route'),
        ),
        body: const Center(child: Text('Un Defined Route')),
      );
    });
  }
}

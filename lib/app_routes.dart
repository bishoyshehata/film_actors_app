import 'package:film_actors_app/business_logic/cubit/characters_cubit.dart';
import 'package:film_actors_app/data/repository/characters_repository.dart';
import 'package:film_actors_app/data/services/get_characters.dart';
import 'package:film_actors_app/presentation/screens/character_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homeRoute = "/";
  static const String characterDetailsRoute = "/characterDetailsRoute";
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRoutes() {
    charactersRepository = CharactersRepository(GetCharactersService());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: HomeScreen(),
                ));
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

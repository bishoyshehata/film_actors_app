import 'package:film_actors_app/business_logic/cubit/characters_cubit.dart';
import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/presentation/resources/colors_manager.dart';
import 'package:film_actors_app/presentation/widgets/character_gridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.darkGrey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorManager.lightPrimary,
          title: const Text(
            'Characters',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.home_filled, color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
          switch (state) {
            case CharactersInitial():
              return Center(
                  child: CircularProgressIndicator(
                color: ColorManager.lightPrimary,
              ));
            case CharactersLoaded():
              return CharacterGridview(characters: (state).charactersList);
            case CharactersErrormessage():
              return Center(child: Text(state.errorMessage));
          }

          // if (state is CharactersLoaded) {
          //   return CharacterGridview(characters: state.charactersList);
          // } else if (state is CharactersErrormessage) {
          //   return Center(child: Text(state.errorMessage));
          // } else {
          //   return Center(
          //       child: CircularProgressIndicator(
          //     color: ColorManager.white,
          //   ));
          // }
        }));
  }
}

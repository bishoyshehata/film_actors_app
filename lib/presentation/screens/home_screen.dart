import 'package:film_actors_app/business_logic/cubit/characters_cubit.dart';
import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/presentation/resources/colors_manager.dart';
import 'package:film_actors_app/presentation/resources/constants_manager.dart';
import 'package:film_actors_app/presentation/resources/values_manager.dart';
import 'package:film_actors_app/presentation/widgets/character_gridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<CharacterModel> characters = [];
  List<CharacterModel> searchedcharacters = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getCharacters();
  }

  void addSearchedCharactersToList(String characterName) {
    searchedcharacters = characters
        .where((character) => character.name!
            .toLowerCase()
            .startsWith(characterName.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.lightPrimary,
        leading: Icon(Icons.home_filled, color: Colors.white),
        title: _isSearching
            ? TextField(
                cursorColor: ColorManager.white,
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Fintd a character...",
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  addSearchedCharactersToList(value);
                },
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            : const Text(
                'Characters',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  // Navigator.pop(context); // Clear search when closed
                }
              });
            },
          ),
        ],
      ),
      body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            List<ConnectivityResult> connectivity,
            Widget child,
          ) {
            final bool connected =
                !connectivity.contains(ConnectivityResult.none);
            return connected
                ? BlocBuilder<CharactersCubit, CharactersState>(
                    builder: (context, state) {
                      switch (state) {
                        case CharactersInitial():
                          return Center(
                              child: CircularProgressIndicator(
                            color: ColorManager.lightPrimary,
                          ));
                        case CharactersLoaded():
                          characters = (state).charactersList;
                          return CharacterGridview(
                            characters: (state).charactersList,
                            searchController: _searchController,
                            searchedcharacters: searchedcharacters,
                          );
                        case CharactersErrormessage():
                          return Center(child: Text(state.errorMessage));
                      }
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      spacing: AppSizeHeight.s20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(AppConstants.noInternet),
                        Text(
                          'Just turn on your internet.',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
          },
          child: Center(
            child: CircularProgressIndicator(
              color: ColorManager.lightPrimary,
            ),
          )),
    );
  }
}

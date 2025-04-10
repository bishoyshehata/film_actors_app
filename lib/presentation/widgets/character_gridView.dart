import 'package:film_actors_app/app_routes.dart';
import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/presentation/resources/colors_manager.dart';
import 'package:film_actors_app/presentation/resources/constants_manager.dart';
import 'package:film_actors_app/presentation/resources/font_manager.dart';
import 'package:film_actors_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterGridview extends StatelessWidget {
  CharacterGridview(
      {super.key,
      required this.characters,
      required this.searchedcharacters,
      required this.searchController});
  List<CharacterModel> characters;
  List<CharacterModel> searchedcharacters;
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppPadding.p5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.3),
          itemCount: searchController.text.isNotEmpty
              ? searchedcharacters.length
              : characters.length,
          itemBuilder: (BuildContext context, int index) {
            CharacterModel character = characters[index];
            CharacterModel searchedCharacter;

            if (searchController.text.isNotEmpty) {
              searchedCharacter = searchedcharacters[index];
            } else {
              searchedCharacter = characters[index];
            }

            return InkWell(
              splashColor: ColorManager.lightGrey,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.characterDetailsRoute,
                    arguments: character);
              },
              child: Card(
                  child: Hero(
                tag: character.id!,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.lightTextForm, // Border color
                          width: 5, // Border thickness
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: character.image!.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loader.gif',
                              image: searchController.text.isNotEmpty
                                  ? searchedCharacter.image!
                                  : character.image!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(AppConstants.testimage,
                              fit: BoxFit.cover),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: double.infinity,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.lightTextForm, // Border color
                          width: 5, // Border thickness
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: AppSizeHeight.s30,
                          decoration: BoxDecoration(
                            color: ColorManager.black.withOpacity(0.3),
                          ),
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            searchController.text.isNotEmpty
                                ? searchedCharacter.name!
                                : character.name!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.s17,
                            ),
                          )),
                    ),
                  ],
                ),
              )),
            );
          },
        ));
  }
}

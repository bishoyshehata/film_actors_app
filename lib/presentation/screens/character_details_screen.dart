import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/presentation/resources/colors_manager.dart';
import 'package:film_actors_app/presentation/resources/font_manager.dart';
import 'package:film_actors_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterDetailsScreen extends StatelessWidget {
  CharacterModel character;
  CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: CustomScrollView(
        slivers: [
          buildSiliverAppBar(character, context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: AppSizeHeight.s40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      AppSizeHeight.s10, 0, AppSizeHeight.s10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.yellow, // Color of the border
                              width: 2.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'species : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s17),
                        ),
                      ),
                      Container(
                        child: Text(
                          character.species!,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s15),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSizeHeight.s40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      AppSizeHeight.s10, 0, AppSizeHeight.s10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.yellow, // Color of the border
                              width: 2.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'status : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s17),
                        ),
                      ),
                      Container(
                        child: Text(
                          character.status!,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s15),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSizeHeight.s40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      AppSizeHeight.s10, 0, AppSizeHeight.s10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.yellow, // Color of the border
                              width: 2.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'gender : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s17),
                        ),
                      ),
                      Container(
                        child: Text(
                          character.gender!,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s15),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSizeHeight.s40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      AppSizeHeight.s10, 0, AppSizeHeight.s10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.yellow, // Color of the border
                              width: 2.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'location : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s17),
                        ),
                      ),
                      Container(
                        child: Text(
                          character.location!.name!,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s15),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSizeHeight.s40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      AppSizeHeight.s10, 0, AppSizeHeight.s10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorManager.yellow, // Color of the border
                              width: 2.0, // Width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'type : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.s17),
                        ),
                      ),
                      Container(
                        child: Text(
                          character.type! == '' ? 'unknown' : character.type!,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizeHeight.s450,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSiliverAppBar(character, context) {
    return SliverAppBar(
      elevation: 5,
      shadowColor: ColorManager.black,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
      expandedHeight: AppSizeHeight.s500, // Height when expanded
      stretch: true,
      backgroundColor:
          ColorManager.darkGrey, // Whether the app bar should float
      pinned: true,
      // Whether the app bar should be pinned when collapsed
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          background: Hero(
            tag: character.id,
            child: Image.network(
              character.image, // Background image
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}

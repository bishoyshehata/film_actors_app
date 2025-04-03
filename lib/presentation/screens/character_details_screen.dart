import 'package:film_actors_app/data/models/character_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Character Details'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const Text('Character Details'),
                ]))));
  }
}

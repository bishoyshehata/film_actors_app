import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key});

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

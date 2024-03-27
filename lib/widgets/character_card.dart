import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/character_model.dart';
import 'package:rick_and_morty_app/utils/utils.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final List<String> captures;

  const CharacterCard({super.key, required this.character, required this.captures});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: Image.network(
            character.image,
            scale: 1.5,
          ),
          title: Text(
            capitalize(character.name),
            style: const TextStyle(fontSize: 40),
          ),
          subtitle: Text(
            capitalize(character.status),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      onTap: () {
       Map<String, dynamic> arguments = {
          'character': character,
          'captures': captures,
        };
        Navigator.pushNamed(context, "/details", arguments: arguments);
      },
    );
  }
}

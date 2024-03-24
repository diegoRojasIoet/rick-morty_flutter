import 'package:flutter/material.dart';
import 'package:pokemon_app/model/character_model.dart';
import 'package:pokemon_app/services/character_services.dart';

class CharacterProvider extends ChangeNotifier {
  CharacterProvider() {
    getInitialCharacters();
  }

  int characterId = 1;
  final List<Character> _characters = [];

  void getInitialCharacters() async {
    for (int i = 1; i <= 10; i++) {
      final character = await CharacterServices.getCharacter(i);

      _characters.add(character);
      characterId++;
    }

    notifyListeners();
  }

  set characterIdCounter(int value) {
    characterId = value;
  }


  void addCharacter(id) async {
    final character = await CharacterServices.getCharacter(id);

    _characters.add(character);

    notifyListeners();
  }

  List<Character> get characters => _characters;
}

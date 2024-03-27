import 'package:rick_and_morty_app/model/character_model.dart';

class CharacterCapturesModel {
  Character _character;
  List<String> _captures;

  CharacterCapturesModel({
    required Character character,
    List<String> captures = const [],
  }) :
    _captures = captures,
    _character = character;

  // ignore: unnecessary_getters_setters
  Character get character => _character;

  set character(Character newCharacter){
    _character = newCharacter;
  }


  // ignore: unnecessary_getters_setters
  List<String> get captures => _captures;

  set captures(List<String> newCaptures){
    _captures = newCaptures;
  }


  void addCapture(String pathCapture) => _captures.add(pathCapture);

}

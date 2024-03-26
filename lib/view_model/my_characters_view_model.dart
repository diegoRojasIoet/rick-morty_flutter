import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rick_and_morty_app/model/character_captures_model.dart';
import 'package:rick_and_morty_app/model/character_model.dart';
import 'package:rick_and_morty_app/services/character_services.dart';
import 'package:rick_and_morty_app/utils/file_system_utils.dart';

class MyCharactersViewModel extends ChangeNotifier {
  List<CharacterCapturesModel> _charactersCaptures = [];
  bool _loadingCharactersCaptures = false;

  MyCharactersViewModel(){
    _loadingCharactersCaptures = true;
    notifyListeners();
    loadCharactersCaptures();
  }

  void loadCharactersCaptures() async {
    try {
      List<String> charactersDirs = await FileSystemUtils.listExternalDirectory();
      print("CHARACTERS DIR");
      print(charactersDirs);
      for (var i = 0; i < charactersDirs.length; i++) {
        String characterFolderName = basename(charactersDirs[i]);
        print("characterFolderName");
        print(characterFolderName);
        if (characterFolderName is String) {
          print('characterFolderName is a string.');
          print("The condition");
          print(characterFolderName.contains('character_'));
        } else {
          print('characterFolderName is not a string.');
          print(characterFolderName.runtimeType);
        }
        
        if (!characterFolderName.contains('character_')) continue;
        print("ENCUENTRA IMAGENES");
        String characterId = characterFolderName.split('_')[1];
        Character character = await CharacterServices.getCharacter(characterId);
        List<String> charactersCapturePaths = await FileSystemUtils.listExternalFolder(characterFolderName);
        _charactersCaptures.add(
          CharacterCapturesModel(
            character: character,
            captures: charactersCapturePaths
          )
        );
      }
    // ignore: empty_catches
    } catch (e) {}
    loadingCharactersCaptures = false;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  List<CharacterCapturesModel> get charactersCaptures => _charactersCaptures;

  set charactersCaptures(List<CharacterCapturesModel> newCharactersCaptures) {
    _charactersCaptures = newCharactersCaptures;
  }


  // ignore: unnecessary_getters_setters
  bool get loadingCharactersCaptures => _loadingCharactersCaptures;

  set loadingCharactersCaptures(bool newLoadingCharactersCaptures) {
    _loadingCharactersCaptures = newLoadingCharactersCaptures;
  }

}

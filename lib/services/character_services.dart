import 'package:http/http.dart' as http;
import 'package:pokemon_app/model/character_model.dart';


class CharacterServices {
  static Future<Character> getCharacter(id) async {
    final urlUri = Uri.parse('https://rickandmortyapi.com/api/character/$id');
    final response = await http.get(urlUri);
    final pokemon = Character.fromJson(response.body);
    return pokemon;
  }
}

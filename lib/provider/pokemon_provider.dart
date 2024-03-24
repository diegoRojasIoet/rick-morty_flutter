import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/pokemon_model.dart';
import 'package:rick_and_morty_app/services/pokemon_services.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonProvider() {
    print('PokemonProvider initialized');
    getInitialPokemons();
  }

  int pokemonId = 1;
  final List<Pokemon> _pokemons = [];

  void getInitialPokemons() async {
    for (int i = 1; i <= 10; i++) {
      final pokemon = await PokemonServices.getPokemon(i);

      _pokemons.add(pokemon);
      pokemonId++;
    }

    notifyListeners();
  }

  set pokemonIdCounter(int value) {
    pokemonId = value;
  }


  void addPokemon(id) async {
    final pokemon = await PokemonServices.getPokemon(id);

    _pokemons.add(pokemon);

    notifyListeners();
  }

  List<Pokemon> get pokemons => _pokemons;
}

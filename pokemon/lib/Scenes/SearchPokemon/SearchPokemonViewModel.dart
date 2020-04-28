import 'package:flutter/material.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Service/ServiceLayer.dart';

class SearchPokemonViewModel extends ChangeNotifier {

  List<Pokemon> pokemons = List<Pokemon>(); 

  Future<void> fetchPokemons(String name) async {
    final results = await ServiceLayer().fetchPokemon(name);
    this.pokemons = [results];
    print(this.pokemons);
    notifyListeners(); 
  }

}

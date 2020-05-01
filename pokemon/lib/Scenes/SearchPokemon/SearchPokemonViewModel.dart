import 'package:flutter/material.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Service/ServiceLayer.dart';

enum SearchViewStatus {
  idle,
  loading,
  loaded,
  notFound,
}

class SearchPokemonViewModel extends ChangeNotifier {

  SearchViewStatus status = SearchViewStatus.idle;
  List<Pokemon> pokemons = List<Pokemon>(); 

  Future<void> fetchPokemons(String name) async {
    status = SearchViewStatus.loading;
    final results = await ServiceLayer().fetchPokemon(name);
    this.pokemons = [results];
    status = SearchViewStatus.loaded;
    print(this.pokemons);
    notifyListeners(); 
  }

  

}

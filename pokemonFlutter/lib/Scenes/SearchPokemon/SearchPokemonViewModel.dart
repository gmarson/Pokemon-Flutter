import 'package:flutter/material.dart';

import '../../Models/pokemon.dart';
import '../../Service/custom_exceptions.dart';
import '../../Service/pokemon_service_layer.dart';

enum SearchViewStatus { idle, loading, loaded, notFound, unknownError }

class SearchPokemonViewModel extends ChangeNotifier {
  SearchViewStatus status = SearchViewStatus.idle;
  List<Pokemon> pokemons = List<Pokemon>();

  Future<void> fetchPokemons(String name) async {
    status = SearchViewStatus.loading;
    notifyListeners();
    try {
      final results = await PokemonServiceLayer().fetchPokemon(name);
      this.pokemons = [results.data];
      status = SearchViewStatus.loaded;
    } on NotFoundException {
      status = SearchViewStatus.notFound;
    } catch (_) {
      status = SearchViewStatus.unknownError;
    }

    notifyListeners();
  }
}

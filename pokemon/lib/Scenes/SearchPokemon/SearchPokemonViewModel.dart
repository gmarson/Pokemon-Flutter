import 'package:flutter/material.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Service/custom_exceptions.dart';
import 'package:pokemon/Service/pokemon_service_layer.dart';

enum SearchViewStatus { idle, loading, loaded, notFound, unknownError }

class SearchPokemonViewModel extends ChangeNotifier {
  SearchViewStatus status = SearchViewStatus.idle;
  List<Pokemon> pokemons = List<Pokemon>();

  Future<void> fetchPokemons(String name) async {
    status = SearchViewStatus.loading;
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

import 'package:flutter/material.dart';
import 'package:pokemon/Models/Pokemon.dart';
import 'package:pokemon/Service/ServiceLayer.dart';

class SearchPokemonViewModel extends ChangeNotifier {

  List<Pokemon> pokemons = List<Pokemon>(); 

  Future<void> fetchPokemons(String name) async {
    final results =  await ServiceLayer().fetchPokemons(name);
    this.pokemons = results.map((item) => Pokemon()).toList();
    print(this.pokemons);
    notifyListeners(); 
  }

}
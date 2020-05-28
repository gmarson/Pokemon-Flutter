import 'package:flutter/material.dart';
import 'package:pokemonFlutter/Components/cell_info.dart';
import 'package:pokemonFlutter/Models/pokemon.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemons;

  PokemonList({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.pokemons.length,
      itemBuilder: (context, index) {
        return CellInfo(
          pokemon: this.pokemons[index],
        );
      },
    );
  }
}

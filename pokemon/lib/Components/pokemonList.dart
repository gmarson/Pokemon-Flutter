import 'package:flutter/material.dart';
import 'package:pokemon/Components/cell_info.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Extensions/string_extensions.dart';

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

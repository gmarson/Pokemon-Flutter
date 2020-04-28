import 'package:flutter/material.dart';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Models/sprites.dart';

class PokemonList extends StatelessWidget {
  
  final List<Pokemon> pokemons;

  PokemonList({this.pokemons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.pokemons.length,
      itemBuilder: (context, index) {
        
        final pokemon = this.pokemons[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pokemon.sprites.front)
              ),
              borderRadius: BorderRadius.circular(6)
            ),
            width: 50, 
            height: 100,
            ),
          title: Text(pokemon.name),
        );
      },
    );
  }
}
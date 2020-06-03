import 'package:flutter/material.dart';
import 'package:pokemonFlutter/Models/Pokemon.dart';

class PokemonDetailed extends StatefulWidget {
  final Pokemon pokemon;
  
  PokemonDetailed({@required this.pokemon});

  @override
  _PokemonDetailedState createState() => _PokemonDetailedState();
}

class _PokemonDetailedState extends State<PokemonDetailed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blueGrey,
      child: Center(child: Text("sasdf")));
  }
}
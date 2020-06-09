import 'package:flutter/material.dart';

import '../../Components/detailed_stats.dart';
import '../../Models/pokemon.dart';

class PokemonDetailed extends StatefulWidget {
  final Pokemon pokemon;
  static final String routeName = "/detailed";

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
      child: Center(child: DetailedStats(detailStatsModel: widget.pokemon.stats)));
  }
}
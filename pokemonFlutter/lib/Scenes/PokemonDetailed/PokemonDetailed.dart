import 'package:flutter/material.dart';

class PokemonDetailed extends StatelessWidget {
  const PokemonDetailed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blueGrey,
      child: Text("oi"),
    );
  }
}
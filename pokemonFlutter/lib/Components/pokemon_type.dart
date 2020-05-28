import 'package:flutter/material.dart';

import 'package:pokemonFlutter/Models/type.dart';
import 'package:pokemonFlutter/Extensions/string_extensions.dart';

class PokemonTypeView extends StatelessWidget {
  const PokemonTypeView({@required this.type});

  final PType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          this.type.type.name.capitalizeFirst(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        color: _getColorForType(),
      ),
    );
  }

  Color _getColorForType() {
    int a = 255;
    switch (this.type.type.name) {
      case "normal":
        return Color.fromARGB(a, 168, 168, 120);
      case "fighting":
        return Color.fromARGB(a, 192, 48, 40);
      case "flying":
        return Color.fromARGB(a, 168, 144, 240);
      case "poison":
        return Color.fromARGB(a, 160, 65, 159);
      case "ground":
        return Color.fromARGB(a, 223, 190, 104);
      case "rock":
        return Color.fromARGB(a, 184, 159, 56);
      case "bug":
        return Color.fromARGB(a, 168, 184, 32);
      case "ghost":
        return Color.fromARGB(a, 112, 88, 152);
      case "steel":
        return Color.fromARGB(a, 184, 184, 207);
      case "fire":
        return Color.fromARGB(a, 240, 127, 48);
      case "water":
        return Color.fromARGB(a, 104, 144, 239);
      case "grass":
        return Color.fromARGB(a, 120, 199, 81);
      case "electric":
        return Color.fromARGB(a, 248, 207, 48);
      case "psychic":
        return Color.fromARGB(a, 248, 88, 136);
      case "ice":
        return Color.fromARGB(a, 152, 215, 215);
      case "dragon":
        return Color.fromARGB(a, 112, 57, 247);
      case "dark":
        return Color.fromARGB(a, 112, 88, 72);
      case "fairy":
        return Color.fromARGB(a, 240, 182, 187);
      default:
        return Color.fromARGB(0, 0, 0, 0);
    }
  }
}

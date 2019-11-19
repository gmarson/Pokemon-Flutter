import 'package:flutter/material.dart';

import '../Models/PokemonType.dart';

class PokemonTypeView extends StatelessWidget {
  const PokemonTypeView({@required this.type});

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: Text(
          type.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        color: _getColorForType(),
      ),
      width: double.infinity,
      height: 15.0,
    );
  }

  Color _getColorForType() {
    int a = 255;
    switch (this.type) {
      case PokemonType.empty:
        return Color.fromARGB(0, 255, 255, 255);
      case PokemonType.normal:
        return Color.fromARGB(a, 168, 168, 120);
      case PokemonType.fighting:
        return Color.fromARGB(a, 192, 48, 40);
      case PokemonType.flying:
        return Color.fromARGB(a, 168, 144, 240);
      case PokemonType.poison:
        return Color.fromARGB(a, 160, 65, 159);
      case PokemonType.ground:
        return Color.fromARGB(a, 223, 190, 104);
      case PokemonType.rock:
        return Color.fromARGB(a, 184, 159, 56);
      case PokemonType.bug:
        return Color.fromARGB(a, 168, 184, 32);
      case PokemonType.ghost:
        return Color.fromARGB(a, 112, 88, 152);
      case PokemonType.steel:
        return Color.fromARGB(a, 184, 184, 207);
      case PokemonType.fire:
        return Color.fromARGB(a, 240, 127, 48);
      case PokemonType.water:
        return Color.fromARGB(a, 104, 144, 239);
      case PokemonType.grass:
        return Color.fromARGB(a, 120, 199, 81);
      case PokemonType.electric:
        return Color.fromARGB(a, 248, 207, 48);
      case PokemonType.psychic:
        return Color.fromARGB(a, 248, 88, 136);
      case PokemonType.ice:
        return Color.fromARGB(a, 152, 215, 215);
      case PokemonType.dragon:
        return Color.fromARGB(a, 112, 57, 247);
      case PokemonType.dark:
        return Color.fromARGB(a, 112, 88, 72);
      case PokemonType.fairy:
        return Color.fromARGB(a, 240, 182, 187);
      default:
        return Color.fromARGB(0, 0, 0, 0);
    }
  }
}

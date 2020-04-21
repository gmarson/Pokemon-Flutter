import 'package:flutter/material.dart';

import '../Models/PokemonStatType.dart';

class DetailedStats extends StatelessWidget {
  DetailedStats(this.hp, this.attack, this.defense, this.spAttack,
      this.spDefense, this.speed);

  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildTypeView(PokemonStatType.hp, hp.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child: _buildTypeView(PokemonStatType.attack, attack.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.defense, defense.toString()))
        ],
      ),
    ));
  }

  Widget _buildTypeView(PokemonStatType type, String text) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: _getBorderColorForStatType(type),
            width: 2.0
          ),
          color: _getColorForStatType(type),
          borderRadius: BorderRadius.circular(8.0)),
    );
  }

  Color _getColorForStatType(PokemonStatType type) {
    int a = 255;
    switch (type) {
      case PokemonStatType.hp:
        return Color.fromARGB(a, 252, 91, 93);
      case PokemonStatType.attack:
        return Color.fromARGB(a, 243, 172, 124);
      case PokemonStatType.defense:
        return Color.fromARGB(a, 249, 223, 127);
      case PokemonStatType.spAtk:
        return Color.fromARGB(a, 158, 184, 243);
      case PokemonStatType.spDef:
        return Color.fromARGB(a, 168, 218, 144);
      default:
        return Color.fromARGB(a, 248, 147, 178);
    }
  }

  Color _getBorderColorForStatType(PokemonStatType type) {
    int a = 255;
    switch (type) {
      case PokemonStatType.hp:
        return Color.fromARGB(a, 252, 13, 27);
      case PokemonStatType.attack:
        return Color.fromARGB(a, 238, 128, 59);
      case PokemonStatType.defense:
        return Color.fromARGB(a, 247, 207, 67);
      case PokemonStatType.spAtk:
        return Color.fromARGB(a, 106, 146, 237);
      case PokemonStatType.spDef:
        return Color.fromARGB(a, 122, 198, 87);
      default:
        return Color.fromARGB(a, 246, 91, 137);
    }
  }
}

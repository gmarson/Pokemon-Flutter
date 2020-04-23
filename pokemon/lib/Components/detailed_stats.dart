import 'package:flutter/material.dart';
import 'package:pokemon/Models/Helpers/PokemonStatTypeModel.dart';

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
      child: Column(
        children: <Widget>[
          Expanded(child: _upperRow()),
          Expanded(child: _bottomRow())
        ],
      ),
    ));
  }

  Row _upperRow() => Row(
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
      );

  Row _bottomRow() => Row(
        children: <Widget>[
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.spAtk, spAttack.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.spDef, spDefense.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child: _buildTypeView(PokemonStatType.speed, speed.toString()))
        ],
      );

  Widget _buildTypeView(PokemonStatType attributeType, String text) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            AttributesForStatType.stringForPokemonType(attributeType ),
            textAlign: TextAlign.center,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: AttributesForStatType.getBorderColorForStatType(attributeType),
              width: 2.0),
          color: AttributesForStatType.getColorForStatType(attributeType),
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}

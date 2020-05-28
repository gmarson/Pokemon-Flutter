import 'package:flutter/material.dart';
import 'package:pokemonFlutter/Models/Helpers/PokemonStatTypeModel.dart';
import 'package:pokemonFlutter/Models/detailed_stats_model.dart';

class DetailedStats extends StatelessWidget {

  final DetailedStatsModel detailStatsModel;

  DetailedStats({@required this.detailStatsModel});

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
          Expanded(child: _buildTypeView(PokemonStatType.hp, detailStatsModel.hp.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child: _buildTypeView(PokemonStatType.attack, detailStatsModel.attack.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.defense, detailStatsModel.defense.toString()))
        ],
      );

  Row _bottomRow() => Row(
        children: <Widget>[
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.spAtk, detailStatsModel.spAttack.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child:
                  _buildTypeView(PokemonStatType.spDef, detailStatsModel.spDefense.toString())),
          SizedBox(width: 4.0),
          Expanded(
              child: _buildTypeView(PokemonStatType.speed, detailStatsModel.speed.toString()))
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

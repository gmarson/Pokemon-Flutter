import 'package:flutter/material.dart';

class DetailedStats extends StatefulWidget {

  DetailedStats(
      this.hp,
      this.attack,
      this.defense,
      this.spAttack,
      this.spDefense,
      this.speed) {
        this._total = this.hp + this.attack + this.defense + this.spAttack + this.spDefense + this.speed;
      }

  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;
  int _total;

  _DetailedStatsState createState() => _DetailedStatsState();
}

class _DetailedStatsState extends State<DetailedStats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[


          SizedBox(
            width: 2,
          ),
          
          
        ],
      ),
    );
  }

  Widget _buildInfoView() {
    return Container();
  }

  
 
}
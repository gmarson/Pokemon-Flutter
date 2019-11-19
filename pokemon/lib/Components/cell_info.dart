import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pokemon/Models/PokemonType.dart';

class CellInfo extends StatefulWidget {
  CellInfo(
      {@required this.name,
      @required this.height,
      @required this.widht,
      @required this.image,
      @required this.firstType,
      this.secondType});

  final String name;
  final int height;
  final int widht;
  final Image image;
  final PokemonType firstType;
  final PokemonType secondType;

  _CellInfoState createState() => _CellInfoState();
}

class _CellInfoState extends State<CellInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SizedBox(
          child: Row(
            children: <Widget>[
              widget.image,
              Column(
                children: <Widget>[
                  Text("Title"),
                  Text("Height: " + widget.height.toString()),
                  Text("Width: "+ widget.widht.toString()),

                  Column(children: <Widget>[
                    Text("Types: "),

                  ],) 

                ],
              )
            ],
          ),
          width: double.infinity,
          height: 175.0,
        ),
      ),
    );
  }
}

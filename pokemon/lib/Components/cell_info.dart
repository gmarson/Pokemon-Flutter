import 'package:flutter/material.dart';

import 'package:pokemon/Models/pokemon.dart';
import '../Components/pokemon_type.dart';
import 'package:pokemon/Extensions/string_extensions.dart';

class CellInfo extends StatelessWidget {
  CellInfo({@required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8,
          ),
          _buildImage(),
          _buildContent()
        ],
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
        child: Image.network(
      this.pokemon.sprites.front,
      fit: BoxFit.contain,
      width: 100,
      height: 100,
    ));
  }

  Widget _buildContent() {
    TextStyle titleTextStyle =
        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
    TextStyle infoTextStyle = TextStyle(fontSize: 19.0);

    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              this.pokemon.name.capitalizeFirst(),
              textAlign: TextAlign.left,
              style: titleTextStyle,
            ),
            SizedBox(height: 4),
            Text(
              "Height: " + pokemon.height.toString(),
              textAlign: TextAlign.left,
              style: infoTextStyle,
            ),
            SizedBox(height: 2),
            Text(
              "Weight: " + pokemon.weight.toString(),
              textAlign: TextAlign.left,
              style: infoTextStyle,
            ),
            SizedBox(height: 2),
            Row(
              children: <Widget>[
                Text(
                  "Type: ",
                  textAlign: TextAlign.left,
                  style: infoTextStyle,
                ),
                buildTypeComponent()
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Row buildTypeComponent() {
    List<Widget> types = List();
    types.add(PokemonTypeView(type: pokemon.types.first));

    if (pokemon.types.length > 1) {
      types.add(
        SizedBox(
          width: 6,
        ),
      );
      types.add(PokemonTypeView(type: pokemon.types[1]));
    }

    return Row(
      children: types,
    );
  }
}

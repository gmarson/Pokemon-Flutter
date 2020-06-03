import 'package:flutter/material.dart';

import '../Models/pokemon.dart';
import '../Components/pokemon_type.dart';
import '../Extensions/string_extensions.dart';

class CellInfo extends StatelessWidget {
  CellInfo({@required this.pokemon, this.onTap});

  final Pokemon pokemon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var content = _contentOfCell();
    return GestureDetector(
      child: content,
      onTap: () {
        if(onTap != null) {
          onTap.call();
        }
      },
    );
  }

  Widget _contentOfCell() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300], boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 8.0,
                  spreadRadius: 5.0,
                  offset: Offset(0.0, 1.0))
            ]),
            child: Row(
              children: <Widget>[_buildImage(), _buildContent()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: SizedBox(
        child: Image.network(
          this.pokemon.sprites.front,
          fit: BoxFit.contain,
          width: 100,
          height: 135,
        ),
      ),
    );
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

import 'package:flutter/material.dart';

import '../Models/PokemonTypeModel.dart';
import '../Components/pokemon_type.dart';

class CellInfo extends StatefulWidget {
  CellInfo(
      {@required this.name,
      @required this.heightValue,
      @required this.widhtValue,
      @required this.imagePath,
      @required this.firstType,
      this.secondType});

  final String name;
  final int heightValue;
  final int widhtValue;
  final String imagePath;
  final PokemonType firstType;
  final PokemonType secondType;

  _CellInfoState createState() => _CellInfoState();
}

class _CellInfoState extends State<CellInfo> {
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
      child: Image.asset(
        widget.imagePath,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
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
              "Title",
              textAlign: TextAlign.left,
              style: titleTextStyle,
            ),
            SizedBox(height: 4),
            Text(
              "Height: " + widget.heightValue.toString(),
              textAlign: TextAlign.left,
              style: infoTextStyle,
            ),
            SizedBox(height: 2),
            Text(
              "Width: " + widget.widhtValue.toString(),
              textAlign: TextAlign.left,
              style: infoTextStyle,
            ),
            SizedBox(height: 2),
            Row(
              children: <Widget>[
                Text(
                  "Types: ",
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
    types.add(PokemonTypeView(type: widget.firstType));

    if (widget.secondType != null) {
      types.add(
        SizedBox(
          width: 6,
        ),
      );
      types.add(PokemonTypeView(type: widget.secondType));
    }

    return Row(
      children: types,
    );
  }
}

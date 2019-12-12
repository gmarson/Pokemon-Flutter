import 'package:flutter/material.dart';
import 'package:pokemon/Components/cell_info.dart';
import 'package:pokemon/Models/PokemonType.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: CellInfo(
              firstType: PokemonType.bug,
              heightValue: 10,
              widhtValue: 10,
              name: "Bla bla bla",
              imagePath: "assets/images/charizard.png",
              secondType: PokemonType.dark,
            ),
            width: double.infinity,
            height: 140.0,
          )
        ],
      ),
    );
  }
}

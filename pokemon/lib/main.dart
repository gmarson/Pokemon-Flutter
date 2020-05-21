import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon/Scenes/PokemonDetailed/PokemonDetailed.dart';

import './Scenes/TabBar.dart';
import './Components/detailed_stats.dart';
import 'Models/detailed_stats_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'detailed': (context) => PokemonDetailed(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Pokemon Tracker'),
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
        body: TabBarDemo(
          searchScreen: _buildDetailedStats(),
          savedScreen: SizedBox(),
        ));
  }

  Widget _buildDetailedStats() {
    return Container(
      child: DetailedStats(detailStatsModel: DetailedStatsModel()),
    );
  }
}

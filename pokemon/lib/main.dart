import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:pokemon/Scenes/PokemonDetailed/PokemonDetailed.dart';
import './Scenes/TabBar.dart';
import './Models/routes.dart';
import './Components/detailed_stats.dart';
import 'Models/detailed_stats_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    static var routes = {
      Routes.detailed.name(): (context) => PokemonDetailed(),
    };

  @override
  Widget build(BuildContext context) {
    var title = "Pokemon Demo";
    

    var themeData = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blueGrey,
    );
    var homePage = MyHomePage(title: 'Pokemon Tracker');

    if (Platform.isIOS) {
      return CupertinoApp(
        title: title,
        home: homePage,
        theme: CupertinoThemeData(primaryColor: Colors.blueGrey),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      );
    } else {
      return MaterialApp(
      title: title,
      routes: routes,
      theme: themeData,
      home: homePage,
    );
    }
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

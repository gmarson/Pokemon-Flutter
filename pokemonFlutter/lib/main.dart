import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:pokemonFlutter/Scenes/PokemonDetailed/PokemonDetailed.dart';
import 'package:pokemonFlutter/Routes/route_generator.dart';
import './Scenes/TabBar.dart';
import './Routes/routes.dart';
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
        onGenerateRoute: RouteGenerator.generateRoute,
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
        onGenerateRoute: RouteGenerator.generateRoute,
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
    var tabBar =  TabBarDemo(
        searchScreen: _buildDetailedStats(),
        savedScreen: SizedBox());

    return Platform.isIOS ? 
    
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.title),),
      child: SafeArea(child: tabBar),
    ) :
    
    Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: tabBar,);
  }

  Widget _buildDetailedStats() {
    return Container(
      child: DetailedStats(detailStatsModel: DetailedStatsModel()),
    );
  }
}

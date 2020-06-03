import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemonFlutter/Models/Pokemon.dart';
import 'dart:io' show Platform;

import 'package:pokemonFlutter/Scenes/PokemonDetailed/PokemonDetailed.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/detailed':
        if(args is Pokemon) {
          return buildRoute(PokemonDetailed(pokemon: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static PageRoute buildRoute(Widget scene) {
      return Platform.isIOS ? 
      CupertinoPageRoute(fullscreenDialog: false, builder: (context) => scene) :
       MaterialPageRoute(builder: (context) => scene);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Route not specified!"),
        ),
      );
    });
  }
}

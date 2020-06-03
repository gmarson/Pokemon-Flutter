import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../Models/pokemon.dart';
import '../Scenes/PokemonDetailed/PokemonDetailed.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/detailed':
        if(settings.arguments is Pokemon) {
          Pokemon pokemon = settings.arguments as Pokemon;
          return buildRoute(PokemonDetailed(pokemon: pokemon));
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

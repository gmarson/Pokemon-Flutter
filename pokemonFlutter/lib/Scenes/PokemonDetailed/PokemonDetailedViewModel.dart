import 'package:flutter/cupertino.dart';
import 'package:pokemonFlutter/Models/pokemon.dart';

enum DetailedViewStatus { idle, loaded }

class DetailedPokemonViewModel extends ChangeNotifier {
  
  Pokemon pokemon;

}
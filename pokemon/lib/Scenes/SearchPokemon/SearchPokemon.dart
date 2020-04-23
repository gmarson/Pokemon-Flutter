import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SearchPokemonViewModel.dart';

class SearchPokemon extends StatelessWidget {
  const SearchPokemon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchPokemonViewModel(), 
        child: Text("WIP"),
      );
  }
}
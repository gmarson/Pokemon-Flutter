import 'package:flutter/material.dart';
import 'package:pokemon/Scenes/SearchPokemon/SearchPokemonViewModel.dart';
import 'package:provider/provider.dart';

class TabBarDemo extends StatelessWidget {

  TabBarDemo({@required this.searchScreen, @required this.savedScreen});

  final Widget searchScreen;
  final Widget savedScreen;

  @override
  Widget build(BuildContext context) {
    return buildTabBar();
  }

  Widget buildSearchPokemon() {
    return MaterialApp( ///tenho que retornar um SearchPokemon aki
      title: "Movies",
      home: ChangeNotifierProvider(
        create: (context) => SearchPokemonViewModel(), 
        child: Text("WIP"),
      )
    );
  }

  Widget buildTabBar() {
    return SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
          body: TabBarView(
            children: [
              buildSearchPokemon(),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}

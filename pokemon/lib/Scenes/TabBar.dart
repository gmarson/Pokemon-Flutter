import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/Scenes/SearchPokemon/SearchPokemon.dart';
import 'package:pokemon/Scenes/SearchPokemon/SearchPokemonViewModel.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class TabBarDemo extends StatelessWidget {
  TabBarDemo({@required this.searchScreen, @required this.savedScreen});

  final Widget searchScreen;
  final Widget savedScreen;

  @override
  Widget build(BuildContext context) {
    return _buildTabBar();
  }

  Widget _buildSearchPokemon() {
    return ChangeNotifierProvider(
      create: (context) => SearchPokemonViewModel(),
      child: SearchPokemon(),
    );
  }

  Widget _buildAndroidTabBar() {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.blueGrey,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.save_alt), text: "Saved"),
            ],
          ),
          body: TabBarView(
            children: [
              _buildSearchPokemon(),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIOSTabBar() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book))
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return CupertinoPageScaffold(child: _buildSearchPokemon());
              case 1:
                return CupertinoPageScaffold(child: Text("WIP"));
              default:
                return CupertinoPageScaffold(child: Text(""));
            }
          },
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Platform.isIOS ? _buildIOSTabBar() : _buildAndroidTabBar();
  }
}

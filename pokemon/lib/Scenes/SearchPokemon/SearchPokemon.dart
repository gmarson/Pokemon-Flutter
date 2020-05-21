import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pokemon/Components/cell_info.dart';
import 'package:pokemon/Models/routes.dart';

import 'package:provider/provider.dart';
import 'SearchPokemonViewModel.dart';

class SearchPokemon extends StatefulWidget {
  @override
  _SearchPokemonState createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon>
    with AutomaticKeepAliveClientMixin<SearchPokemon> {
  final TextEditingController _controller = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = Provider.of<SearchPokemonViewModel>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: _buildScreen(vm),
        ),
      ),
    );
  }

  List<Widget> _buildScreen(SearchPokemonViewModel vm) {
    final list = <Widget>[_searchBar(vm)];
    if (vm.status == SearchViewStatus.idle) {
      list.add(_subScreen(
          "Time to search for pokemons!", "assets/images/search.png"));
    } else if (vm.status == SearchViewStatus.loaded) {
      list.add(_pokemonList(vm));
    } else if (vm.status == SearchViewStatus.unknownError ||
        vm.status == SearchViewStatus.notFound) {
      list.add(_subScreen(
          "We couldn't find your pokemon", "assets/images/notFound.png"));
    } else if (vm.status == SearchViewStatus.loading) {
      list.add(_centeredLoadingIndicator());
    }

    return list;
  }

  Widget _pokemonList(SearchPokemonViewModel vm) {
    return Expanded(
        child: ListView.builder(
      itemCount: vm.pokemons.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: CellInfo(
            pokemon: vm.pokemons[index],
          ),
          onTap: () {
            print("gesture detector foi disparado");
            Navigator.pushNamed(context, Routes.detailed.toString());
          },
        );
      },
    ));
  }

  Widget _centeredLoadingIndicator() {
    return Expanded(
      child: Center(
        child: Loading(
            indicator: BallSpinFadeLoaderIndicator(),
            size: 55.0,
            color: Colors.blueGrey),
      ),
    );
  }

  Widget _subScreen(String title, String imageName) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            SizedBox(
              child: Image.asset(imageName),
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar(SearchPokemonViewModel vm) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _controller,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            vm.fetchPokemons(value);
            _controller.clear();
          }
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}

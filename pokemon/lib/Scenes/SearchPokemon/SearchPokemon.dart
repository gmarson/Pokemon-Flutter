import 'package:flutter/material.dart';
import 'package:pokemon/Components/pokemonList.dart';
import 'package:provider/provider.dart';
import 'SearchPokemonViewModel.dart';

class SearchPokemon extends StatefulWidget {
  @override
  _SearchPokemonState createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    Provider.of<SearchPokemonViewModel>(context, listen: false)
        .fetchPokemons("ditto");
  }

  @override
  Widget build(BuildContext context) {
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
    if(vm.status == SearchViewStatus.loaded) {
      list.add(_pokemonList(vm));
    }
    return list;
  }

  Widget _pokemonList(SearchPokemonViewModel vm) {
    return Expanded(child: PokemonList(pokemons: vm.pokemons));
  }

  Widget _searchBar(SearchPokemonViewModel vm) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
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

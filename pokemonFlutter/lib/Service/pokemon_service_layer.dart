import 'dart:convert';
import 'package:pokemonFlutter/Models/pokemon.dart';
import 'package:pokemonFlutter/Service/api_provider.dart';
import 'package:pokemonFlutter/Service/response.dart';

class PokemonServiceLayer {
  final baseEndpoint = "https://pokeapi.co/api/v2/";
  final ApiProvider provider = ApiProvider();

  Future<Response> fetchPokemon(String name) async {
    try {
      dynamic response = await provider.get("pokemon/" + name);
      final body = jsonDecode(response);
      return Response.completed(Pokemon.fromJson(body));
    } catch (e) {
      throw e.toString();
    }
  }
}

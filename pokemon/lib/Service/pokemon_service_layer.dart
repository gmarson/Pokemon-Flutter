import 'dart:convert';
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Service/api_provider.dart';
import 'package:pokemon/Service/response.dart';

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

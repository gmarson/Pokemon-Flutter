import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon.dart';
import 'package:pokemon/Service/api_provider.dart';
import 'package:pokemon/Service/response.dart'; 

class ServiceLayer {

  final baseEndpoint = "https://pokeapi.co/api/v2/";

  Future<Pokemon> fetchPokemon(String name) async {

    final url = baseEndpoint+"pokemon/"+name;
    final response = await http.get(url);
    final body = jsonDecode(response.body); 
    return Pokemon.fromJson(body);

  }

  Future<Pokemon> fetcdedfhPokemon(String name) async {
    ApiProvider provider = ApiProvider();
    dynamic response = await provider.get("pokemon/"+name);
    final body = jsonDecode(response.body); 
    return Pokemon.fromJson(body);

  }


}
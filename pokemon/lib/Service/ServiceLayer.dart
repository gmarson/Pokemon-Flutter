import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon.dart'; 

class ServiceLayer {

  final baseEndpoint = "https://pokeapi.co/api/v2/";

  Future<Pokemon> fetchPokemon(String name) async {

    final url = baseEndpoint+"pokemon/"+name;
    final response = await http.get(url);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body); 
       return Pokemon.fromJson(body);

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
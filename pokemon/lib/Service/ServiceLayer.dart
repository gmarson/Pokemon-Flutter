import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/Pokemon.dart'; 

class ServiceLayer {

  Future<List<Pokemon>> fetchPokemons(String name) async {

    final url = "http://www.omdbapi.com/";
    final response = await http.get(url);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body); 
       final Iterable json = body["Search"];
       return json.map((movie) => Pokemon.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
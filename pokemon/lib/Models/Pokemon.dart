import 'package:pokemon/Models/sprites.dart';
import 'package:pokemon/Models/stat.dart';

class Pokemon {
  final int height;
  final int baseExperience;
  final int id;
  final int weight;
  final String name;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;

  Pokemon(
      {this.height,
      this.baseExperience,
      this.id,
      this.name,
      this.weight,
      this.sprites,
      this.stats,
      this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<Stat> stats = json["stats"].cast<Stat>();
    List<Type> types = json["types"].cast<Type>();

    return Pokemon(
      height: json["height"],
      baseExperience: json["base_experience"],
      id: json["id"],
      name: json["name"],
      weight: json["weight"],
      sprites: Sprites.fromJson(json["sprites"]),
      stats: stats,
      types: types,
    );
  }
}

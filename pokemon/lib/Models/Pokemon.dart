import 'package:pokemon/Models/detailed_stats_model.dart';
import 'package:pokemon/Models/sprites.dart';
import 'package:pokemon/Models/stat.dart';

import 'package:pokemon/Models/type.dart';

class Pokemon {
  final int height;
  final int baseExperience;
  final int id;
  final int weight;
  final String name;
  final Sprites sprites;
  final DetailedStatsModel stats;
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
    
    List<Type> types = (json["types"] as List).map((type) => Type.fromJson(type)).toList();
    List<Stat> statList = (json['stats'] as List).map((stat) => Stat.fromJson(stat)).toList();

    return Pokemon(
      height: json["height"],
      baseExperience: json["base_experience"],
      id: json["id"],
      name: json["name"],
      weight: json["weight"],
      sprites: Sprites.fromJson(json["sprites"]),
      stats: DetailedStatsModel.fromListOfStat(statList),
      types: types,
    );
  }
}

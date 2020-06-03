import '../Models/detailed_stats_model.dart';
import '../Models/sprites.dart';
import '../Models/stat.dart';
import '../Models/type.dart';

class Pokemon {
  final int height;
  final int baseExperience;
  final int id;
  final int weight;
  final String name;
  final Sprites sprites;
  final DetailedStatsModel stats;
  final List<PType> types;

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
    
    List<PType> types = (json["types"] as List).map((type) => PType.fromJson(type)).toList();
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

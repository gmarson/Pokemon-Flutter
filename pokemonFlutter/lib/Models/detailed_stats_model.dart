import '../Models/stat.dart';

class DetailedStatsModel {

  int hp;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  DetailedStatsModel();

  factory DetailedStatsModel.fromListOfStat(List<Stat> stats) {
    DetailedStatsModel ds = new DetailedStatsModel();
    for (Stat stat in stats) {
      switch (stat.type.name) {
        case "speed":
          ds.speed = stat.base;
          break;
        case "special-defense":
          ds.spDefense = stat.base;
          break;
        case "special-attack":
          ds.spAttack = stat.base;
          break;
        case "defense":
          ds.defense = stat.base;
          break;
        case "attack":
          ds.attack = stat.base;
          break;
        case "hp":
          ds.hp = stat.base;
          break;
      }
    }
    return ds;
  }
}
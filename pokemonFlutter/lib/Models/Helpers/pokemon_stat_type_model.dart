import 'dart:ui';

enum PokemonStatType {
  hp,
  attack,
  defense,
  spAtk,
  spDef,
  speed,
}

class AttributesForStatType {
  static String stringForPokemonType(PokemonStatType t) {
    switch (t) {
      case PokemonStatType.hp:
        return "Hp";
      case PokemonStatType.attack:
        return "Attack";
      case PokemonStatType.defense:
        return "Defense";
      case PokemonStatType.spAtk:
        return "Sp.Atk";
      case PokemonStatType.spDef:
        return "Sp.Def";
      default:
        return "Speed";
    }
  }

  static Color getColorForStatType(PokemonStatType type) {
    int a = 255;
    switch (type) {
      case PokemonStatType.hp:
        return Color.fromARGB(a, 252, 91, 93);
      case PokemonStatType.attack:
        return Color.fromARGB(a, 243, 172, 124);
      case PokemonStatType.defense:
        return Color.fromARGB(a, 249, 223, 127);
      case PokemonStatType.spAtk:
        return Color.fromARGB(a, 158, 184, 243);
      case PokemonStatType.spDef:
        return Color.fromARGB(a, 168, 218, 144);
      default:
        return Color.fromARGB(a, 248, 147, 178);
    }
  }

  static Color getBorderColorForStatType(PokemonStatType type) {
    int a = 255;
    switch (type) {
      case PokemonStatType.hp:
        return Color.fromARGB(a, 252, 13, 27);
      case PokemonStatType.attack:
        return Color.fromARGB(a, 238, 128, 59);
      case PokemonStatType.defense:
        return Color.fromARGB(a, 247, 207, 67);
      case PokemonStatType.spAtk:
        return Color.fromARGB(a, 106, 146, 237);
      case PokemonStatType.spDef:
        return Color.fromARGB(a, 122, 198, 87);
      default:
        return Color.fromARGB(a, 246, 91, 137);
    }
  }
}

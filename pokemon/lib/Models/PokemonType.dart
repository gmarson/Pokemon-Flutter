import 'package:flutter/material.dart';

class AttributesForType {

  String stringForPokemonType(PokemonType t) {
    switch (t) {
      case PokemonType.empty:
        return "Empty";
      case PokemonType.normal:
        return "Normal";
      case PokemonType.fighting:
        return "Fighting";
      case PokemonType.flying:
        return "Flying";
      case PokemonType.poison:
        return "Poison";
      case PokemonType.ground:
        return "Ground";
      case PokemonType.rock:
        return "Rock";
      case PokemonType.bug:
        return "Bug";
      case PokemonType.ghost:
        return "Ghost";
      case PokemonType.steel:
        return "Steel";
      case PokemonType.fire:
        return "Fire";
      case PokemonType.water:
        return "Water";
      case PokemonType.grass:
        return "Grass";
      case PokemonType.electric:
        return "Electric";
      case PokemonType.psychic:
        return "Psychic";
      case PokemonType.ice:
        return "Ice";
      case PokemonType.dragon:
        return "Dragon";
      case PokemonType.dark:
        return "Dark";
      case PokemonType.fairy:
        return "Fairy";
      default:
        return "";
    }
  }
}

enum PokemonType {
  empty,
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy
}

const PrimaryColor = Color(0xFF808080);
const PrimaryAssentColor = Color(0xFF808080);
const PrimaryDarkColor = Color(0xFF808080);
const ErroColor = Color(0xFF808080);

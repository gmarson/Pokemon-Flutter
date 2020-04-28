class Sprites {
  final String back;
  final String front;
  final String backShiny;
  final String frontShiny;

  Sprites({this.back, this.front, this.backShiny, this.frontShiny});

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      back: json["back_default"],
      front: json["front_default"],
      frontShiny: json["front_shiny"],
      backShiny: json["back_shiny"],
    );
  }
}

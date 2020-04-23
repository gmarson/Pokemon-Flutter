class Pokemon {

  final String title; 
  final String poster; 

  Pokemon({this.title, this.poster});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      title: json["Title"], 
      poster: json["Poster"]
    );
  }

}
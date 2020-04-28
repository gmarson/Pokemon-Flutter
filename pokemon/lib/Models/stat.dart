import 'package:pokemon/Models/value_url_attr.dart';

class Stat {

  final String base; 
  final String effort;
  final ValueUrlAttr type;

  Stat({this.base, this.effort, this.type});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      base: json["base_stat"], 
      effort: json["effort"],
      type: ValueUrlAttr.fromJson(json["type"])
    );
  }
}


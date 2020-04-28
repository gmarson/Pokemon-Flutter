import 'package:pokemon/Models/value_url_attr.dart';

class Type {
  final String slot; 
  final ValueUrlAttr type;

  Type({this.slot, this.type});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      slot: json["slot"],
      type: ValueUrlAttr.fromJson(json["type"])
    );
  }
}
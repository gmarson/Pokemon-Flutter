import 'package:pokemon/Models/value_url_attr.dart';

class PType {
  final int slot; 
  final ValueUrlAttr type;

  PType({this.slot, this.type});

  factory PType.fromJson(Map<String, dynamic> json) {
    return PType(
      slot: json["slot"],
      type: ValueUrlAttr.fromJson(json["type"])
    );
  }
}
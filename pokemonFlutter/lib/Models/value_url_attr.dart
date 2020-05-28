class ValueUrlAttr {
  final String name; 
  final String url;

  ValueUrlAttr({this.name, this.url});

  factory ValueUrlAttr.fromJson(Map<String, dynamic> json) {
    return ValueUrlAttr(
      name: json["name"], 
      url: json["url"]
    );
  }
}
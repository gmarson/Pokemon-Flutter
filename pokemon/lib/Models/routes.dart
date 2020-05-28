
enum Routes {
  detailed
}

extension ParseToString on Routes {
  String name() {
    return "/" + this.toString().split('.').last;
  }
}
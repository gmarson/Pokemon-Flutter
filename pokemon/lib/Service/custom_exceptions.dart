
class BadRequestException implements Exception {
  String body;
  BadRequestException(this.body);
}
class UnauthorisedException implements Exception {
  String body;
  UnauthorisedException(this.body);
}
class FetchDataException implements Exception {
  String body;
  FetchDataException(this.body);
}
class InternalServerErrorException implements Exception {
  String body;
  InternalServerErrorException(this.body);
}
class ForbiddenException implements Exception {
  String body;
  ForbiddenException(this.body);
}
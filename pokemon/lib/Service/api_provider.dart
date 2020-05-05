import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:pokemon/Service/custom_exceptions.dart';
import 'package:pokemon/Service/response.dart';

class ApiProviderContract {
  Future<dynamic> get(String url) async {}
  final String _baseUrl = null;
}

class ApiProvider implements ApiProviderContract {
  
  @override
  final String _baseUrl = "https://pokeapi.co/api/v2/";

  @override
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 500:
        throw InternalServerErrorException(response.body.toString());
      case 404: 
        throw NotFoundException(response.body.toString());
      default:
        throw FetchDataException("Error occured while Communication with Server with StatusCode : ${response.statusCode}");
    }
  }
}

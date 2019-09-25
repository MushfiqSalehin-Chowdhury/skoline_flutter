import 'dart:convert';
import 'package:skoline/responseData/KlassesResponse.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

final String baseUrl = 'http://18.136.124.102/api/v1/';
final String RootbaseUrl = 'http://18.136.124.102';


//For Profile
Future<UserResponse> getUser(String endPoint, String token) async {

  return http.get(baseUrl + endPoint, headers: {'token': token}).then((http.Response response) {

    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return UserResponse.fromJson(json.decode(response.body));
  });
}

//For Classes
Future<KlassesResponse> getKlasses(String endPoint, String token) async {

  return http.get(baseUrl + endPoint, headers: {'token': token}).then((http.Response response) {

    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return KlassesResponse.fromJson(json.decode(response.body));
  });
}

//For login
Future<LogInResponse> getToken(String endPoint, {Map body}) async {
  return http.post(baseUrl + endPoint, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return LogInResponse.fromJson(json.decode(response.body));
  });
}

import 'dart:convert';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

final String url = 'http://18.136.124.102/api/v1/users/';

Future<UserResponse> getUser(String endPoint, String token) async {

  return http.get(url + endPoint, headers: {'token': token}).then((http.Response response) {

    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return UserResponse.fromJson(json.decode(response.body));
  });
}

Future<LogInResponse> getToken(String endPoint, {Map body}) async {
  return http.post(url + endPoint, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return LogInResponse.fromJson(json.decode(response.body));
  });
}

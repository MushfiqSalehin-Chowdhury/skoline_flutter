import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


final String url ='http://18.136.124.102/api/v1/users/';


Future<UserResponse> getUser(String endPoint,String token) async {
  final response = await http.get( url+endPoint,
    headers: {'token': token},
  );

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(response.statusCode);
    return UserResponse.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}



Future <LogInResponse> getToken (String endPoint,String name,String dob) async {  // set up POST request arguments


  Map <String,String> map = {"unique_name": name, "date_of_birth": dob};



  // make POST request
  Response response = await post(url+endPoint, body: map);


  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(response.statusCode);
    return LogInResponse.fromJson(json.decode(response.body));

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post'+response.statusCode.toString());
  }

}
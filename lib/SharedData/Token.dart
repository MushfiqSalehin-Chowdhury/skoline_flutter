import 'dart:core';

import 'package:flutter/material.dart';

class Token {
   String _token = "";

  String get getToken => _token;

  void setToken(String token) {
    _token = token;
  }

}
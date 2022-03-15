import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:trii_examen_ep/src/models/jwt.dart';

class AuthService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  var headers = {
    'Authorization': 'Basic ZWplcmNpdG86ZWplcmNpdG8=',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  Future<bool> login(String email, String password) async {
    var url = http.Request(
        'POST', Uri.parse('https://rickandmortyapi.com/api/character'));

    debugPrint(url.toString());
    url.bodyFields = {
      'username': email,
      'password': password,
      'grant_type': 'password'
    };
    bool confirmacion;

    if (email == 'sanchez' && password == '123456') {
      confirmacion = true;
    } else {
      confirmacion = false;
    }

/*
    url.headers.addAll(headers);
    http.StreamedResponse response = await url.send();

    if (response.statusCode == 200) {
      String jwtToken = await response.stream.bytesToString();

      JwtToken jwt = JwtToken.fromJson(jsonDecode(jwtToken));

      final Map<String, dynamic> decodedResp = Jwt.parseJwt(jwt.access_token);

      await storage.write(
          key: 'access_token', value: decodedResp['access_token']);

      confirmacion = true;
    } else {
      debugPrint(await response.stream.bytesToString());
      confirmacion = false;
    }*/
    return confirmacion;
  }

  Future logout() async {
    await storage.delete(key: 'access_token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'access_token') ?? '';
  }

  Future<String> deleteAll() async {
    return await storage.read(key: 'access_token') ?? '';
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final storage = FlutterSecureStorage();

  Future loginUser(context) async {
    print("salut tout le monde");
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';
    // Delete all
    //     await storage.deleteAll();
    String? value = await storage.read(key: 'jwt');
    // print(value);
    var response = await client.post(Uri.https(url, 'fr/login-method'), body: {
      "username": emailController.text,
      "password": passController.text
    });

    var result = json.decode(response.body);

    print(result);

    if (response.statusCode == 200 && result["status"] == 1) {
      var loginArray = json.decode(response.body);
      if (value == null) {
        token(storage, result['token'], loginArray['username']);
      } else {
        print("Token exist");
      }
      // print(loginArray);

      final logged = await SharedPreferences.getInstance();
      logged.setBool("isLoggedIn", true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    } else {
      final logged = await SharedPreferences.getInstance();
      logged.setBool("isLoggedIn", false);
      await storage.deleteAll();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
      // navigateToNextPage(context, const LoginPage(), widget);
      // print(response.body);
    }
  }

  static void token(storage, data, username) async {
    await storage.write(key: 'jwt', value: data);
    await storage.write(key: 'username', value: username);
    print(username);

    // Read value
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
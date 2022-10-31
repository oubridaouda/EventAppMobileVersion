import 'dart:convert';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();


  String modalTitle = "";
  String modalMessage = "";
  bool openModal= false;
  bool modalStatus= false;

  // Create storage
  final storage = FlutterSecureStorage();

  Future createUser(context, widget) async {
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';

    var response = await client.post(Uri.https(url, 'fr/sign-up-method'), body: {
      "firstname": firstNameController.text,
      "lastname": lastNameController.text,
      "username": emailController.text,
      "password": passController.text,
      "recaptchaType" : "v2"
    });
    var result = json.decode(response.body);

    if (response.statusCode == 200 && result['status'] == 1) {
      //Create new token
      openModal = false;
      modalTitle = "";
      modalMessage = "";
      token(storage, result['token'], result['username']);
// Write value
      String? value = await storage.read(key: 'jwt');
      final logged = await SharedPreferences.getInstance();
      logged.setBool("isLoggedIn", true);
      Navigator.of(context).pushReplacementNamed("/");
      print(value);
    } else {
      openModal = true;
      modalTitle = result["title"];
      modalMessage = result["message"];
      print(response.body);
    }
  }

  static void token(storage, data, username) async {
    await storage.write(key: 'jwt', value: data);
    await storage.write(key: 'username', value: username);
    // Read value
  }
}

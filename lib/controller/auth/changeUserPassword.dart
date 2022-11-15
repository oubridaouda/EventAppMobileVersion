import 'dart:convert';
import 'dart:io';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeUserPassword {

  String modalTitle = "";
  String modalMessage = "";
  bool openModal = false;
  bool modalStatus = false;
  Future createNewUserPassword(
      context, password, newPassword, passwordConfirm) async {

    const storage = FlutterSecureStorage();

    print("Mon debug dans login controller");
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    // Delete all
    //     await storage.deleteAll();
    String? value = await storage.read(key: 'jwt');
    print("password $password");
    print("newPassword $newPassword");
    print("passwordConfirm $passwordConfirm");
    print("token $value");
    var response = await client.post(Uri.https(url, 'en/change-my-password'), body: {
      "password": password,
      "newPassword": newPassword,
      "passwordConfirm": passwordConfirm,
      "platform": "Mobile",
      "YourToken": "none",
      "recaptchaType": "v2"
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    var result = json.decode(response.body);

    print(result);

    if (response.statusCode == 200 && result["status"] == 1) {
      openModal = true;
      modalStatus = true;
      // print(result);
      modalTitle = result["title"];
      modalMessage = result["message"];
      print(result);
      // final logged = await SharedPreferences.getInstance();
      // logged.setBool("isLoggedIn", true);
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    } else {
      openModal = true;
      modalStatus = false;
      modalTitle = result["title"];
      modalMessage = result["message"];
    }
  }

}

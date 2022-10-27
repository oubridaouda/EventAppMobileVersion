import 'dart:convert';
import 'dart:io';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordController extends State<LoginPage> {
  var emailController = TextEditingController();
  final storage = FlutterSecureStorage();
  String modalTitle = "";
  String modalMessage = "";
  bool openModal= false;
  bool modalStatus= false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future resetUserPassword(context) async {
    print("Mon debug dans login controller");
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';
    // Delete all
    //     await storage.deleteAll();
    String? value = await storage.read(key: 'jwt');
    // print(value);
    var response = await client.post(Uri.https(url, 'fr/reset-password-method'), body: {
      "username": emailController.text,
      "recaptchaType" : "v2"
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
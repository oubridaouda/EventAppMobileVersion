import 'dart:convert';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Google signIn package initialize in var
final GoogleSignIn _googleSignIn = GoogleSignIn();

class AuthController extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  String modalTitle = "";
  String modalMessage = "";
  bool openModal = false;
  bool modalStatus = false;
  final storage = FlutterSecureStorage();
  String _token = 'Click the below button to generate token';
  bool badgeVisible = true;


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> googleSignIn(context) async {
      var client = http.Client();
      const url = 'www.auth.e.kossyam.com';
      //This method signIn user and get her information
      final user = await _googleSignIn.signIn();

      //Store the user data in local secure storage
      final logged = await SharedPreferences.getInstance();
      logged.setBool("isLoggedIn", true);
      logged.setString("username", user!.displayName!);
      logged.setString("email", user.email);

      print("google user : $user");

      var response = await client.post(Uri.https(url, 'fr/create-google-or-facebook-user'), body: {
        "email": user.email,
        "name": user.displayName,
        "password": user.id,
      });

      print("response body ${response.body}");

      var result = json.decode(response.body);

      if (response.statusCode == 200 && result['status'] == 1) {

        storeUserSecureInformation(storage, result['token'], result['username'],result['email']);
        // Write value
        String? value = await storage.read(key: 'jwt');
        final logged = await SharedPreferences.getInstance();
        logged.setBool("isLoggedIn", true);

        print("token $value");
      }
        //return home page if sign in successfully
      Navigator.of(context).pushReplacementNamed("/");


      print("username ${user}");
  }

  Future loginFacebook(context) async{
    final LoginResult result = await FacebookAuth.instance.login();
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';

    if(result.status == LoginStatus.success){
      final accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();

      print("Mes données $userData");

      final logged = await SharedPreferences.getInstance();
      //if singin succesfully pass isLoggedIn to true
      logged.setBool("isLoggedIn", true);

      var response = await client.post(Uri.https(url, 'fr/create-google-or-facebook-user'), body: {
        "email": userData["email"],
        "name": userData['name'],
        "password": userData['id'],
      });

      print("response body ${response.body}");

      var jsonDecode = json.decode(response.body);

      if (response.statusCode == 200 && jsonDecode['status'] == 1) {

        storeUserSecureInformation(storage, jsonDecode['token'], jsonDecode['username'],jsonDecode['email']);
        // Write value
        String? value = await storage.read(key: 'jwt');
        final logged = await SharedPreferences.getInstance();
        logged.setBool("isLoggedIn", true);

        print("token $value");
      }

      Navigator.of(context).pushReplacementNamed("/");
    }else{
      print(result.status);
      print(result.message);
    }
  }

  //Classic authentication with internal DuckEvent api
  Future loginUser(context) async {
    //Use http package to do api call request
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';

    String? value = await storage.read(key: 'jwt');
    // print(value);
    //Do request to login user
    var response = await client.post(Uri.https(url, 'fr/login-method'), body: {
      "username": emailController.text,
      "password": passController.text,
      "recaptchaType": "v2"
    });

    var result = json.decode(response.body);
    //If request success we save user data in secure to storage and open home page
    if (response.statusCode == 200 && result["status"] == 1) {
      var loginArray = json.decode(response.body);
      openModal = false;
      modalTitle = "";
      modalMessage = "";

      if (value == null) {
        storeUserSecureInformation(storage, result['token'], loginArray['username'], result['email']);
      } else {
        print(_token);
      }
      // print(loginArray);
      final logged = await SharedPreferences.getInstance();
      //if singin succesfully pass isLoggedIn to true
      logged.setBool("isLoggedIn", true);
      Navigator.of(context).pushReplacementNamed("/");
    }
    //If request was failed we display modal with error message
    else {
      final logged = await SharedPreferences.getInstance();
      //if singin failed pass isLoggedIn to false
      logged.setBool("isLoggedIn", false);
      await storage.deleteAll();
      openModal = true;
      modalTitle = result["title"];
      modalMessage = result["message"];
    }
  }

  //Save user data in secure storage
  static void storeUserSecureInformation(storage, data, username, email) async {
    await storage.write(key: 'jwt', value: data);
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'email', value: email);
    print(username);
    // Read value
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

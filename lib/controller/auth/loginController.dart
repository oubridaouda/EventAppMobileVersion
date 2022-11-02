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
  Map<String,dynamic>? _userData;
  AccessToken? _accessToken;


  // Platform messages are asynchronous, so we initialize in an async method.

  Future<void> googleSignIn(context) async {
    try {
      //This method signIn user and get her information
      final user = await _googleSignIn.signIn();

      //Store the user data in local sercure storage
      final logged = await SharedPreferences.getInstance();
      logged.setBool("isLoggedIn", true);
      logged.setString("username", user!.displayName!);
      logged.setString("email", user.email);

      //return home page if sign in successfully
      Navigator.of(context).pushReplacementNamed("/");


      print("username ${user}");
    } catch (e) {
      print("Error Sign In $e");
    }
  }

  Future facebookSign(context) async{
    final accessToken = await FacebookAuth.instance.accessToken;

    if(_accessToken != null){
      print(accessToken?.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      _userData = userData;
    }else{
      loginFacebook(context);
    }
  }

  Future loginFacebook(context) async{
    final LoginResult result = await FacebookAuth.instance.login();

    if(result.status == LoginStatus.success){
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;

      print("Mes données $_userData");

      final logged = await SharedPreferences.getInstance();
      //if singin succesfully pass isLoggedIn to true
      logged.setBool("isLoggedIn", true);
      Navigator.of(context).pushReplacementNamed("/");
    }else{
      print(result.status);
      print(result.message);
    }
  }

  facebookLogOut(context) async{
    await FacebookAuth.instance.logOut();
    final logged = await SharedPreferences.getInstance();
    //if singin succesfully pass isLoggedIn to true
    logged.setBool("isLoggedIn", false);
    _accessToken = null;
    _userData = null;
    Navigator.of(context).pushReplacementNamed("/login");
  }

  Future loginUser(context) async {
    print("Mon debug dans login controller");
    var client = http.Client();
    const url = 'www.auth.e.kossyam.com';
    // Delete all
    //     await storage.deleteAll();
    String? value = await storage.read(key: 'jwt');
    // print(value);
    var response = await client.post(Uri.https(url, 'fr/login-method'), body: {
      "username": emailController.text,
      "password": passController.text,
      "recaptchaType": "v2"
    });

    var result = json.decode(response.body);

    print(result);

    if (response.statusCode == 200 && result["status"] == 1) {
      var loginArray = json.decode(response.body);
      openModal = false;
      modalTitle = "";
      modalMessage = "";

      if (value == null) {
        storeUserSecureInformation(
            storage, result['token'], loginArray['username'], result['email']);
      } else {
        print(_token);
      }
      // print(loginArray);
      final logged = await SharedPreferences.getInstance();
      //if singin succesfully pass isLoggedIn to true
      logged.setBool("isLoggedIn", true);
      Navigator.of(context).pushReplacementNamed("/");
    } else {
      final logged = await SharedPreferences.getInstance();
      //if singin failed pass isLoggedIn to false
      logged.setBool("isLoggedIn", false);
      await storage.deleteAll();
      openModal = true;
      modalTitle = result["title"];
      modalMessage = result["message"];

      // navigateToNextPage(context, const LoginPage(), widget);
      // print(response.body);
    }
  }

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

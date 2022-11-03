import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutController {
  final storage = FlutterSecureStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> googleLogOut(context) async {
    try {
      //Disconnect current user connected
      await _googleSignIn.disconnect();
      // Delete all
      await storage.deleteAll();
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      //Remove login state
      prefs.remove("isLoggedIn");
      Navigator.of(context).pushReplacementNamed("/login");
    } catch (e) {
      print("Log out error $e");
    }
  }

  Future<void> logOutClassic(context) async {
    final logged = await SharedPreferences.getInstance();
    logged.setBool("isLoggedIn", false);
    print(storage);
    storage.deleteAll();
    Navigator.of(context).pushReplacementNamed("/login");
  }


  facebookLogOut(context) async{
    await FacebookAuth.instance.logOut();
    final logged = await SharedPreferences.getInstance();
    //if sing out successfully pass isLoggedIn to false
    logged.setBool("isLoggedIn", false);
    await storage.deleteAll();
    Navigator.of(context).pushReplacementNamed("/login");
  }

}

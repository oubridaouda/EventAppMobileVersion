import 'dart:convert';
import 'dart:io';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/controller/userProfile/UserProfileController.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonFunction {
  final storage = const FlutterSecureStorage();

  Future checkTokenValidity(context,{stopRefresh= true}) async {
    //Refresh page with provider variable
    Map userPreferences = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? token = await storage.read(key: 'jwt');
    print(token);

    //Refresh page with provider variable
    Provider.of<AllChangeNotifier>(context, listen: false)
        .pageRefresh(true);
    var response = await client.post(
        Uri.https(url, 'en/check-your-auth-token-status'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        });

    var responseDecoded = json.decode(response.body);

    if(response.statusCode == 200 && responseDecoded["status"] == 1){
      print("succes message: $responseDecoded");
      //Refresh page with provider variable
      Provider.of<AllChangeNotifier>(context, listen: false)
          .pageRefresh(false);
    }else if(responseDecoded["status"] != 1){
      print("failed message: $responseDecoded");
      // Logout user if token expired
      await LogOutController().logOut(context);
      // exit(HttpStatus.networkAuthenticationRequired);
    }
    stopRefresh ? Provider.of<AllChangeNotifier>(context, listen: false)
        .pageRefresh(false) : null;
  }

  Future checkUserAuthValidity(context) async{
    checkTokenValidity(context,stopRefresh: false);
    UserProfileController().checkIfEmailIsValidateOrNot(context);

  }
}


import 'dart:convert';
import 'dart:io';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/commonFunction/commonFunction.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserProfileController{
  final storage = const FlutterSecureStorage();
  dynamic saveThemeMode;
  var userData = {};

  Future userProfileData(context) async {
    var tokenStatus = await CommonFunction().checkTokenValidity(context);
    //Refresh page with provider variable
    Provider.of<AllChangeNotifier>(context, listen: false)
        .pageRefresh(true);

    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);
    var response = await client
        .post(Uri.https(url, 'en/organiser-profile-view-mobile'), body: {
      "email": username,
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      userData = json.decode(response.body);
      // print(loginArray);
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }
    Provider.of<AllChangeNotifier>(context, listen: false)
        .sendUserData(userData);

    Provider.of<AllChangeNotifier>(context, listen: false)
        .changePage(DrawerSection.profileView);

    return userData;
  }
}
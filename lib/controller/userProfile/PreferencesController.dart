import 'dart:convert';
import 'dart:io';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class PreferencesController{
  final storage = const FlutterSecureStorage();

  Future updateUserPreferences(context,id,preferenceValue, String type) async {
    //Refresh page with provider variable
    Map userPreferences = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);
    var response = await client
        .post(Uri.https(url, 'en/update-email-preferences-or-privacy-setting'), body: {
      "id": id,
      "type": type,
      "platform": "Mobile",
      "value": preferenceValue,
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      // print(loginArray);
      userPreferences = jsonDecode(response.body);
      print("all user data preferences ${userPreferences["data"]}");
      //Init context we use toast
      ToastContext().init(context);
      //Toast show message
      Toast.show("Your email preferences are changed",duration: Toast.lengthLong, gravity: Toast.bottom);
      userPreferences = jsonDecode(response.body);
      Provider.of<AllChangeNotifier>(context, listen: false)
          .sendUserPreferences(userPreferences);
    } else {
      print("error response : ${response.body}");
    }
  }

  Future getAllUserPreferences(context) async {
    //Refresh page with provider variable
    Map userPreferences ={};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);
    var response = await client
        .post(Uri.https(url, 'en/user-all-preferences'), body: {
      "email": username,
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      // print(loginArray);
      userPreferences = jsonDecode(response.body);
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }

    Provider.of<AllChangeNotifier>(context, listen: false)
        .sendUserPreferences(userPreferences);


    Provider.of<AllChangeNotifier>(context, listen: false)
        .pageRefresh(false);
    //
    // Provider.of<AllChangeNotifier>(context, listen: false)
    //     .pageRefresh(false);
    //
    // Provider.of<AllChangeNotifier>(context, listen: false)
    //     .changePage(DrawerSection.profileView);
  }

}
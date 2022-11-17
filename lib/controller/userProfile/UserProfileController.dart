import 'dart:convert';
import 'dart:io';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/commonFunction/commonFunction.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserProfileController {
  final storage = const FlutterSecureStorage();
  dynamic saveThemeMode;
  var userData = {};


  Future userProfileData(context) async {
    final provider = Provider.of<AllChangeNotifier>(context,listen: false);

    var tokenStatus = await CommonFunction().checkTokenValidity(context);
    //Refresh page with provider variable
    Provider.of<AllChangeNotifier>(context, listen: false).pageRefresh(true);

    //Do request to put image in to database
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

    //Initialize profile var image to empty if var does not empty
    provider.uploadImage("", "");

    //Initialize user data
    provider.sendUserData(userData);

    //Switche to profile view
    provider.changePage(DrawerSection.profileView);

    return userData;
  }

  Future addUserProfileImage(context, File image, imagePath,String imageType) async {
    //Refresh page with provider variable
    final provider = Provider.of<AllChangeNotifier>(context,listen: false);

    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);

    var request =
        http.MultipartRequest("POST", Uri.https(url, 'en/upload-avatar-image'));
    request.fields['imageType'] = imageType;
    request.fields['platform'] = "Mobile";
    request.headers['Authorization'] = "Bearer $value";

    var picture = http.MultipartFile.fromBytes(
        "image",
        File(imagePath).readAsBytesSync(),
        filename: "avatar-img-${DateTime.now().millisecondsSinceEpoch}.jpg");

    print("$imagePath my image send to database ${Image.file(File(imagePath))}");

    request.files.add(picture);

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var result = String.fromCharCodes(responseData);

    print(result);
    if (response.statusCode == 200) {
      userData = json.decode(result);
      // print(loginArray);
      imageType == "avatar" ?
      provider.uploadImage(userData["data"]["image"], "default") : provider.uploadImage("default", userData["data"]["image"]);
      print("image data ${userData["data"]["image"]}");
    } else {
      print("error response : ${result}");
    }
  }
}

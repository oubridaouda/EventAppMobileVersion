import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/commonFunction/commonFunction.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserProfileController {
  final storage = const FlutterSecureStorage();
  dynamic saveThemeMode;
  var userData = {};
  var userSocialNetworkAndAddress = {};

  Future userProfileData(context) async {
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);

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

    Map network = jsonDecode(userData["data"]["socialNetworks"]);
    network["website"] = userData["data"]["website"];
    provider.changeUserSocialNetwork(network);

    //Switche to profile view
    provider.changePage(DrawerSection.profileView);

    return userData;
  }

  Future<void> userSocialNetworkAndAddressesList(context) async {
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);

    //Do request to put image in to database
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);
    var response = await client
        .post(Uri.https(url, 'en/user-social-network-and-address'), body: {
      "email": username,
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      userSocialNetworkAndAddress = json.decode(response.body);
      // print(loginArray);
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }

    //Initialize user address information
    provider.changeUserAddress(jsonDecode(userSocialNetworkAndAddress["data"]["addresses"]));

    //Initialize user social network
    provider.changeUserSocialNetwork(userSocialNetworkAndAddress["data"]);

  }

  Future addUserProfileImage(
      context, File image, imagePath, String imageType) async {
    //Refresh page with provider variable
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);

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
        "image", File(imagePath).readAsBytesSync(),
        filename: "avatar-img-${DateTime.now().millisecondsSinceEpoch}.jpg");

    print(
        "$imagePath my image send to database ${Image.file(File(imagePath))}");

    request.files.add(picture);

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var result = String.fromCharCodes(responseData);

    print(result);
    if (response.statusCode == 200) {
      userData = json.decode(result);
      // print(loginArray);
      imageType == "avatar"
          ? provider.uploadImage(userData["data"]["image"], "default")
          : provider.uploadImage("default", userData["data"]["image"]);

      imageType == "avatar"
          ? provider.profileAvatarImg(userData["data"]["image"])
          : null;
      print("image data ${userData["data"]["image"]}");
    } else {
      print("error response : ${result}");
    }
  }

  Future getProfileImage(context) async {
    //Do request to put image in to database
    const storage = FlutterSecureStorage();
    bool isSend = false;
    var userImage = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    var response =
        await client.post(Uri.https(url, 'en/get-user-profile-image'), body: {
      "platform": "Mobile",
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      userImage = json.decode(response.body);
      // print(loginArray);
      Provider.of<AllChangeNotifier>(context, listen: false)
          .profileAvatarImg(userImage['data']["image"]);
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }
  }

  Future sentEmailConfirmation(context) async {
    //Do request to put image in to database
    Navigator.of(context).pop();
    Provider.of<AllChangeNotifier>(context, listen: false).pageRefresh(true);
    var emailResponse = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    var response = await client
        .post(Uri.https(url, 'en/send-email-address-confirmation'), body: {
      "platform": "Mobile",
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });
    emailResponse = json.decode(response.body);
    print(emailResponse);
    emailResponse["status"] == 1
        ? CoolAlert.show(
            title: "Success!",
            backgroundColor: Colors.white,
            context: context,
            type: CoolAlertType.success,
            text: "A verification email has sent to your email address.!",
            confirmBtnColor: appColor.dGreen,
          )
        : null;
    Provider.of<AllChangeNotifier>(context, listen: false).pageRefresh(false);
  }

  Future checkIfEmailIsValidateOrNot(context) async{
//Do request to put image in to database
    const storage = FlutterSecureStorage();
    bool isSend = false;
    var emailStatus = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    var response =
        await client.post(Uri.https(url, 'en/email-address-is-valide-or-not'), body: {
      "platform": "Mobile",
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      emailStatus = json.decode(response.body);
      print("le type de la var: ${emailStatus['data'].isNotEmpty }");
      emailStatus['data'].isNotEmpty && emailStatus['data']["mailStatus"] == "0"
          ? CoolAlert.show(
        title: "Email not verified !",
        backgroundColor: Colors.white,
        context: context,
        type: CoolAlertType.error,
        barrierDismissible: false,
        text:
        "Check your email and click to the link button to active your account.!",
        confirmBtnText: "Sent verification email",
        onCancelBtnTap: () {
          print("Je click sur on cancel btn");
        },
        onConfirmBtnTap: () async {
          await sentEmailConfirmation(context);
          // isSend = false;
          print("Je click sur on confirm $isSend");
        },
        confirmBtnColor: appColor.dGreen,
      )
          : null;
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }
  }
}
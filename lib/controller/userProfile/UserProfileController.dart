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
import 'package:toast/toast.dart';

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
    try {
      print(username);
      var response =
          await client.post(Uri.https(url, 'en/profile-view-on-mobile'), body: {
        "email": username,
      }, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $value',
      });

      if (response.statusCode == 200) {
        userData = json.decode(response.body);

        //Initialize profile var image to empty if var does not empty
        provider.uploadImage("", "");
        //Initialize user data
        provider.sendUserData(userData);
        //Switche to profile view
        provider.changePage(DrawerSection.profileView);
        // print(loginArray);
        print(response.body);
      } else {
        provider.changePage(DrawerSection.dashboard);
        print("error response : ${response.body}");
      }
    } catch (e) {
      print("UserProfileController::userProfileData $e");
    }

    return userData;
  }

  Future userProfileInformation(context) async {
    //Check token validity
    await CommonFunction()
        .checkTokenValidity(context, stopRefresh: false, refresh: true);
    //Refresh page with provider variable
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);
    provider.pageRefresh(true);
    // refresh? Provider.of<AllChangeNotifier>(context, listen: false).pageRefresh(true): null;

    //Do request to put image in to database
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);

    try {
      var response =
          await client.post(Uri.https(url, 'en/my-profile-information'), body: {
        "email": username,
      }, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $value',
      });

      if (response.statusCode == 200) {
        userData = json.decode(response.body);

        userData['data'].isNotEmpty && userData['data']["mailStatus"] == "0"
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
                },
                confirmBtnColor: appColor.dGreen,
              )
            : null;
        // print(loginArray);
        print(response.body);
      } else {
        print(
            "UserProfileController::userProfileInformation error response : ${response.body}");
      }

      Map network = jsonDecode(userData["data"]["socialNetworks"]);
      network["website"] = userData["data"]["website"];
      provider.changeUserSocialNetwork(network);
    } catch (e) {
      print("UserProfileController::userProfileInformation  $e");
    }
    provider.pageRefresh(false);
  }

  Future<void> userSocialNetworkAndAddressesList(context) async {
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);

    //Do request to put image in to database
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);
    try {
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
      provider.changeUserAddress(
          jsonDecode(userSocialNetworkAndAddress["data"]["addresses"]));

      //Initialize user social network
      provider.changeUserSocialNetwork(userSocialNetworkAndAddress["data"]);
    } catch (e) {
      print("UserProfileController::userSocialNetworkAndAddressesList  $e");
    }
  }

  Future addUserProfileImage(context, File image, imagePath, String imageType) async {
    //Refresh page with provider variable
    final provider = Provider.of<AllChangeNotifier>(context, listen: false);

    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    print(username);

    try {
      var request = http.MultipartRequest(
          "POST", Uri.https(url, 'en/upload-avatar-image'));
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

        ToastContext().init(context);
        //Toast show message
        Toast.show(userData["message"],
            duration: Toast.lengthLong, gravity: Toast.bottom);
        print("image data ${userData["data"]["image"]}");

      } else {

        userData = json.decode(result);
        ToastContext().init(context);
        //Toast show message
        Toast.show(userData["message"],
            duration: Toast.lengthLong, gravity: Toast.bottom);
        print("error response : ${result}");
      }
    } catch (e) {
      print("UserProfileController::addUserProfileImage $e");
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
    try {
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
    } catch (e) {
      print("UserProfileController::getProfileImage  $e");
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
    try {
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
    } catch (e) {
      print("UserProfileController::sentEmailConfirmation  $e");
    }
    Provider.of<AllChangeNotifier>(context, listen: false).pageRefresh(false);
  }

  Future checkIfEmailIsValidateOrNot(context) async {
//Do request to put image in to database
    const storage = FlutterSecureStorage();
    bool isSend = false;
    var emailStatus = {};
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    try {
      var response = await client
          .post(Uri.https(url, 'en/email-address-is-valide-or-not'), body: {
        "platform": "Mobile",
      }, headers: {
        HttpHeaders.authorizationHeader: 'Bearer $value',
      });

      if (response.statusCode == 200) {
        emailStatus = json.decode(response.body);
        print("le type de la var: ${emailStatus['data'].isNotEmpty}");
        emailStatus['data'].isNotEmpty &&
                emailStatus['data']["mailStatus"] == "0"
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
    } catch (e) {
      print("UserProfileController::userSocialNetworkAndAddressesList  $e");
    }
  }
}

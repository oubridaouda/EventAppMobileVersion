import 'dart:convert';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/userProfile/EditProfileFormController.dart';
import 'package:event_mobile_app/controller/userProfile/UserProfileController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfileForm extends StatefulWidget {
  Map userData;

  EditProfileForm({Key? key, required this.userData}) : super(key: key);

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  bool change = false;
  final List<String> countryListType = [
    "Burkina Faso",
    "Mali",
    "Niger",
    'Ghana',
    "Cote d'Ivoire",
    'Nigeria',
    'Togo',
    'Bénin'
  ];
  String? selectEventType;
  String? selectCity;

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var facebookController = TextEditingController();
  var instagramController = TextEditingController();
  var twitterController = TextEditingController();
  var linkedInController = TextEditingController();
  var youtubeController = TextEditingController();
  var addressController = TextEditingController();
  var secondAddressController = TextEditingController();
  var countryController = TextEditingController();
  var stateController = TextEditingController();
  var cityController = TextEditingController();
  var zipController = TextEditingController();
  var bioController = TextEditingController();
  var webSiteController = TextEditingController();
  var usernameController = TextEditingController();

  final storage = const FlutterSecureStorage();
  var userInfo ={};

  Future userProfileEdit(
      email,
       phone,
       facebook,
       instagram,
       twitter,
       linkedIn,
       youtube,
       webSite,
       address,
       secondAddress,
       country,
       state,
       city,
       zip,
       bio,
       name,
      ) async {
    var client = http.Client();
    const url = 'www.e.kossyam.com';
    String? value = await storage.read(key: 'jwt');
    String? username = await storage.read(key: 'username');
    var response = await client
        .post(Uri.https(url, 'en/edit-user-profile-mobile'), body: {
      "email": email,
      "phone": phone,
      "facebook": facebook,
      "instagram": instagram,
      "twitter": twitter,
      "linkedIn": linkedIn,
      "youtube": youtube,
      "webSite": webSite,
      "address": address,
      "secondAddress": secondAddress,
      "country": country,
      "state": state,
      "city": city,
      "zip": zip,
      "bio": bio,
      "username": name,
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
    });

    if (response.statusCode == 200) {
      userInfo = json.decode(response.body);
      // print(loginArray);
      print(response.body);
    } else {
      print("error response : ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Map userInfo = Provider.of<AllChangeNotifier>(context).userData;
    Map user = userInfo["data"];
    Map socialMedia = jsonDecode(userInfo['data']['socialNetworks']);
    Map userAddresses = jsonDecode(userInfo['data']["addresses"]);

    emailController.text = user['email'] ?? "";
    phoneController.text = user['phone'] ?? "";
    facebookController.text = socialMedia['facebook'] ?? "";
    instagramController.text = socialMedia['instagram'] ?? "";
    twitterController.text = socialMedia['twitter'] ?? "";
    linkedInController.text = socialMedia['linkedIn'] ?? "";
    youtubeController.text = socialMedia['youtube'] ?? "";
    addressController.text = userAddresses['address'] ?? "";
    secondAddressController.text = userAddresses['secondAddress'] ?? "";
    countryController.text = userAddresses['country'] ?? "";
    stateController.text = userAddresses['state'] ?? "";
    cityController.text = userAddresses['city'] ?? "";
    zipController.text = userAddresses['zip'] ?? "";
    bioController.text = user['bio'] ?? "";
    usernameController.text = user['username'] ?? "";
    webSiteController.text = user['webSite'] ?? "";

    print("form data : $user");
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        shadowColor: lightColor.snowDriftColor,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              SizedBox(
                width: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        darkMode ? darkColor.dGreen : lightColor.snowDriftColor,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 15,
                        color: lightColor.dGrey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        backgroundColor: lightColor.dWhite,
        title: Text(
          "Edit Details",
          style: TextStyle(
              color: darkMode ? darkColor.dBlack : lightColor.dBlack,
              fontWeight: FontWeight.w500,
              fontSize: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 0, right: 30, left: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Name*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: usernameController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: lightColor.InputBorderColor,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Bio*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: bioController,
                maxLines: 4,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: lightColor.InputBorderColor,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Email*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                enabled: false,
                controller: emailController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Phone*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: phoneController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Website*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: webSiteController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Facebook*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: facebookController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Instagram*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: instagramController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Twitter*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: twitterController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Linkedin*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller:
                    linkedInController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Youtube*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: youtubeController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Address",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 13.0,
              ),
              Divider(
                thickness: 2,
                color: lightColor.dBackgroud,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Address 1*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller:
                    addressController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Address 2*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller:
                    secondAddressController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Country*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    showSelectedItems: true,
                    menuProps: MenuProps()),
                items: countryListType,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    // labelText: "Menu mode",
                    labelStyle: const TextStyle(color: Colors.blue),
                    hintText: "Select your country",
                    filled: true,
                    fillColor:
                        darkMode ? darkColor.InputColor : lightColor.InputColor,
                    enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                onChanged: ((value) {
                  print(value);
                  selectEventType = value;
                }),
                selectedItem: userAddresses["country"],
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "State*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: stateController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "City/Suburb*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: cityController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "Zip/Post Code*",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: zipController,
                style: TextStyle(
                    color: darkMode ? lightColor.dWhite : darkColor.dWhite),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      darkMode ? darkColor.InputColor : lightColor.InputColor,
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: darkMode
                            ? darkColor.InputColor
                            : lightColor.InputBorderColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      borderSide: BorderSide(
                        color: lightColor.InputBorderColor,
                      )),
                  errorBorder: const OutlineInputBorder(
                    //Outline border type for TextFeild
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                            darkMode ? darkColor.dWhite : lightColor.dWhite,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: lightColor.dBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor:
                            darkMode ? darkColor.dGreen : lightColor.dGreen,
                      ),
                      onPressed: () async {
                        print("bio ${bioController.text}");
                        setState((){
                          change = true;
                        });
                        await userProfileEdit(
                          emailController.value.text,
                          phoneController.value.text,
                          facebookController.value.text,
                          instagramController.value.text,
                          twitterController.value.text,
                          linkedInController.value.text,
                          youtubeController.value.text,
                          webSiteController.value.text,
                          addressController.value.text,
                          secondAddressController.value.text,
                          countryController.value.text,
                          stateController.value.text,
                          cityController.value.text,
                          zipController.value.text,
                          bioController.value.text,
                          usernameController.value.text,
                        );

                        await UserProfileController().userProfileData(context);

                        setState((){
                          change = false;
                        });

                        Navigator.of(context).pop();
                        print("success");
                      },
                      child: change
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(color: Colors.white),
                        ],
                      )
                          :Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Update",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

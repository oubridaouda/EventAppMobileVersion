import 'dart:convert';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/controller/auth/loginController.dart';
import 'package:event_mobile_app/controller/commonFunction/commonFunction.dart';
import 'package:event_mobile_app/controller/userProfile/PreferencesController.dart';
import 'package:event_mobile_app/controller/userProfile/UserProfileController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileView.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  // you can replace 100 to whatever value you wish to use

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MyAppBarState extends State<MyAppBar> {
  final storage = const FlutterSecureStorage();
  dynamic saveThemeMode;
  var userData = {};
  CommonFunction common = CommonFunction();

  @override
  void initState() {
    super.initState();
    print("theme actu $darkMode}");
  }

  Future<String?> _avatar() async{
    String? value = await storage.read(key: 'avatar');
    return value;
  }

  @override
  Widget build(BuildContext context) {
    var avatarImg = Provider.of<AllChangeNotifier>(context).avatar;

    return AppBar(
      elevation: 0,
      backgroundColor: darkMode ? darkColor.dWhite : lightColor.dWhite,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: darkMode
                ? darkColor.forthBackground
                : darkColor.forthBackground,
            size: 20,
          ),
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: GestureDetector(
            onTap: () {
              common.checkTokenValidity(context);
              Provider.of<AllChangeNotifier>(context, listen: false)
                  .changePage(DrawerSection.dashboard);
            },
            child: Image.asset(
              "assets/images/fav.png",
            ),
          ),
        ),
      ]),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                width: 55,
                child: MaterialButton(
                  elevation: 0,
                  height: 40,
                  color: darkMode ? darkColor.dGreen : lightColor.dGreen,
                  onPressed: () async {},
                  shape: const CircleBorder(),
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              width: 55,
              child: MaterialButton(
                elevation: 0,
                height: 40,
                color: darkMode ? darkColor.dGreen : lightColor.dGreen,
                onPressed: () async {},
                shape: const CircleBorder(),
                child: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            GestureDetector(
                onTap: () async{
                  userData = await UserProfileController().userProfileData(context);
                  await PreferencesController().getAllUserPreferences(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return ProfileView();
                  // }));
                },
                child:  CircleAvatar(
                  backgroundImage: NetworkImage(avatarImg),

                )),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
      ],
      centerTitle: true,
    );
  }
}

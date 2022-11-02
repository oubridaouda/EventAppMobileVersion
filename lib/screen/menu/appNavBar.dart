import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/controller/auth/loginController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
    print("theme actu ${saveThemeMode.toString()}");
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    saveThemeMode = await AdaptiveTheme.getThemeMode();
    dynamic iconAddress;

    final shareStorage = await SharedPreferences.getInstance();

    darkMode = shareStorage.getBool("darkmode")!;

    // if ( saveThemeMode.toString() == "AdaptiveThemeMode.dark") {
  }

  Future changeCurrentTheme() async {
    final shareStorage = await SharedPreferences.getInstance();

    saveThemeMode = await AdaptiveTheme.getThemeMode();
    dynamic iconAddress;

    if (darkMode) {
      print("thème claire cool");

      setState(() {
        darkMode = false;
        AdaptiveTheme.of(context).setLight();
        shareStorage.setBool("darkmode", false);
      });
    } else {
      print("thème sombre cool");
      setState(() {
        darkMode = true;
        AdaptiveTheme.of(context).setDark();
        shareStorage.setBool("darkmode", true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: darkMode ? darkColor.dWhite : lightColor.dWhite,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          icon:  Icon(
            Icons.menu,
            color: darkMode ? Colors.white : Colors.black,
            size: 20,
          ),
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Image.asset(
            "assets/images/fav.png",
          ),
        ),
      ]),
      actions: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  //Google logout
                  LogOutController().googleLogOut(context);

                  //Classic log out
                  LogOutController().logOutClassic(context);

                  //Facebook logout
                  AuthController().facebookLogOut(context);
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile-imgs/img-13.jpg",
                  ),
                )),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Stack(children: [
            MaterialButton(
              elevation: 0,
              height: 40,
              color: darkMode ? darkColor.btnColor : lightColor.btnColor,
              onPressed: () async {
                changeCurrentTheme();
                Navigator.of(context).pushReplacementNamed("/");
              },
              shape: const CircleBorder(),
              child: darkMode
                  ? const FaIcon(FontAwesomeIcons.solidMoon)
                  : const FaIcon(FontAwesomeIcons.solidSun),
            )
          ]),
        )
      ],
      centerTitle: true,
    );
  }
}

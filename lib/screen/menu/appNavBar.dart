import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool darkmode = false;
  dynamic saveThemeMode;

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    saveThemeMode = await AdaptiveTheme.getThemeMode();
    dynamic iconAddress;

    if (saveThemeMode.toString() == "AdaptiveThemeMode.dark") {
      print("thème claire");

      setState(() {
        appColor.dBackgroud = const Color(0xFFE8F7F7);
        appColor.btnColor = const Color(0xFFE8F7F7);
        appColor.dWhite = const Color(0xFFFFFFFF);

        AdaptiveTheme.of(context).setLight();
        darkmode = false;
        iconAddress = Icon(Icons.shield_moon_outlined);
      });
    } else {
      print("thème sombre");
      setState(() {
        appColor.dBackgroud = const Color(0xFF111315);
        appColor.btnColor = Color(0xFF6AC045);
        appColor.dWhite = const Color(0xFF1A1D1F);
        iconAddress = Icon(Icons.sunny);
        AdaptiveTheme.of(context).setDark();
        darkmode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appColor.dWhite,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
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
              color: appColor.btnColor,
              onPressed: () {
                getCurrentTheme();
              },
              shape: const CircleBorder(),
              child: darkmode
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

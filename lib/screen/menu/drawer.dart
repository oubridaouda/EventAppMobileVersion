import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/colors/colors.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/login.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NavDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final storage = const FlutterSecureStorage();

  dynamic saveThemeMode;

  Future changeCurrentTheme() async {
    final shareStorage = await SharedPreferences.getInstance();

    saveThemeMode = await AdaptiveTheme.getThemeMode();

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
    return
      Drawer(
      backgroundColor: darkMode ? darkColor.dWhite : lightColor.dWhite,
      width: 400,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: 100.0,
                        child: DrawerHeader(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                height: 50,
                                "assets/images/logo-icon.svg",
                                semanticsLabel: "DuckEvent",
                              ),
                              MaterialButton(
                                disabledElevation: 0,
                                elevation: 0,
                                height: 40,
                                minWidth: 40,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                color: darkMode
                                    ? darkColor.dBackgroud
                                    : lightColor.dBackgroud,
                                onPressed: () {
                                  widget.scaffoldKey.currentState
                                      ?.closeDrawer();
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  color: darkMode
                                      ? darkColor.dGrey
                                      : lightColor.dGrey,
                                  size: 23,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      color: darkMode
                          ? darkColor.dBackgroud
                          : lightColor.dBackgroud,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              darkMode ? darkColor.dGreen : lightColor.dGreen,
                        ),
                        onPressed: () async {
                          final logged = await SharedPreferences.getInstance();
                          logged.setBool("isLoggedIn", false);
                          print(storage);
                          storage.deleteAll();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.calendarDays,
                                color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Create Event",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Drawer Menu section
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        setState(() {
                          Provider.of<AllChangeNotifier>(context, listen: false).changePage(DrawerSection.dashboard);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.only(left: 40.0),
                        expandedAlignment: Alignment.topLeft,
                        collapsedBackgroundColor: Colors.white,
                        trailing: const Icon(Icons.arrow_drop_down),
                        title: const Text("Explore Events"),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Provider.of<AllChangeNotifier>(context, listen: false).changePage(DrawerSection.exploreEvents);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: const Text("Explore Events"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Provider.of<AllChangeNotifier>(context, listen: false).changePage(DrawerSection.venueEvent);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text("Venues Event Detail View"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Provider.of<AllChangeNotifier>(context, listen: false).changePage(DrawerSection.onlineEvent);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text("Online Event Detail View"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text('Pricing'),
                      onTap: () {},
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.only(left: 40.0),
                        expandedAlignment: Alignment.topLeft,
                        collapsedBackgroundColor: Colors.white,
                        trailing: const Icon(Icons.arrow_drop_down),
                        title: const Text("Blog"),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Our Blog"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Blog Detail View"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.only(left: 40.0),
                        expandedAlignment: Alignment.topLeft,
                        collapsedBackgroundColor: Colors.white,
                        trailing: const Icon(Icons.arrow_drop_down),
                        title: const Text("Help"),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("FAQ"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Help Center"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Contact Us"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.only(left: 40.0),
                        expandedAlignment: Alignment.topLeft,
                        collapsedBackgroundColor: Colors.white,
                        trailing: const Icon(Icons.arrow_drop_down),
                        title: const Text("Pages"),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Other Pages"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text("Create Event"),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //Drawer bottom
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(
                      bottom: 30.0, top: 30.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Follow Us",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 17.0,
                      ),
                      //Social media icon button
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: darkMode
                                  ? darkColor.dGreen
                                  : lightColor.dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dWhite
                                      : lightColor.dWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: darkMode
                                                  ? darkColor.dGreen
                                                  : lightColor.dGreen,
                                              height: 20,
                                              'assets/social/facebook.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: darkMode
                                  ? darkColor.dGreen
                                  : lightColor.dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dWhite
                                      : lightColor.dWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: darkMode
                                                  ? darkColor.dGreen
                                                  : lightColor.dGreen,
                                              height: 20,
                                              'assets/social/instagram.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: darkMode
                                  ? darkColor.dGreen
                                  : lightColor.dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dWhite
                                      : lightColor.dWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: darkMode
                                                  ? darkColor.dGreen
                                                  : lightColor.dGreen,
                                              height: 20,
                                              'assets/social/twitter.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: darkMode
                                  ? darkColor.dGreen
                                  : lightColor.dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dWhite
                                      : lightColor.dWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: darkMode
                                                  ? darkColor.dGreen
                                                  : lightColor.dGreen,
                                              height: 20,
                                              'assets/social/linkedin.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: darkMode
                                  ? darkColor.dGreen
                                  : lightColor.dGreen,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dWhite
                                      : lightColor.dWhite,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: darkMode
                                                  ? darkColor.dGreen
                                                  : lightColor.dGreen,
                                              height: 20,
                                              'assets/social/youtube.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     MaterialButton(
                //       elevation: 0,
                //       height: 40,
                //       color: darkMode ? darkColor.btnColor : lightColor
                //           .btnColor,
                //       onPressed: () async {
                //         changeCurrentTheme();
                //         Navigator.of(context).pushReplacementNamed("/");
                //       },
                //       shape: const CircleBorder(),
                //       child: darkMode
                //           ? const FaIcon(FontAwesomeIcons.solidMoon)
                //           : const FaIcon(FontAwesomeIcons.solidSun),
                //     )
                //   ],
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      "Mode nuit",
                      style: TextStyle(
                          color:
                              darkMode ? darkColor.dWhite : lightColor.dBlack),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlutterSwitch(
                      width: 55.0,
                      height: 30.0,
                      valueFontSize: 25.0,
                      toggleSize: 30.0,
                      value: darkMode,
                      borderRadius: 30.0,
                      padding: 2.0,
                      showOnOff: true,
                      activeText: "",
                      inactiveIcon: const FaIcon(FontAwesomeIcons.solidSun),
                      activeIcon: const FaIcon(FontAwesomeIcons.solidMoon),
                      activeToggleColor: lightColor.dGreen,
                      inactiveText: "",
                      activeColor: lightColor.dWhite,
                      inactiveColor: lightColor.cyanBlueColor,
                      onToggle: (val) {
                        setState(() {
                          changeCurrentTheme();
                          Navigator.of(context).pushReplacementNamed("/");
                        });
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

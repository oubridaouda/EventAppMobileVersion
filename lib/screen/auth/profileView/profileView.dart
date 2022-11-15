import 'dart:convert';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabBar.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:event_mobile_app/main.dart';
import 'package:provider/provider.dart';


class ProfileView extends StatefulWidget {

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Map userData = Provider.of<AllChangeNotifier>(context).userData;
    Map userPreferences = Provider.of<AllChangeNotifier>(context).userPreferences;
    Map socialMedia = jsonDecode(userData['data']['socialNetworks']);
    // print("my user data ${socialMedia}");
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    return  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270.0,
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 70, bottom: 80),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
                  image:  DecorationImage(
                    image: NetworkImage(userData['data']["coverImg"]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(),
              ),
              Transform.translate(
                offset: const Offset(0.0, -100.0),
                child: Container(
                  height: 600,
                  color: darkMode ? darkColor.dWhite : lightColor.dWhite,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          //User profile image section
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Profile photo image
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: CircleAvatar(
                                  radius: 135,
                                  backgroundColor: darkMode
                                      ? darkColor.dBackgroud
                                      : lightColor.dBackgroud,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      radius: 125,
                                      backgroundColor: darkMode
                                          ? darkColor.dWhite
                                          : lightColor.dWhite,
                                      child:  Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          height: 130,
                                          width: 130,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(userData['data']["avatarImg"]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Profile photo image upload button
                              Transform.translate(
                                  offset: const Offset(-45.0, 45.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircleAvatar(
                                      radius: 135,
                                      backgroundColor: darkMode
                                          ? darkColor.dGreen
                                          : lightColor.sixBackground,
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: CircleAvatar(
                                          radius: 125,
                                          backgroundColor: darkMode
                                              ? darkColor.dBlack
                                              : lightColor.dWhite,
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: SizedBox(
                                              child: FaIcon(
                                                  FontAwesomeIcons.camera,
                                                  color: Colors.black,
                                                  size: 14.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )),

                      const SizedBox(
                        height: 20.0,
                      ),
                      //User profile information section
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userData['data']['username'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: 15,
                              color: lightColor.dGreen,
                            )
                          ]),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        userData['data']['email'],
                        style: TextStyle(fontSize: 15.0),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "0",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Follower"),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: const [
                              Text(
                                "0",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Following"),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "Hey i am ${userData['data']['username']}",
                        style: TextStyle(color: lightColor.dGrey),
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            backgroundColor:
                                darkMode ? darkColor.dWhite : lightColor.dWhite,
                            elevation: 2,
                            disabledBackgroundColor: Colors.white),
                        onPressed: () async {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "My Organisation",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 10.0),
                            FaIcon(
                              FontAwesomeIcons.rightLeft,
                              color: darkMode
                                  ? darkColor.dBlack
                                  : lightColor.dBlack,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      const Text(
                        "Find me on",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(height: 25.0),
                      //Social media icon button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialMedia['facebook'] !=null?
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
                          ) : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          socialMedia['instagram'] !=null?
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
                          ) : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          socialMedia['twitter'] !=null?
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
                          ) : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          socialMedia['linkedIn'] !=null?
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
                          ) : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          socialMedia['youtube'] !=null?
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
                                              'assets/social/youtube.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) : Container(),
                          const SizedBox(
                            width: 10,
                          ),
                          socialMedia['webSite'] !=null?
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
                                          child: FaIcon(
                                        FontAwesomeIcons.globe,
                                        color: lightColor.dGreen,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0.0, -100.0),
                child:
                    //User profile Tab bar
                     ProfileTabBar(user: userData,preferences: userPreferences),
              ),
              Transform.translate(
                offset: const Offset(0.0, -100.0),
                child: ElevatedButton(
                  onPressed: () async{
                    // Google logout
                    await LogOutController().googleLogOut(context);

                    //Classic log out
                    await LogOutController().logOutClassic(context);

                    //Facebook logout
                    await LogOutController().facebookLogOut(context);

                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text("Log out"),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

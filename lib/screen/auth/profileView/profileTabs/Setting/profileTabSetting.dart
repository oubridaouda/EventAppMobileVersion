import 'dart:convert';

import 'dart:convert';

import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/EmailPreferences.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/PasswordSettings.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/PrivacySettings.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabAttendingEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabOrganiseEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabSaveEvent.dart';
import 'package:event_mobile_app/screen/events/eventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileTabSetting extends StatefulWidget {
  Map userInfo;

  ProfileTabSetting({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<ProfileTabSetting> createState() => _ProfileTabSettingState();
}

class _ProfileTabSettingState extends State<ProfileTabSetting> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Map userData = widget.userInfo;
    print(userData['data']['privacySettings']);
    Map userEmailPreferences = jsonDecode(userData['data']['emailPreferences']);
    Map userPrivacySettings = jsonDecode(userData['data']['privacySettings']);
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Container(
              width: 200,
              color: darkMode ? darkColor.dWhite : lightColor.dWhite,
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      if(index == 0){
                        Provider.of<AllChangeNotifier>(context,listen: false).profilePageHeightCustom(1000.0);
                      }else if(index == 1){
                        Provider.of<AllChangeNotifier>(context,listen: false).profilePageHeightCustom(850.0);
                      }else if(index == 2){
                        Provider.of<AllChangeNotifier>(context,listen: false).profilePageHeightCustom(1000.0);
                      }
                      print("params index $index");
                    },
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: lightColor.dGreen),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        height: 370,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.solidEnvelope,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Email Preferences",
                                style: TextStyle(
                                    color: darkMode ? darkColor.dBlack : null),
                              )
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        height: 370,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.key,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Password Settings",
                                  style: TextStyle(
                                      color:
                                          darkMode ? darkColor.dBlack : null))
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        height: 370,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.gear,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text("Privacy Settings",
                                  style: TextStyle(
                                      color:
                                          darkMode ? darkColor.dBlack : null))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Flexible(
            child: Container(
              child: TabBarView(
                children: [
                  EmailPreferences(preferences: userEmailPreferences),
                  const PasswordSettings(),
                  PrivacySettings(preferences: userPrivacySettings),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

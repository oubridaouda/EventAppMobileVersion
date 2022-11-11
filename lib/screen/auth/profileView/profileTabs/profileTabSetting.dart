import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/EmailPreferences.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/PasswordSettings.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/PrivacySettings.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabAttendingEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabOrganiseEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabSaveEvent.dart';
import 'package:event_mobile_app/screen/events/eventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTabSetting extends StatefulWidget {
  const ProfileTabSetting({Key? key}) : super(key: key);

  @override
  State<ProfileTabSetting> createState() => _ProfileTabSettingState();
}

class _ProfileTabSettingState extends State<ProfileTabSetting> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
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
              child: const TabBarView(
                children: [
                  EmailPreferences(),
                  PasswordSettings(),
                  PrivacySettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

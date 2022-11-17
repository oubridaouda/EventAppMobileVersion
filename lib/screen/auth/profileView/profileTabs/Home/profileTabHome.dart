import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabAttendingEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabOrganiseEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabSaveEvent.dart';
import 'package:event_mobile_app/screen/events/eventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTabHome extends StatefulWidget {
  const ProfileTabHome({Key? key}) : super(key: key);

  @override
  State<ProfileTabHome> createState() => _ProfileTabHomeState();
}

class _ProfileTabHomeState extends State<ProfileTabHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Container(
              width: 400,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dGrey
                                      : lightColor.InputColor,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      child: Text("1"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Save Events",
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dGrey
                                      : lightColor.InputColor,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      child: Text("2"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Organise Events",
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: darkMode
                                      ? darkColor.dGrey
                                      : lightColor.InputColor,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      child: Text("3"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text("Attending Events",
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
                  ProfileTabSaveEvents(),
                  ProfileTabOrganiseEvents(),
                  ProfileTabAttendingEvents(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

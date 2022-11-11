import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabAttendingEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabOrganiseEvents.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/profileTabSaveEvent.dart';
import 'package:event_mobile_app/screen/events/eventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTabSetting extends StatelessWidget {
  const ProfileTabSetting({Key? key}) : super(key: key);

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
              child:  TabBarView(
                children: [

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: darkMode ? darkColor.dWhite : lightColor.dWhite,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Email Preferences",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Receive order confirmation",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Receive order confirmation",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Receive order confirmation",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                  ProfileTabOrganiseEvents(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: darkMode ? darkColor.dWhite : lightColor.dWhite,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0,),
                        const Text(
                          "Privacy Settings",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(height: 20.0,),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lock my user profile",
                              style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Receive order confirmation",
                              style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Receive order confirmation",
                              style:
                              TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "On purchasing an event you will receive an order confirmation email.",
                              style: TextStyle(
                                  color: lightColor.dGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightColor.dBackgroud,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

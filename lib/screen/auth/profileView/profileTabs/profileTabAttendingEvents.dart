import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/events/eventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTabAttendingEvents extends StatelessWidget {
  const ProfileTabAttendingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        EventCard(title: "Step Up Open Mic Show",date: "Thu, Jun 30, 2022 4:30 AM",bottomButton:
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor:
                  darkMode ? darkColor.dWhite : lightColor.dWhite,
                ),
                onPressed: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      size: 14,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "View Tiket",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ],
    );
  }
}

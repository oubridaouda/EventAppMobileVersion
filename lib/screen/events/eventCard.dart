import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: darkMode ? darkColor.dWhite : lightColor.dWhite,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 70, bottom: 80),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: darkMode ? darkColor.dBackgroud : lightColor.dBackgroud,
              image: const DecorationImage(
                image: AssetImage("assets/images/profile-imgs/profile.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Step Up Open Mic Show",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Thu, Jun 30, 2022 4:30 AM"),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    backgroundColor:
                        darkMode ? darkColor.dGreen : lightColor.dGreen,
                  ),
                  onPressed: () async {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.bookmark,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 50,
                width: 100,
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
                        "Find",
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
          )
        ],
      ),
    );
  }
}

import 'package:event_mobile_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key,required this.title, required this.date,required this.bottomButton}) : super(key: key);
  final String title;
  final String date;
  final Widget bottomButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: darkMode ? darkColor.dWhite : lightColor.dWhite,
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 360,
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
           Text(
             title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(date),
          const SizedBox(
            height: 20,
          ),
          bottomButton
        ],
      ),
    );
  }
}

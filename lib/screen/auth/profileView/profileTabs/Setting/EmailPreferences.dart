import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';


class EmailPreferences extends StatefulWidget {
  const EmailPreferences({Key? key}) : super(key: key);

  @override
  State<EmailPreferences> createState() => _EmailPreferencesState();
}

class _EmailPreferencesState extends State<EmailPreferences> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: darkMode ? darkColor.dWhite : lightColor.dWhite,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Email Preferences",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 2,
              color: lightColor.dBackgroud,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Receive order confirmation",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
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
                ),
                FlutterSwitch(
                  width: 44.0,
                  height: 22.0,
                  valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 2.0,
                  showOnOff: true,
                  activeText: "",
                  inactiveText: "",
                  activeColor: lightColor.cyanColor,
                  inactiveColor: lightColor.cyanBlueColor,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Receive order confirmation",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
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
                ),
                FlutterSwitch(
                  width: 44.0,
                  height: 22.0,
                  valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 2.0,
                  showOnOff: true,
                  activeText: "",
                  inactiveText: "",
                  activeColor: lightColor.cyanColor,
                  inactiveColor: lightColor.cyanBlueColor,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Receive order confirmation",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
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
                ),
                FlutterSwitch(
                  width: 44.0,
                  height: 22.0,
                  valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 2.0,
                  showOnOff: true,
                  activeText: "",
                  inactiveText: "",
                  activeColor: lightColor.cyanColor,
                  inactiveColor: lightColor.cyanBlueColor,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
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
      );
  }
}

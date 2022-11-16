import 'package:event_mobile_app/controller/userProfile/PreferencesController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';
import 'package:toast/toast.dart';

class EmailPreferences extends StatefulWidget {
  Map preferences;

  EmailPreferences({Key? key, required this.preferences}) : super(key: key);

  @override
  State<EmailPreferences> createState() => _EmailPreferencesState();
}

class _EmailPreferencesState extends State<EmailPreferences> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    Map preferences = widget.preferences;
    return Container(
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
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
          emailPreferencesItems(
              "Receive order confirmation",
              "On purchasing an event you will receive an order confirmation email.","1",
              preferences["1"] == '1' ? "1" : "0"),
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
          emailPreferencesItems(
              "Receive communication from event organisers for my purchased events",
              "The organisations whose events you have bought will be able send you further follow up emails.","2",
              preferences["2"] == '1' ? "1" : "0"),
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
          emailPreferencesItems(
              "Receive event invitations from event organisers sent to my email address",
              "Organisations will be able to send you Invitations in their events.","3",
              preferences["3"] == '1' ? "1" : "0"),

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
          emailPreferencesItems(
              "Receive reminder from Barren for my purchased events",
              "After purchasing event you will receive reminder emails before the event starts so that you can get prepared.","4",
              preferences["4"] == '1' ? "1" : "0"),
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

  Widget emailPreferencesItems(String title, String content, id,preferencesValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
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
          value: preferencesValue =='1' ? true : false,
          borderRadius: 30.0,
          padding: 2.0,
          showOnOff: true,
          activeText: "",
          inactiveText: "",
          activeColor: lightColor.cyanColor,
          inactiveColor: lightColor.cyanBlueColor,
          onToggle: (val) {
            print("La valeur envoyé pour preferences $val");
            //Init context we use toast
            ToastContext().init(context);
            //Toast show message
            Toast.show("please wait...",duration: Toast.lengthLong, gravity: Toast.bottom);
            PreferencesController().updateUserPreferences(context, id, val ? "1":"0","emailPreferences");
          },
        ),
      ],
    );
  }
}

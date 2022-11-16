import 'package:event_mobile_app/controller/userProfile/PreferencesController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';
import 'package:toast/toast.dart';

class PrivacySettings extends StatefulWidget {
  Map preferences;

  PrivacySettings({Key? key, required this.preferences}) : super(key: key);

  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
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
            "Privacy Settings",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
          privacySettingItems(context,
              "Lock my user profile",
              "On purchasing an event you will receive an order confirmation email.",
              preferences["1"] == '1' ? "1" : "0","1"),
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
          privacySettingItems(context,
              "Allow people to contact me",
              "People will be able to send you emails through Barren who visits your profile.",
              preferences["2"] == '1' ? "1" : "0","2"),
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
          privacySettingItems(context,
              "Allow people to find and invite me to relevant events",
              "Based on your preferences event organisers will be able to send you invitations in their events.",
              preferences["3"] == '1' ? "1" : "0","3"),
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
          privacySettingItems(context,
              "Allow people to follow me",
              "People will be able to follow you.",
              preferences["4"] == '1' ? "1" : "0","4"),
          const SizedBox(
            height: 25.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
          privacySettingItems(context,
              "Allow people to see my followings",
              "People will be able to see whom and which organisations you are following.",
              preferences["5"] == '1' ? "1" : "0","5"),
          const SizedBox(
            height: 25.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
        ],
      ),
    );
  }

  Widget privacySettingItems(context,String title, String content, preferencesValue,id) {
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
          onToggle: (val) async{

            //Init context we use toast
            ToastContext().init(context);
            //Toast show message
            Toast.show("please wait...",duration: Toast.lengthLong, gravity: Toast.bottom);
            await PreferencesController().updateUserPreferences(context, id, val ? "1":"0","privacySettings");
          },
        ),
      ],
    );
  }
}

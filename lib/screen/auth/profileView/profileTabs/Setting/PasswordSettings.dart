import 'package:event_mobile_app/screen/auth/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:event_mobile_app/main.dart';

class PasswordSettings extends StatefulWidget {
  const PasswordSettings({Key? key}) : super(key: key);

  @override
  State<PasswordSettings> createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
  @override
  Widget build(BuildContext context) {
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
            "Password Settings",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Divider(
            thickness: 2,
            color: lightColor.dBackgroud,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: const [
              Text(
                "Change password",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "You can update your password from here. Ifyou can't remember your current password, just log out and click on Forgot password.",
            style: TextStyle(
              color: lightColor.dGrey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
              hintText: 'Entrez votre mot de passe',
              enabledBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: darkMode
                        ? darkColor.InputColor
                        : lightColor.InputBorderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              suffixIcon: InkWell(
                onTap: () => setState(() {}),
                child: Icon(
                  Icons.visibility_off,
                  color: lightColor.dGrey,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Mot de passe oublié?",
                  style: TextStyle(
                      color: lightColor.dGreen, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
              hintText: 'Entrez votre mot de passe',
              enabledBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: darkMode
                        ? darkColor.InputColor
                        : lightColor.InputBorderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              suffixIcon: InkWell(
                onTap: () => setState(() {}),
                child: Icon(
                  Icons.visibility_off,
                  color: lightColor.dGrey,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          const Text(
            "Current password*",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (textPass) => setState(() {}),
            style: TextStyle(
                color: darkMode ? lightColor.dWhite : darkColor.dWhite),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  darkMode ? darkColor.InputColor : lightColor.InputColor,
              hintText: 'Entrez votre mot de passe',
              enabledBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: darkMode
                        ? darkColor.InputColor
                        : lightColor.InputBorderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  //Outline border type for TextFeild
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  borderSide: BorderSide(
                    color: lightColor.InputBorderColor,
                  )),
              errorBorder: const OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(2)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              suffixIcon: InkWell(
                onTap: () => setState(() {}),
                child: Icon(
                  Icons.visibility_off,
                  color: lightColor.dGrey,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 50.0,
          ),

          ElevatedButton(
            onPressed: () async {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: appColor.dGreen,
              padding: const EdgeInsets.all(20),
              elevation: 1.0,
            ),child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Update Password",
                    style: TextStyle(
                        fontSize: 16,
                        color: darkMode
                            ? darkColor.dWhite
                            : lightColor.dWhite),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

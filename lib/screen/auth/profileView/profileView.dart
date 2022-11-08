import 'package:event_mobile_app/controller/auth/logOutController.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class ProfileView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ProfileView({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          darkMode ? darkColor.firstBackground : lightColor.firstBackground,
      appBar: MyAppBar(scaffoldKey: widget.scaffoldKey),
      drawer: NavDrawer(scaffoldKey: widget.scaffoldKey),
      body: Container(
        child: Column(
          children:  [
            const Center(
              child: Text("Salut Crack Bienvenue dans ton profile"),
            ),
            ElevatedButton(
              onPressed: (){

                // Google logout
                LogOutController().googleLogOut(context);

                //Classic log out
                LogOutController().logOutClassic(context);

                //Facebook logout
                LogOutController().facebookLogOut(context);
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}

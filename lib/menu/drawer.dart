import 'package:event_mobile_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NavDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                        height: 100.0,
                        child: DrawerHeader(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                height: 50,
                                "assets/images/logo-icon.svg",
                                semanticsLabel: "DuckEvent",
                              ),
                              MaterialButton(
                                elevation: 0,
                                height: 40,
                                minWidth: 40,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                color: dBackgroud,
                                onPressed: () {
                                  widget.scaffoldKey.currentState
                                      ?.closeDrawer();
                                },
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: dGrey,
                                  size: 23,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      color: dBackgroud,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          primary: dGreen,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.calendar_month),
                            Text(
                              "Create Event",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Drawer Menu section
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Explore Events'),
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      title: const Text('Pricing'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Blog'),
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      title: Text('Help'),
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    ListTile(
                      title: const Text('Pages'),
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //Drawer bottom
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(
                      bottom: 30.0, top: 30.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Follow Us",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 17.0,
                      ),
                      //Social media icon button
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: dGreen,
                                              height: 20,
                                              'assets/social/facebook.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: dGreen,
                                              height: 20,
                                              'assets/social/instagram.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: dGreen,
                                              height: 20,
                                              'assets/social/twitter.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: dGreen,
                                              height: 20,
                                              'assets/social/linkedin.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 135,
                              backgroundColor: dGreen,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 125,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 200,
                                      child: ClipRRect(
                                          child: SvgPicture.asset(
                                              color: dGreen,
                                              height: 20,
                                              'assets/social/youtube.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

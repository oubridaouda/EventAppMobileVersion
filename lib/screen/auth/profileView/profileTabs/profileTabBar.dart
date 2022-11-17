import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/MyOrder/ProfileTabMyOrders.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/About/profileTabAbout.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Home/profileTabHome.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileTabs/Setting/profileTabSetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileTabBar extends StatefulWidget {
  Map user;
  Map preferences;

  ProfileTabBar({Key? key, required this.user, required this.preferences})
      : super(key: key);

  @override
  State<ProfileTabBar> createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  final _unselectedColor = Color(0xff5f6368);

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _buildTabContext(int lineCount) => Container(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: lineCount,
          itemBuilder: (BuildContext context, int index) {
            return Text('some content');
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    double containerHeight = Provider.of<AllChangeNotifier>(context).height;

    print(containerHeight);
    var tabIndex = 0;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            constraints: const BoxConstraints.expand(height: 50),
            decoration: BoxDecoration(
              color: darkMode ? darkColor.dWhite : lightColor.dWhite,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: lightColor.dGreen),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.house,
                          size: 14.0,
                          color: darkMode ? darkColor.dBlack : null),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Home",
                          style: TextStyle(
                              color: darkMode ? darkColor.dBlack : null))
                    ],
                  ),
                ),
                Tab(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      FaIcon(FontAwesomeIcons.circleInfo,
                          size: 14.0,
                          color: darkMode ? darkColor.dBlack : null),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("About",
                          style: TextStyle(
                              color: darkMode ? darkColor.dBlack : null))
                    ])),
                Tab(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      FaIcon(FontAwesomeIcons.gear,
                          size: 14.0,
                          color: darkMode ? darkColor.dBlack : null),
                      const SizedBox(
                        width: 2,
                      ),
                      Text("Setting",
                          style: TextStyle(
                              color: darkMode ? darkColor.dBlack : null))
                    ])),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.box,
                          size: 14.0,
                          color: darkMode ? darkColor.dBlack : null),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Orders",
                          style: TextStyle(
                              color: darkMode ? darkColor.dBlack : null))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1000,
            margin: const EdgeInsets.all(10.0),
            child: TabBarView(
              children: [
                const ProfileTabHome(),
                ProfileTabAbout(
                  userInfo: widget.user,
                ),
                ProfileTabSetting(userInfo: widget.preferences),
                const ProfileTabMyOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

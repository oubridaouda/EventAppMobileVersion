import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
import 'package:event_mobile_app/screen/auth/profileView/profileView.dart';
import 'package:event_mobile_app/screen/events/EventListScreenView/EventListScreenView.dart';
import 'package:event_mobile_app/screen/events/SearchEventSection/SearchEventSection.dart';
import 'package:event_mobile_app/screen/menu/appNavBar.dart';
import 'package:event_mobile_app/screen/menu/drawer.dart';
import 'package:event_mobile_app/screen/pages/ExploreEvents/ExploreEvents.dart';
import 'package:event_mobile_app/screen/pages/ExploreEvents/OnlineEventDetailView.dart';
import 'package:event_mobile_app/screen/pages/ExploreEvents/VenuesEventDetailView.dart';
import 'package:event_mobile_app/screen/pages/Home/DashBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_mobile_app/main.dart';
import 'package:toast/toast.dart';

var currentPage = DrawerSection.dashboard;

class HomePage extends StatefulWidget {
  final bool? loginStatus;
  final String text;

  const HomePage({Key? key, this.loginStatus = false, this.text = ""})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: "homeScreen");
  bool? isLogged = false;
  bool refresh = false;
  final Future<SharedPreferences> _shareStorage =
      SharedPreferences.getInstance();
  DateTime backPressedTime = DateTime.now();

  Future<bool?> getStorage() async {
    final logged = await SharedPreferences.getInstance();
    isLogged = logged.getBool("isLoggedIn") ?? false;

    print("is logginStatus ${widget.loginStatus}");
    return isLogged;
  }

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "homeScreen");
    super.initState();
    getStorage();
  }

  @override
  Widget build(BuildContext context) {
    darkMode = Provider.of<AllChangeNotifier>(context).screenMode;
    refresh = Provider.of<AllChangeNotifier>(context).refresh;
    Widget container = const DashBoard();
    currentPage = Provider.of<AllChangeNotifier>(context).currentPage;
    if (currentPage == DrawerSection.dashboard) {
      container = const DashBoard();
    } else if (currentPage == DrawerSection.exploreEvents) {
      container = const ExploreEvents();
    } else if (currentPage == DrawerSection.onlineEvent) {
      container = const OnlineEventDetailView();
    } else if (currentPage == DrawerSection.venueEvent) {
      container = const VenuesEventDetailView();
    } else if (currentPage == DrawerSection.profileView) {
      container = const ProfileView();
    }
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(scaffoldKey: _scaffoldKey),
        appBar: MyAppBar(scaffoldKey: _scaffoldKey),
        body: !refresh
            ? container
            : Center(
                child: CircularProgressIndicator(color: lightColor.dGreen),
              ),
      ),
      onWillPop: () async {
        print("back button pressed");
        if (currentPage != DrawerSection.dashboard) {
          Provider.of<AllChangeNotifier>(context, listen: false)
              .changePage(DrawerSection.dashboard);
          return false;
        } else {
          final difference = DateTime.now().difference(backPressedTime);
          backPressedTime = DateTime.now();

          if (difference >= const Duration(seconds: 2)) {
            ToastContext().init(context);
            Toast.show("Click again to close the app",
                duration: Toast.lengthLong, gravity: Toast.bottom);
            return false;
          } else {
            SystemNavigator.pop(animated: true);
            return true;
          }
        }
      },
    );
  }
}

enum DrawerSection {
  dashboard,
  exploreEvents,
  onlineEvent,
  venueEvent,
  profileView,
  loginPage,
  singUpPage,
}

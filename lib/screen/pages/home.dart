import 'package:event_mobile_app/allChangeNotifer/AllChangeNotifer.dart';
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
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final Future<SharedPreferences> _shareStorage =
      SharedPreferences.getInstance();

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
    var container;
    if(Provider.of<AllChangeNotifier>(context).currentPage == DrawerSection.dashboard){
      container = DashBoard();
    }else if(Provider.of<AllChangeNotifier>(context).currentPage == DrawerSection.exploreEvents){
      container = ExploreEvents();
    }else if(Provider.of<AllChangeNotifier>(context).currentPage == DrawerSection.onlineEvent){
      container = OnlineEventDetailView();
    }else if(Provider.of<AllChangeNotifier>(context).currentPage == DrawerSection.venueEvent){
      container = VenuesEventDetailView();
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(scaffoldKey: _scaffoldKey),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: container,
    );
  }
}

enum DrawerSection{
  dashboard,
  exploreEvents,
  onlineEvent,
  venueEvent
}
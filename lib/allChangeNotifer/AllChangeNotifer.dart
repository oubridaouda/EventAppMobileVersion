import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';

class AllChangeNotifier extends ChangeNotifier {
  var currentPage = DrawerSection.dashboard;
  var screenMode = darkMode;

  void changePage(newPage) {
    currentPage = newPage;
    notifyListeners();
  }
  void changeNightMode(bool newScreenMode){
    screenMode = newScreenMode;
    notifyListeners();
  }
}

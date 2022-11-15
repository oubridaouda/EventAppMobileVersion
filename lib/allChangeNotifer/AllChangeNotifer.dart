import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';

class AllChangeNotifier extends ChangeNotifier {
  var currentPage = DrawerSection.dashboard;
  var screenMode = darkMode;
  var refresh = false;
  var userData = {};
  var userPreferences = {};

  void changePage(newPage) {
    currentPage = newPage;
    notifyListeners();
  }
  void changeNightMode(bool newScreenMode){
    screenMode = newScreenMode;
    notifyListeners();
  }
  void pageRefresh(bool newRefresh){
    refresh = newRefresh;
    notifyListeners();
  }
  void sendUserData(newUserData){
    userData = newUserData;
    notifyListeners();
  }
  void sendUserPreferences(newUserPreferences){
    userPreferences = newUserPreferences;
    notifyListeners();
  }
}

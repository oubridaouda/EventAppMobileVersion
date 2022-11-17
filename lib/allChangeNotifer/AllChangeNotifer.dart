import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';

class AllChangeNotifier extends ChangeNotifier {
  var isLogged = false;
  var currentPage = DrawerSection.dashboard;
  var screenMode = darkMode;
  var refresh = false;
  var userData = {};
  var userPreferences = {};
  var height = 1000.0;
  var uploadAvatarImage = "";
  var uploadCoverImage = "";
  var avatar =
      "https://www.e.kossyam.com/assets/images/profile-imgs/nasa-Yj1M5riCKk4-unsplash.jpg";

  void userIsLogged(newLogged) {
    isLogged = newLogged;
    notifyListeners();
  }

  void changePage(newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void changeNightMode(bool newScreenMode) {
    screenMode = newScreenMode;
    notifyListeners();
  }

  void pageRefresh(bool newRefresh) {
    refresh = newRefresh;
    notifyListeners();
  }

  void sendUserData(newUserData) {
    userData = newUserData;
    notifyListeners();
  }

  void sendUserPreferences(newUserPreferences) {
    userPreferences = newUserPreferences;
    notifyListeners();
  }

  void profilePageHeightCustom(newHeight) {
    height = newHeight;
    notifyListeners();
  }

  void profileAvatarImg(newAvatar) {
    avatar = newAvatar;
    notifyListeners();
  }

  void uploadImage(newAvatar, newCover) {
    uploadAvatarImage = newAvatar == "default" ? uploadAvatarImage : newAvatar;
    uploadCoverImage = newCover == "default" ? uploadCoverImage : newCover;
    notifyListeners();
  }
}

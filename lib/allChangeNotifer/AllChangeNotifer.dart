import 'package:event_mobile_app/main.dart';
import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';

class AllChangeNotifier extends ChangeNotifier {
  var isLogged = false;
  var requestLoad = false;
  var currentPage = DrawerSection.dashboard;
  var screenMode = darkMode;
  var refresh = false;
  var userData = {};
  var userPreferences = {};
  var userSocialNetwork = {};
  var userAddresses = {};
  var height = 1000.0;
  var uploadAvatarImage = "";
  var uploadCoverImage = "";
  var avatar = "";

  //Change user status to logged or disconnect
  void userIsLogged(newLogged) {
    isLogged = newLogged;
    notifyListeners();
  }

  //Change page and navigate to next page
  void changePage(newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  //Change night and light mode
  void changeNightMode(bool newScreenMode) {
    screenMode = newScreenMode;
    notifyListeners();
  }

  //Active loader after request is progress
  void requestLoadProgress(bool newRequestLoad) {
    requestLoad = newRequestLoad;
    notifyListeners();
  }

  //Active loader after page refresh
  void pageRefresh(bool newRefresh) {
    refresh = newRefresh;
    notifyListeners();
  }

  //User social network list
  void changeUserSocialNetwork(newSocialNetwork) {
    userSocialNetwork = newSocialNetwork;
    notifyListeners();
  }

  //User address information
  void changeUserAddress(newUserAddress) {
    userAddresses = newUserAddress;
    notifyListeners();
  }

  //Update user information
  void sendUserData(newUserData) {
    userData = newUserData;
    notifyListeners();
  }

  //Store user preferences
  void sendUserPreferences(newUserPreferences) {
    userPreferences = newUserPreferences;
    notifyListeners();
  }

  //Store user preferences
  void profilePageHeightCustom(newHeight) {
    height = newHeight;
    notifyListeners();
  }

  //Store user avatar image
  void profileAvatarImg(newAvatar) {
    avatar = newAvatar;
    notifyListeners();
  }

  //Change user avatar and cover image after new avatar or cover image is upload
  void uploadImage(newAvatar, newCover) {
    uploadAvatarImage = newAvatar == "default" ? uploadAvatarImage : newAvatar;
    uploadCoverImage = newCover == "default" ? uploadCoverImage : newCover;
    notifyListeners();
  }
}

import 'package:event_mobile_app/screen/pages/home.dart';
import 'package:flutter/cupertino.dart';

class AllChangeNotifier extends ChangeNotifier {
  var currentPage = DrawerSection.dashboard;

  void changePage(newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

class MainController extends ChangeNotifier {
  void onChangeSelectedMenu(index) {
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> getScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> getViewOrderScaffoldKey = GlobalKey<ScaffoldState>();

  MainController() {
    buildMenu();
  }

  final _screens = [
    const HomePage(),
  ];

  var screens = [];
  void buildMenu() {
    screens = _screens;
    notifyListeners();
  }

}

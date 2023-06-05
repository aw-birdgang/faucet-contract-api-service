import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MainController>().getScaffoldKey,
      body: SafeArea(
        child: Container(
          child: context.watch<MainController>().screens[0],
        ),
      ),
    );
  }
}

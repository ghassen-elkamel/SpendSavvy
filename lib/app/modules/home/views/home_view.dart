import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_savvy/app/global_widgets/templates/app_scaffold.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
    withBottomNavigationBar: true,
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_savvy/app/core/utils/constant.dart';
import 'package:spend_savvy/app/global_widgets/templates/app_scaffold.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppScaffold(
        withAppBar: false,
        withBottomNavigationBar: true,
        body:
            selectedIndex.value == 0 ? GetRouterOutlet(
          initialRoute: Routes.SPENDINGS,
          key: Get.nestedKey(Routes.SPENDINGS),
        ):  selectedIndex.value == 1 ? GetRouterOutlet(
                initialRoute: Routes.SPENDINGS,
                key: Get.nestedKey(Routes.SPENDINGS))
                :const Text(""),

      );
    });
  }
}

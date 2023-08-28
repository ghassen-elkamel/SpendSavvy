import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:spend_savvy/app/core/utils/constant.dart';
import 'package:spend_savvy/app/core/values/colors.dart';

class AtomNavigationBar extends StatelessWidget {
  const AtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBottomNavigationBar(
          icons: iconList,
elevation: 0,

          backgroundColor: white,
          activeIndex: selectedIndex.value,
          activeColor: secondaryColor,
          inactiveColor: primaryColor,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => selectedIndex.value = index,



      );
    });
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spend_savvy/app/global_widgets/atoms/atom_bottom_navigation_bar.dart';
import 'package:spend_savvy/app/modules/drawer/views/drawer_view.dart';

import '../../core/values/colors.dart';



class AppScaffold extends StatelessWidget {

  final bool withBottomNavigationBar;
  final bool withFloatingActionButton;
  final Widget body;
  final bool withAppBar;
   AppScaffold({super.key,
     this.withFloatingActionButton = false,
this.withAppBar = true,
    this.withBottomNavigationBar = false,
    required this.body,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(bottomNavigationBar: withBottomNavigationBar?
       const AtomNavigationBar():null,
backgroundColor: white,
drawer: const Drawer(
  child: DrawerView(),
),
appBar:withAppBar? AppBar(
  title: const Text("Spend Savvy"),
centerTitle: true,
titleTextStyle: const TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold,),
backgroundColor: white,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(Icons.menu),
    color: primaryColor,
    onPressed: () {
      Scaffold.of(context).openDrawer();

    },
  ),
):null,
    body: body,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      floatingActionButton: withFloatingActionButton?FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ):null,

    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spend_savvy/app/global_widgets/atoms/atom_bottom_navigation_bar.dart';

import '../../core/values/colors.dart';



class AppScaffold extends StatelessWidget {

  final bool withBottomNavigationBar;
  final Widget body;
   AppScaffold({super.key,

    this.withBottomNavigationBar = false,
    required this.body,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(bottomNavigationBar: withBottomNavigationBar?
       const AtomNavigationBar():null,
backgroundColor: white,

    body: body
    );
  }
}

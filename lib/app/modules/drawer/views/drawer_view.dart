import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spend_savvy/app/core/values/colors.dart';
import 'package:spend_savvy/app/data/services/auth_service.dart';
import 'package:spend_savvy/app/global_widgets/atoms/atom_card.dart';
import 'package:spend_savvy/app/global_widgets/templates/app_scaffold.dart';


class DrawerView extends GetView<DrawerController> {
  const DrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      withAppBar: false,
      body:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 38),
      child: ListView(

      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
       const SizedBox(
      height: 100,
        child: DrawerHeader(


        curve: Curves.easeInOut,
        decoration: BoxDecoration(

            color: primaryColor,
          borderRadius: BorderRadius.all( Radius.circular(20),),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/profile_picture.jpg'),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
          'profile',
          style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          ),
          ),
        ),


        ],
        ),
        ),
      ),
  AtomCard(leading: const Icon(Icons.person_3_rounded), title: 'Profile', subtitle: 'Manage your profile', trailing: '>', onTap: () {
      },color:Colors.blueGrey[100]!,),
   AtomCard(leading: const Icon(Icons.settings), title: 'Settings', subtitle: 'Manage your settings', trailing: '>', onTap: () {

      },color:Colors.blueGrey[100]!,),
   AtomCard(leading:  Icon(Icons.logout), title: 'Logout', subtitle: 'Logout from your account', trailing: '>', onTap: () async {
       Get.offAllNamed('/login');
await AuthService().logout();

      },color:Colors.blueGrey[100]!,),
      ],
      ),
    ),);
  }
}

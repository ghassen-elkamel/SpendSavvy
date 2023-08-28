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
    return AppScaffold(body:ListView(
padding: EdgeInsets.zero,
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: <Widget>[
    const DrawerHeader(

      padding: EdgeInsets.all(15),
    decoration: BoxDecoration(

        color: primaryColor,
      borderRadius: BorderRadius.all( Radius.circular(20),),

    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CircleAvatar(
    radius: 40,
    backgroundImage: AssetImage('assets/profile_picture.jpg'),
    ),

    Padding(
      padding: EdgeInsets.only(top:10),
      child: Text(
      'John Doe',
      style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(3.0),
      child: Text(
      'johndoe@example.com',
      style: TextStyle(
      color: Colors.white,
        fontSize: 12,
      ),
      ),
    ),
    ],
    ),
    ),
  AtomCard(leading: Icon(Icons.person_3_rounded), title: 'Profile', subtitle: 'Manage your profile', trailing: '>', onTap: () {
    }),
   AtomCard(leading: Icon(Icons.settings), title: 'Settings', subtitle: 'Manage your settings', trailing: '>', onTap: () {

    }),
   AtomCard(leading:  Icon(Icons.logout), title: 'Logout', subtitle: 'Logout from your account', trailing: '>', onTap: () async {
     Get.offAllNamed('/login');
await AuthService().logout();

    }),
    ],
    ),);
  }
}

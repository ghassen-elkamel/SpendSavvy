import 'package:flutter/material.dart';
import 'package:spend_savvy/app/core/values/colors.dart';

class AtomCard extends StatelessWidget {
  final Icon leading;
  final String title ;
final String subtitle;
final String trailing;
final Function() onTap;
  const AtomCard({super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  required this.onTap,
});
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Card(
        color: white,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),


        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: leading,
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}

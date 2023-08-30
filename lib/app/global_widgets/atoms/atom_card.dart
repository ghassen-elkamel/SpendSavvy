import 'package:flutter/material.dart';
import 'package:spend_savvy/app/core/values/colors.dart';

class AtomCard extends StatelessWidget {
  final Color color;
  final Icon leading;
  final String title ;
final String subtitle;
final String trailing;
final Function() onTap;
  const AtomCard({super.key,
     this.color = white,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  required this.onTap,
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
      child: Card(

        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),


elevation: 0,

        child: ListTile(
          leading: leading,
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}

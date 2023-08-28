import 'package:flutter/material.dart';

class AtomCard extends StatelessWidget {
  final String title ;
final String subtitle;
final String trailing;
  const AtomCard({super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child:ListTile(

        title:  Text(title),
        subtitle:  Text(subtitle),
        trailing:  Text(trailing)
      )
    );
  }
}

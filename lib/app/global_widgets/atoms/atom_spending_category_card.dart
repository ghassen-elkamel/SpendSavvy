

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:spend_savvy/app/core/values/colors.dart';

class AtomSpendingCategoryCard extends StatelessWidget {
  const AtomSpendingCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicFlexContainer(

      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
           primaryColor.withOpacity(0.5),
          primaryColor.withOpacity(0.1),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
         primaryColor.withOpacity(0.8),
          primaryColor.withOpacity(0.1),
        ],
      ),
      shape: BoxShape.rectangle,
 constraints: const BoxConstraints.expand(
        height: 150,
        width: 150,
      ),
      padding: const EdgeInsets.all(8.0),
      child:  const ListTile(

        title: Text('Spending Category'),
        subtitle: Text('Spending Category'),

        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}

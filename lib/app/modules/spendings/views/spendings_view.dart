import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spend_savvy/app/global_widgets/templates/app_scaffold.dart';

import '../../../global_widgets/atoms/atom_spending_category_card.dart';
import '../controllers/spendings_controller.dart';

class SpendingsView extends GetView<SpendingsController> {
  const SpendingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
withFloatingActionButton: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left:20,bottom: 10,top: 10),
            child: Text("Spending's categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(itemBuilder: (context, index) {
                return const SizedBox(height:250,child: AtomSpendingCategoryCard());
              },
                itemCount: 10,
shrinkWrap: true,
physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 38),
              scrollDirection: Axis.vertical


    ),
            ),
          ),
        ],
      ),
    );
  }
}

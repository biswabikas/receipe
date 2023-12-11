import 'package:flutter/material.dart';
import 'package:receipe/models/receipe_bundles.dart';
import 'package:receipe/screens/home/components/categories.dart';
import 'package:receipe/screens/home/components/receipe_bundles_card.dart';
import 'package:receipe/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing:
                        SizeConfig.orientation == Orientation.landscape
                            ? SizeConfig.defaultSize! * 2
                            : 0,
                    childAspectRatio: 1.65),
                itemBuilder: (context, index) => ReceipeBundleCard(
                  index: index,
                  press: () {},
                ),
                itemCount: recipeBundles.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

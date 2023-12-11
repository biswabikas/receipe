import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe/models/receipe_bundles.dart';
import 'package:receipe/size_config.dart';

class ReceipeBundleCard extends StatelessWidget {
  const ReceipeBundleCard(
      {super.key, required this.index, required this.press});
  final int index;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    double defaultsize = SizeConfig.defaultSize!;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundles[index].color,
          borderRadius: BorderRadius.circular(defaultsize * 1.8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultsize * 2),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      recipeBundles[index].title!,
                      style: TextStyle(
                          fontSize: defaultsize * 2.2, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultsize * 0.5,
                    ),
                    Text(
                      recipeBundles[index].description!,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    buildInfoRow(defaultsize,
                        iconsrc: 'assets/icons/pot.svg',
                        text: '${recipeBundles[index].recipes} Recipes'),
                    SizedBox(
                      height: defaultsize * 0.5,
                    ),
                    buildInfoRow(defaultsize,
                        iconsrc: 'assets/icons/chef.svg',
                        text: '${recipeBundles[index].chefs} Chefs'),
                    const Spacer()
                  ],
                ),
              ),
            ),
            SizedBox(
              width: defaultsize * 0.5,
            ),
            Image.asset(
              recipeBundles[index].imageSrc!,
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(
    double defaultsize, {
    String? iconsrc,
    String? text,
  }) {
    return Row(
      children: [
        SvgPicture.asset(iconsrc!),
        SizedBox(
          width: defaultsize,
        ),
        Text(
          text!,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

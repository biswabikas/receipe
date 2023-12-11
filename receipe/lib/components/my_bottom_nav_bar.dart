import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/models/navitem.dart';
import 'package:receipe/size_config.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double defaultsize = SizeConfig.defaultSize!;
    return Consumer<NavItems>(
      builder: (context, NavItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultsize * 3),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -7),
              blurRadius: 30,
              color: const Color(0xFF4B1A39).withOpacity(0.2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              NavItems.items.length,
              (index) => buildIconNavBarButton(
                icon: NavItems.items[index].icon,
                press: () {
                  NavItems.chnageNavIndex(index: index);
                  if (NavItems.items[index].destinationChecker()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NavItems.items[index].destination!),
                    );
                  }
                },
                isActive: NavItems.selectedIndex == index ? true : false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBarButton(
      {String? icon, void Function()? press, bool isActive = false}) {
    return IconButton(
      onPressed: press,
      icon: SvgPicture.asset(
        icon!,
        color: isActive ? kPrimaryColor : const Color(0xFFD1D4D4),
        height: 22,
      ),
    );
  }
}

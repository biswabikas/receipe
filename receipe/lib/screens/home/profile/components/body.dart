import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/screens/home/profile/components/info.dart';
import 'package:receipe/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Info(
          image: 'assets/images/pic.png',
          name: 'John Doe',
          email: 'Johndoe01@gmail.com',
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 2,
        ),
        ProfileMenuItem(
          iconsrc: 'assets/icons/bookmark_fill.svg',
          title: 'Saved Recipes',
          press: () {},
        ),
        ProfileMenuItem(
          iconsrc: 'assets/icons/chef_color.svg',
          title: 'Super Plan',
          press: () {},
        ),
        ProfileMenuItem(
          iconsrc: 'assets/icons/language.svg',
          title: 'Change Language',
          press: () {},
        ),
        ProfileMenuItem(
          iconsrc: 'assets/icons/info.svg',
          title: 'Help',
          press: () {},
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.iconsrc,
    required this.title,
    required this.press,
  });
  final String iconsrc, title;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: Row(
          children: [
            SvgPicture.asset(iconsrc),
            SizedBox(width: defaultSize * 2),
            Text(
              title,
              style: TextStyle(fontSize: defaultSize * 1.6, color: kTextColor),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: defaultSize * 1.6,
              color: kTextColor,
            )
          ],
        ),
      ),
    );
  }
}

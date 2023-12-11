import 'package:flutter/material.dart';
import 'package:receipe/components/my_bottom_nav_bar.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/screens/home/profile/components/body.dart';
import 'package:receipe/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: const MyBottomNavBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const SizedBox(),
      backgroundColor: kPrimaryColor,
      title: const Text('Profile'),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Edit',
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize! * 1.6,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

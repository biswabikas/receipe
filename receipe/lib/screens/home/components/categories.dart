import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/size_config.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['All', 'Indian', 'Italian', 'Mexican', 'Chinese'];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 3.5,
        child: ListView.builder(
          itemBuilder: (context, index) => buildCategoryItem(index),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
        decoration: BoxDecoration(
          color: selectedindex == index
              ? const Color(0xFFEFF3EE)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.6),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 2,
              vertical: SizeConfig.defaultSize! * 0.5),
          child: Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedindex == index
                  ? kPrimaryColor
                  : const Color(0xFFC2C2B5),
            ),
          ),
        ),
      ),
    );
  }
}

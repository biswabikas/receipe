import 'package:flutter/material.dart';
import 'package:receipe/constants.dart';
import 'package:receipe/size_config.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });
  final String image, name, email;

  @override
  Widget build(BuildContext context) {
    double defaultsize = SizeConfig.defaultSize!;
    return SizedBox(
      height: defaultsize * 24,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultsize * 15,
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: defaultsize),
                  height: defaultsize * 14,
                  width: defaultsize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white, width: defaultsize * 0.8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: defaultsize * 2.2),
                ),
                SizedBox(
                  height: defaultsize / 2,
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xFF8492A2)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

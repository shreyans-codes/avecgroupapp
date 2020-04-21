import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';

class CustomBackgroundDrop extends StatelessWidget {
  const CustomBackgroundDrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          gradient: commonGradient,
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
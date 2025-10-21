import 'package:flutter/material.dart';

class LeftTagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(10, 0); // بداية من أعلى بعد القص
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(10, size.height);
    path.lineTo(0, size.height / 2); // المثلث الصغير على اليسار
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

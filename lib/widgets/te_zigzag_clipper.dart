import 'package:flutter/material.dart';

class TeZigzagClipper extends CustomClipper<Path> {
  final double zigzagHeight;
  final double zigzagWidth;

  TeZigzagClipper({required this.zigzagHeight, required this.zigzagWidth});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double fullZigzagCount = (width / (zigzagWidth * 2)).floorToDouble();
    double remainingWidth = width - (fullZigzagCount * zigzagWidth * 2);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height - zigzagHeight);

    for (int i = 0; i < fullZigzagCount.toInt(); i++) {
      path.lineTo(zigzagWidth * (2 * i + 1), height);
      path.lineTo(zigzagWidth * (2 * i + 2), height - zigzagHeight);
    }

    // Handle the remaining space
    if (remainingWidth > 0) {
      if (remainingWidth >= zigzagWidth) {
        path.lineTo(width - remainingWidth + zigzagWidth, height);
        path.lineTo(width, height - zigzagHeight);
      } else {
        path.lineTo(width, height);
      }
    }

    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

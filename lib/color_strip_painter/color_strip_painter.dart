
import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

class ColorStripPainter extends CustomPainter {
  List<Color> colors;
  List<double> percentages;

  ColorStripPainter({required this.colors, required this.percentages});

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0.0;
    if (percentages.isEmpty) {
      colors = [ColorsApp.white];
      percentages = [100];
    }
    for (int i = 0; i < colors.length; i++) {
      final Paint paint = Paint()..color = colors[i];

      double segmentWidth = size.width * (percentages[i] / 100);

      canvas.drawRect(
        Rect.fromLTWH(startX, 0, segmentWidth, size.height),
        paint,
      );

      startX += segmentWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

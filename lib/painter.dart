import 'dart:ui';

import 'package:flutter/material.dart';

class ColorStripPainter extends CustomPainter {
  final List<Color> colors; // Список кольорів
  final List<double> percentages; // Список довжин у відсотках

  ColorStripPainter({required this.colors, required this.percentages});

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0.0;

    // Перевірка, що сума відсотків дорівнює 100
    double totalPercentage = percentages.reduce((a, b) => a + b);
    if (totalPercentage != 100) {
      throw Exception('Сума відсотків повинна бути 100');
    }

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()..color = colors[i];

      // Розраховуємо довжину сегмента
      double segmentWidth = size.width * (percentages[i] / 100);

      // Малюємо прямокутник для кожного сегмента
      canvas.drawRect(
        Rect.fromLTWH(startX, 0, segmentWidth, size.height),
        paint,
      );

      // Оновлюємо початкову точку для наступного сегмента
      startX += segmentWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Якщо не потрібно перерисовувати
  }
}
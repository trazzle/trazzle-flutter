import 'package:flutter/material.dart';
import 'package:trazzle/domain/country.dart';
import 'package:trazzle/presentation/const/colors.dart';

class WorldMapPainter extends CustomPainter {
  final List<Country> countries;

  WorldMapPainter(this.countries);

  @override
  void paint(Canvas canvas, Size size) {
    for (final country in countries) {
      final paint = Paint()
          ..color = country.color
          ..style = PaintingStyle.fill;
      
      canvas.drawPath(country.path, paint);

      // 테두리 그리기
      canvas.drawPath(
        country.path,
        Paint()
          ..color = PrimaryColors.p400
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
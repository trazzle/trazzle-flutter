import 'package:flutter/material.dart';
import 'package:trazzle/domain/country.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/const.dart';

// CustomPainter를 이용하여 국가별 path 그리기
class WorldMapPainter extends CustomPainter {
  final List<Country> countries;

  WorldMapPainter(this.countries);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    for (final country in countries) {
      final baseColor = Const().continentColorsList[country.continent] ?? Colors.grey;

      // 채우기 색상
      final paint = Paint()
          ..color = country.isSelected ? baseColor : Colors.transparent
          ..style = PaintingStyle.fill;

      // 테두리 색상
      final stroke = Paint()
        ..color = MainColors.g200
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5;
      
      canvas.drawPath(country.path, paint);
      canvas.drawPath(country.path, stroke);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
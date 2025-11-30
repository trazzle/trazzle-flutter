import 'package:flutter/material.dart';

class FontStyle {
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
}

class Typo {
  final Color color;
  final FontWeight fontWeight;

  Typo(
      this.color, [
      this.fontWeight = FontStyle.medium
  ]);

  TextStyle get h28 => TextStyle(
    fontSize: 28,
    fontWeight: fontWeight,
    height: 24,
    letterSpacing: 0,
    color: color
  );

  TextStyle get h22 => TextStyle(
    fontSize: 22,
    fontWeight: FontStyle.semiBold,
    height: 16,
    letterSpacing: 0,
    color: color
  );

  TextStyle get h18 => TextStyle(
    fontSize: 18,
    fontWeight: FontStyle.semiBold,
    height: 14,
    letterSpacing: 0,
    color: color
  );

  final TextStyle subTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontStyle.medium,
    height: 12,
    letterSpacing: 0,
    color: Colors.black
  );

  final body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontStyle.regular,
    height: 13,
    letterSpacing: 0,
    color: Colors.black
  );

  final body2 = TextStyle(
    fontSize: 16,
    fontWeight: FontStyle.medium,
    height: 13,
    letterSpacing: 0,
    color: Colors.black
  );

  final body3 = TextStyle(
    fontSize: 14,
    fontWeight: FontStyle.light,
    height: 10,
    letterSpacing: 0,
    color: Colors.black
  );

  final body4 = TextStyle(
    fontSize: 14,
    fontWeight: FontStyle.regular,
    height: 11,
    letterSpacing: 0,
    color: Colors.black
  );

  final label = TextStyle(
    fontSize: 16,
    fontWeight: FontStyle.medium,
    height: 13,
    letterSpacing: 0,
    color: Colors.black
  );

  TextStyle get button1 => TextStyle(
    fontSize: 15,
    fontWeight: FontStyle.medium,
    letterSpacing: 0,
    color: color
  );

  final button2 = TextStyle(
    fontSize: 14,
    fontWeight: FontStyle.medium,
    height: 11,
    letterSpacing: 0,
    color: Colors.black
  );

  final caption = TextStyle(
    fontSize: 12,
    fontWeight: FontStyle.light,
    letterSpacing: 0,
    color: Colors.black
  );
}
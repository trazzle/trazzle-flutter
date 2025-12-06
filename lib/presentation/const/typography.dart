import 'package:flutter/material.dart';

class FontStyle {
  static const extraBold = FontWeight.w800;
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
}

class Line {
  // 선 없음
  static const none = TextDecoration.none;

  // 밑줄
  static const underLine = TextDecoration.underline;

  // 윗줄
  static const overLine = TextDecoration.overline;

  // 취소선
  static const throughLine = TextDecoration.lineThrough;
}

class Typo {
  final Color color;
  final FontWeight fontWeight;

  // 텍스트 아래 선 표시 여부
  final TextDecoration line;

  Typo(
      this.color, {
        this.fontWeight = FontStyle.medium,
        this.line = Line.none,
      }
  );

  TextStyle get h28 => TextStyle(
    fontSize: 28,
    fontWeight: fontWeight,
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

  TextStyle get button2 => TextStyle(
    fontSize: 14,
    fontWeight: FontStyle.medium,
    height: 11,
    letterSpacing: 0,
    color: color,
    decoration: line,
    decorationColor: color
  );

  TextStyle get caption => TextStyle(
    fontSize: 12,
    fontWeight: FontStyle.light,
    letterSpacing: 0,
    color: color,
    decorationColor: color
  );
}
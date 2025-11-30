import 'package:flutter/material.dart';

// 나라 정보 모델 생성
class Country {
  final String id;
  final Path path;
  String continent;
  bool isSelected;
  Color color;

  Country({
    required this.id,
    required this.path,
    this.continent = "",
    this.isSelected = false,
    this.color = Colors.grey
  });
}
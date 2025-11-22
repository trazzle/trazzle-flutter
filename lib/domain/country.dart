import 'dart:ui';

import 'package:flutter/material.dart';

class Country {
  final String id;
  final Path path;
  bool isSelected;
  Color color;

  Country({
    required this.id,
    required this.path,
    this.isSelected = false,
    this.color = Colors.grey
  });
}
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title
  });

  @override
  State<CustomAppBar> createState() => _AppBarState();
}

class _AppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

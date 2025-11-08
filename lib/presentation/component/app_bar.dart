import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title
  });

  @override
  State<AppBarWidget> createState() => _CustomAppBarWidgetState();

  // AppBar 높이 지정 (Figma: height 52px)
  @override
  Size get preferredSize => const Size.fromHeight(52.0);
}

class _CustomAppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        // Figma: Typography: h28
        style: Typo(PrimaryColors.p900).h18,
      ),
    );
  }
}

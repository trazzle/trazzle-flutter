import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  // AppBar 높이 지정 (Figma: height 52px)
  @override
  Size get preferredSize => const Size.fromHeight(52.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        // Figma: Typography: h18
        style: Typo(PrimaryColors.p900).h18,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/share_icon.svg',
            width: 24,
            height: 24,
          ),
          onPressed: null
        ),

        IconButton(
            icon: SvgPicture.asset(
              'assets/chart_icon.svg',
              width: 24,
              height: 24,
            ),
            onPressed: null
        ),
      ],
    );
  }
}

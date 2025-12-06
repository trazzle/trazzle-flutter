import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';

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

class TravelAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const TravelAppBar({
    super.key,
    required this.title
  });

  @override
  State<TravelAppBar> createState() => _TravelAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _TravelAppBarState extends State<TravelAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        widget.title,
        // Figma: Typography: h18
        style: Typo(PrimaryColors.p900).h18,
      ),
      actions: [
        IconButton(
          icon: SvgIcon(assets: Assets().shareIcon),
          onPressed: null
        ),

        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
              icon: SvgIcon(assets: Assets().chartIcon),
              onPressed: null
          ),
        ),
      ],
    );
  }
}

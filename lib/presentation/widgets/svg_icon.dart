import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatefulWidget {
  final String assets;

  const SvgIcon({
    super.key,
    required this.assets
  });

  @override
  State<SvgIcon> createState() => _SvgIconState();
}

class _SvgIconState extends State<SvgIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.assets,
      width: 24,
      height: 24,
    );
  }
}

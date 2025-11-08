import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trazzle/presentation/const/colors.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: null,
      backgroundColor: PrimaryColors.p500,
      shape: CircleBorder(),
      child: SvgPicture.asset(
        'assets/add_icon.svg',
        width: 24,
        height: 24,
      ),
    );
  }
}

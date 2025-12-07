import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, "/travel_i");
      },
      backgroundColor: PrimaryColors.p500,
      shape: CircleBorder(),
      child: SvgIcon(assets: Assets().addIcon)
    );
  }
}

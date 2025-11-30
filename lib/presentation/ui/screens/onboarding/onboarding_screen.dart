import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgIcon(assets: Assets().closeIcon),
          )
        ]
      ),
      body: Column(
        children: [
          Text(
            "이전에, 그리고 앞으로 있을",
            style: Typo(MainColors.white, FontStyle.medium).h28,
          )
        ],
      ),
    );
  }
}

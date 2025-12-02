import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/const.dart';
import 'package:trazzle/presentation/const/typography.dart';
import 'package:trazzle/presentation/widgets/slider.dart';
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
      body: Stack(
        children: [
          // 배경 슬라이더
          const BackgroundSlider(),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgIcon(assets: Assets().closeIcon),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "이전에,\n그리고 앞으로 있을",
                    style: Typo(MainColors.white, FontStyle.medium).h28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "당신의 모든 여행",
                    style: Typo(MainColors.white, FontStyle.extraBold).h28,
                  ),
                ),

                const SizedBox(height: 320),

                Center(
                  child: Container(
                    width: 343,
                    height: 52,
                    decoration: BoxDecoration(
                      color: ButtonColors.yellow, // color를 decoration 안으로
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(assets: "assets/kakao_icon.svg"),

                        const SizedBox(width: 8),

                        Text(
                          "카카오로 계속하기",
                          style: Typo(MainColors.g900, FontStyle.medium).button1,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Center(
                  child: Container(
                    width: 343,
                    height: 52,
                    decoration: BoxDecoration(
                      color: ButtonColors.white, // color를 decoration 안으로
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(assets: "assets/google_icon.svg"),

                        const SizedBox(width: 8),

                        Text(
                          "구글로 계속하기",
                          style: Typo(MainColors.g900, FontStyle.medium).button1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

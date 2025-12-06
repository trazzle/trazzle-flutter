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
                Expanded(
                  child: SingleChildScrollView(
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              width: 79.75,
                              height: 4,
                              color: MainColors.white,
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 6, left: 8),
                              width: 79.75,
                              height: 4,
                              color: MainColors.white,
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 6, left: 8),
                              width: 79.75,
                              height: 4,
                              color: MainColors.white,
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 6, left: 8),
                              width: 79.75,
                              height: 4,
                              color: MainColors.white,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 32,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "이전에,\n그리고 앞으로 있을",
                            style: Typo(MainColors.white, fontWeight: FontStyle.medium).h28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "당신의 모든 여행",
                            style: Typo(MainColors.white, fontWeight: FontStyle.extraBold).h28,
                          ),
                        ),

                        const SizedBox(height: 300),

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
                                  style: Typo(MainColors.g900, fontWeight: FontStyle.medium).button1,
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
                                  style: Typo(MainColors.g900, fontWeight: FontStyle.medium).button1,
                                )
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        Center(
                          child: Text(
                            "로그인 및 회원가입시, 아래 내용에 동의하는 것으로 간주됩니다",
                            style: Typo(MainColors.white, fontWeight: FontStyle.light).caption,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "약관 동의",
                                style: Typo(MainColors.white, fontWeight: FontStyle.medium, line: Line.underLine).button2,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "개인정보처리방침",
                                style: Typo(MainColors.white, fontWeight: FontStyle.medium, line: Line.underLine).button2,
                              ),
                            )
                          ],
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

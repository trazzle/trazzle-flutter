import 'package:flutter/material.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';

class TravelInsertScreen extends StatefulWidget {
  const TravelInsertScreen({super.key});

  @override
  State<TravelInsertScreen> createState() => _TravelInsertScreenState();
}

class _TravelInsertScreenState extends State<TravelInsertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.g50,
      appBar: TravelAppBar(title: "여행 기록"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
              bottom: 20
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '국가명으로 입력',
                hintStyle: Typo(MainColors.g200, fontWeight: FontStyle.regular).body1,
                filled: true,
                fillColor: MainColors.white,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

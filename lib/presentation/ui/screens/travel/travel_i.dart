import 'package:flutter/material.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/const.dart';
import 'package:trazzle/presentation/const/typography.dart';
import 'package:trazzle/presentation/util/filter.dart';
import 'package:trazzle/presentation/widgets/chip.dart';

class TravelInsertScreen extends StatefulWidget {
  const TravelInsertScreen({
    super.key
  });

  @override
  State<TravelInsertScreen> createState() => _TravelInsertScreenState();
}

class _TravelInsertScreenState extends State<TravelInsertScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = Const().countriesList;
  }

  void onChanged(String query) {
    setState(() {
      filteredCountries = Filters().filterCountries(Const().countriesList, query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.g50,
      appBar: TravelAppBar(title: "여행 기록"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 국가 검색 입력
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
                bottom: 20
              ),
              child: TextField(
                controller: searchController,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: '국가명으로 검색',
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

            // 대륙 칩
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Const().continentList.map((continent) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ActionChip(
                          backgroundColor: MainColors.white,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  width: 1,
                                  color: MainColors.g100
                              )
                          ),
                          elevation: 0.2,
                          shadowColor: Color(0xff000000),
                          label: Text(
                            continent,
                          ),
                          labelStyle: Typo(PrimaryColors.p900).button1,
                          onPressed: () {

                          },
                        )
                    );
                  }).toList(),
                ),
              ),
            ),

            // 총 개국 표시
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "총 ${filteredCountries.length}개국",
                    style: Typo(MainColors.g300, fontWeight: FontStyle.light).caption,
                  )
                ],
              ),
            ),

            // 국가 조회
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: filteredCountries.map((country) {
                    final index = filteredCountries.indexOf(country);
                    final isFirst = index == 0;

                    return SizedBox(
                      width: 343,
                      height: 52,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/travel_cities_i");
                        },
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: MainColors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              color: MainColors.white,
                              borderRadius: isFirst
                                  ? const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )
                                  : BorderRadius.zero, // 나머지는 radius 없음
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Text(
                                    country,
                                    style: Typo(MainColors.g900, fontWeight: FontStyle.medium).button1,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

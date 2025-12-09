import 'package:flutter/material.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/const.dart';
import 'package:trazzle/presentation/const/typography.dart';
import 'package:trazzle/presentation/util/filter.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';

class CitiesInsertScreen extends StatefulWidget {
  const CitiesInsertScreen({super.key});

  @override
  State<CitiesInsertScreen> createState() => _CitiesInsertScreenState();
}

class _CitiesInsertScreenState extends State<CitiesInsertScreen> {
  TextEditingController searchController = TextEditingController();

  Set<int> selectedIndexes = {};
  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = Const().citiesList;
  }

  void onChanged(String query) {
    setState(() {
      filteredCities = Filters().filterCities(Const().citiesList, query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColors.g50,
        appBar: TravelAppBar(title: "대한민국"),
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
                      hintText: '도시명을 검색',
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

              // 총 개국 표시
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "총 ${filteredCities.length}개 도시",
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
                    children: filteredCities.map((country) {
                      final index = filteredCities.indexOf(country);
                      final isFirst = index == 0;

                      return SizedBox(
                        width: 343,
                        height: 52,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedIndexes.contains(index)) {
                                selectedIndexes.remove(index);
                              } else {
                                selectedIndexes.add(index);
                              }
                            });
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      country,
                                      style: Typo(MainColors.g900, fontWeight: FontStyle.medium).button1,
                                    ),
                                    
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: selectedIndexes.contains(index)
                                          ? SvgIcon(assets: "assets/check_icon.svg")
                                          : const SizedBox(width: 24)
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

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1234")
                ],
              )
            ],
          ),
        )
    );
  }
}

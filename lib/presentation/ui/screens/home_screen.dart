import 'package:flutter/material.dart';
import 'package:trazzle/domain/country.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/component/button/floating_action.dart';
import 'package:trazzle/presentation/ui/painter/painter.dart';
import 'package:trazzle/presentation/viewmodel/countries_viewmodel.dart';
import 'package:trazzle/presentation/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Country> countries = [];
  final TransformationController _controller = TransformationController();

  // SVG viewBox 크기 (SVG 파일에 맞게 설정)
  final double viewBoxWidth = 628;
  final double viewBoxHeight = 310;

  @override
  void initState() {
    super.initState();
    loadSvg();
  }

  Future<void> loadSvg() async {
    countries = await parseCountries(context, "assets/country/world_map.svg");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Trazzle에서 내 여행을 기록해요!"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTapUp: (details) {
              // 화면 좌표 → SVG(viewBox) 좌표로 변환
              final svgPoint = _controller.toScene(details.localPosition);

              for (final c in countries) {
                if (c.path.contains(svgPoint)) {
                  setState(() {
                    c.isSelected = true;
                  });
                  break;
                }
              }
            },
            child: InteractiveViewer(
              transformationController: _controller,
              minScale: 1.0,
              maxScale: 5.0,
              child: CustomPaint(
                size: Size(viewBoxWidth, viewBoxHeight), // SVG viewBox 크기
                painter: WorldMapPainter(countries),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingAction(),
    );
  }
}

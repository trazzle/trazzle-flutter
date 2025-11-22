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

    // 초기 scale 1.5 설정
    _controller.value = Matrix4.identity()..scale(1.5);

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
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // SVG 비율 유지
          final widthScale = screenWidth / viewBoxWidth;
          final heightScale = screenHeight / viewBoxHeight;
          final scale = widthScale < heightScale ? widthScale : heightScale;

          final painterWidth = viewBoxWidth * scale;
          final painterHeight = viewBoxHeight * scale;

          return Column(
            children: [
              Center(
                child: GestureDetector(
                  onTapUp: (details) {
                    // 화면 좌표 → SVG(viewBox) 좌표로 변환
                    final svgPoint = _controller.toScene(details.localPosition);

                    for (final c in countries) {
                      if (c.path.contains(svgPoint)) {
                        if (c.isSelected) {
                          setState(() {
                            c.isSelected = false;
                          });
                        } else {
                          setState(() {
                            c.isSelected = true;
                          });
                        }
                        break;
                      }
                    }
                  },
                  child: InteractiveViewer(
                    transformationController: _controller,
                    minScale: 1.0,
                    maxScale: 3.0,
                    boundaryMargin: const EdgeInsets.all(500),  // 패닝 허용 넓힘
                    constrained: false,  // ★ 가장 중요
                    child: SizedBox(
                      width: painterWidth,      // ★ expand 금지
                      height: painterHeight,    // ★ expand 금지
                      child: CustomPaint(
                        size: Size(painterWidth, painterHeight),
                        painter: WorldMapPainter(countries),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingAction(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:trazzle/domain/country.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/component/button/floating_action.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/const.dart';
import 'package:trazzle/presentation/ui/painter/painter.dart';
import 'package:trazzle/presentation/viewmodel/countries_viewmodel.dart';
import 'package:trazzle/presentation/widgets/chip.dart';

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

          final widthScale = screenWidth / viewBoxWidth;
          final heightScale = screenHeight / viewBoxHeight;
          final scale = widthScale < heightScale ? widthScale : heightScale;

          final painterWidth = viewBoxWidth * scale;
          final painterHeight = viewBoxHeight * scale;

          return Column(
            children: [
              // 대륙 Chip Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: Const().continentList.map((continent) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ActionChips(continent: continent)
                    );
                  }).toList(),
                ),
              ),

              // 지도 영역
              Expanded(
                child: GestureDetector(
                  onTapUp: (details) {
                    final svgPoint = _controller.toScene(details.localPosition);

                    for (final c in countries) {
                      if (c.path.contains(svgPoint)) {
                        setState(() {
                          c.isSelected = !c.isSelected;
                        });
                        break;
                      }
                    }
                  },
                  child: InteractiveViewer(
                    transformationController: _controller,
                    minScale: 1.0,
                    maxScale: 3.0,
                    boundaryMargin: const EdgeInsets.all(500),
                    constrained: false,
                    child: SizedBox(
                      width: painterWidth,
                      height: painterHeight,
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
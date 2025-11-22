import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/component/button/floating_action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Trazzle에서 내 여행을 기록해요!"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 화면 크기
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // 초기 스케일
          final initialScale = 3.0;

          // 중앙 정렬을 위한 offset 계산
          final dx = (screenWidth - (screenWidth * initialScale)) / 2;
          final dy = (screenHeight - (screenHeight * initialScale)) / 2;

          // 초기 Transform 설정
          _controller.value = Matrix4.identity()
            ..translate(dx, dy)
            ..scale(initialScale);

          return InteractiveViewer(
            transformationController: _controller,
            minScale: 3,
            maxScale: 5,
            boundaryMargin: EdgeInsets.zero,
            constrained: true,
            clipBehavior: Clip.hardEdge,
            child: SizedBox.expand(
              child: SvgPicture.asset(
                "assets/country/world_map.svg",
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingAction(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trazzle/presentation/component/bar/bottom_navi_bar.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/ui/screens/home_screen.dart';
import 'package:trazzle/presentation/ui/screens/story_screen.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trazzle 프로젝트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    StoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgIcon(assets: Assets().globalIcon),
            activeIcon: SvgIcon(assets: Assets().globalActiveIcon),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(assets: Assets().bookIcon),
            activeIcon: SvgIcon(assets: Assets().bookActiveIcon),
            label: '지도집',
          ),
        ],
        selectedItemColor: PrimaryColors.p900,
      ),
    );
  }
}
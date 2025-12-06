import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/assets.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/ui/screens/home_s.dart';
import 'package:trazzle/presentation/ui/screens/onboarding/onboarding_s.dart';
import 'package:trazzle/presentation/ui/screens/story_s.dart';
import 'package:trazzle/presentation/widgets/svg_icon.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trazzle 프로젝트',
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
        backgroundColor: MainColors.white,
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
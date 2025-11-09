import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trazzle/presentation/component/bar/bottom_navi_bar.dart';
import 'package:trazzle/presentation/ui/screens/home_screen.dart';

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
      home: const BottomNaviBar(),
    );
  }
}
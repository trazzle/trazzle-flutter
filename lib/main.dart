import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trazzle/presentation/screens/home_screen.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 투명하게
        statusBarIconBrightness: Brightness.dark, // 아이콘 색상 (Android)
      ),
    );

    return MaterialApp(
      title: 'Trazzle 프로젝트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
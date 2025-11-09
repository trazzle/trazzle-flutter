import 'package:flutter/material.dart';
import 'package:trazzle/presentation/component/bar/app_bar.dart';
import 'package:trazzle/presentation/component/button/floating_action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Trazzle에서 내 여행을 기록해요!"),
      body: Center(

      ),
      floatingActionButton: FloatingAction(),
    );
  }
}

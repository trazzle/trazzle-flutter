import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/const.dart';

class BackgroundSlider extends StatefulWidget {
  const BackgroundSlider({super.key});

  @override
  State<BackgroundSlider> createState() => _BackgroundSliderState();
}

class _BackgroundSliderState extends State<BackgroundSlider> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = ((_currentIndex + 1) % Const().images.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 2),
      child: Container(
        key: ValueKey(_currentIndex),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Const().images[_currentIndex]),
            fit: BoxFit.cover,
          ),
        ),
      ),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/const.dart';

class BackgroundSlider extends StatefulWidget {
  final Function(int index) onPageChanged;

  const BackgroundSlider(
      this.onPageChanged,
      {super.key}
  );

  @override
  State<BackgroundSlider> createState() => _BackgroundSliderState();
}

class _BackgroundSliderState extends State<BackgroundSlider> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _currentIndex = ((_currentIndex + 1) % Const().images.length);
      });

      print("Slider: $_currentIndex");

      widget.onPageChanged(_currentIndex);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 5),
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

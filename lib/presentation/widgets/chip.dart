import 'package:flutter/material.dart';
import 'package:trazzle/presentation/const/colors.dart';

class ActionChips extends StatefulWidget {
  final String continent;

  const ActionChips({
    super.key,
    required this.continent
  });

  @override
  State<ActionChips> createState() => _ActionChipsState();
}

class _ActionChipsState extends State<ActionChips> {
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: MainColors.white,
      shape: StadiumBorder(
          side: BorderSide(
              width: 1,
              color: MainColors.g100
          )
      ),
      elevation: 0.2,
      shadowColor: Color(0xff000000),
      label: Text(widget.continent),
      onPressed: () {

      },
    );
  }
}

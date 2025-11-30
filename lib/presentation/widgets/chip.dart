import 'package:flutter/material.dart';
import 'package:trazzle/domain/country.dart';
import 'package:trazzle/presentation/const/colors.dart';
import 'package:trazzle/presentation/const/typography.dart';

class ActionChips extends StatefulWidget {
  final List<Country> countries;
  final String continent;
  final bool isSelected;

  const ActionChips({
    super.key,
    required this.countries,
    required this.continent,
    required this.isSelected
  });

  @override
  State<ActionChips> createState() => _ActionChipsState();
}

class _ActionChipsState extends State<ActionChips> {

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: MainColors.white,
      shape: StadiumBorder(
          side: _isSelected ? BorderSide(
              width: 1,
              color: PrimaryColors.p500
          ) : BorderSide(
              width: 1,
              color: MainColors.g100
          )
      ),
      elevation: 0.2,
      shadowColor: Color(0xff000000),
      label: Text(
        widget.continent,
      ),
      labelStyle: _isSelected ? Typo(PrimaryColors.p900).button1 : Typo(MainColors.g600).button1,
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;

          final continentCountries = widget.countries.where((c) => c.continent == widget.continent);

          for (var country in continentCountries) {
            country.isSelected = _isSelected;
          }

          print("Chip: $_isSelected");
        });
      },
    );
  }
}

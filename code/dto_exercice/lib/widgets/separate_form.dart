import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/line.dart';
import 'package:flutter/material.dart';

class SeparatorForm extends StatelessWidget {
  const SeparatorForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Line(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Text(
              'Où',
              style: kLabelStyle,
            ),
          ),
          Line(),
        ],
      ),
    );
  }
}
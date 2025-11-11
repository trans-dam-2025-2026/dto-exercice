import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  const WButton({super.key, required this.ontap, required this.title});

  final GestureTapCallback ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kAllPadding),
          child: Text(title, style: kButtonStyle),
        ),
      ),
    );
  }
}

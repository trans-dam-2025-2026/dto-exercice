import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(child: Container(height: kWidth/2, color: kMainColor,));
  }
}
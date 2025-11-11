import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:flutter/material.dart';

@immutable
class TextInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final int isTextArea;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;

  const TextInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isTextArea = 1,
    this.controller,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              labelText,
              style: kLabelStyle,
            )),
        TextFormField(
          minLines: isTextArea,
          maxLines: isTextArea,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            semanticCounterText: labelText,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: kVerticalPadding/2),
            filled: true,
            fillColor: kWhiteColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            errorStyle: kErrorStyle,
            hintStyle: kHintStyle,
          ),
        ),
      ],
    );
  }
}

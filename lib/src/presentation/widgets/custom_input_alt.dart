import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomInputAlt extends StatelessWidget {
  final String label;
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  const CustomInputAlt({
    super.key,
    required this.label,
    this.textController,
    this.textInputAction,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.textController,
      textInputAction: this.textInputAction ?? TextInputAction.next,
      keyboardType: this.textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderDefaultColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderDefaultColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderDefaultColor,
          ),
        ),
        label: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(this.label),
        ),
        floatingLabelStyle: CustomFontStyle.text400Normal12px(
          textLighterColor,
          letterSpacing: true,
        ),
      ),
    );
  }
}

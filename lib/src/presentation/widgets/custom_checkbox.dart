import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(bool? newValue) onValueChange;
  final String label;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onValueChange,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: this.isChecked,
          onChanged: this.onValueChange,
          side: BorderSide(
            color: borderDefaultColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          checkColor: aPrimaryDefault,
          activeColor: greenSelection,
        ),
        Text(
          this.label,
          style: CustomFontStyle.text400Normal14px(textDefaultColor),
        )
      ],
    );
  }
}
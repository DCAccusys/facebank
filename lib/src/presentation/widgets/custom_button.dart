import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: this.buttonColor ?? aPrimaryDisabled,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            this.text,
            style: CustomFontStyle.text500Normal16px(
              this.textColor ?? textOnbuttonDisabled,
            ),
          ),
        ),
      ),
    );
  }
}

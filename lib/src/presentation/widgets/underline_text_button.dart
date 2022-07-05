import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class UnderlineTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;

  const UnderlineTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        child: Text(
          this.text,
          style: CustomFontStyle.text400Normal14px(
            this.textColor ?? textDefaultColor,
            withUnderline: true,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

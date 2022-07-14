import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomOurlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? borderAndTextColor;
  final Color? background;

  const CustomOurlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderAndTextColor,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: CustomFontStyle.text500Normal12px(
          this.borderAndTextColor ?? aPrimaryDefault,
          letterSpacing: true,
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: this.borderAndTextColor ?? aPrimaryDefault),
        primary: this.background ?? bgPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CustomMenuItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool? isActive;
  final VoidCallback onPressed;

  const CustomMenuItem({
    super.key,
    required this.svgPath,
    required this.label,
    this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16),
        height: 40,
        padding: EdgeInsets.all(9.25),
        decoration: this.isActive ?? false
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: greenSelection,
              )
            : null,
        child: Row(
          children: [
            SvgPicture.asset(this.svgPath),
            SizedBox(
              width: 9.25,
            ),
            Text(
              this.label,
              style: CustomFontStyle.text400Normal14px(
                textDefaultColor,
                letterSpacing: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

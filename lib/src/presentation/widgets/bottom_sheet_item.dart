import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class BottomShetItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback? onPressed;
  final bool? isLastItem;

  const BottomShetItem({
    super.key,
    required this.svgPath,
    required this.label,
    this.onPressed,
    this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 18.5,
          top: 18.5,
          right: 8,
          left: 16,
        ),
        decoration: BoxDecoration(
          border: this.isLastItem ?? false
              ? null
              : Border(
                  bottom: BorderSide(
                    color: borderDefaultColor,
                  ),
                ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(this.svgPath),
            SizedBox(
              width: 12,
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

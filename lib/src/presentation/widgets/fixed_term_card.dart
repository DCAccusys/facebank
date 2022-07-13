import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class FixedTermCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final VoidCallback? onPressed;

  const FixedTermCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: 251,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(
          right: 8,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: blackColor009,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32.2,
              height: 32.2,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: bgTertiary,
              ),
              child: SvgPicture.asset('assets/images/svg/stat-up.svg'),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.title,
                    style: CustomFontStyle.text500Normal14px(
                      textDefaultColor,
                      isBold: true,
                      letterSpacing: true,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    this.subtitle,
                    style: CustomFontStyle.text400Normal12px(
                      textLighterColor,
                      letterSpacing: true,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    this.amount,
                    style: CustomFontStyle.text500Normal18px(
                      textDefaultColor,
                      isBold: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
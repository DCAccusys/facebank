import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class InformativeProductCard extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String description;

  const InformativeProductCard({
    super.key,
    this.onPressed,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 75,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset('assets/images/cards.png'),
            SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  this.title,
                  style: CustomFontStyle.text500Normal14px(
                    textDefaultColor,
                    isBold: true,
                  ),
                ),
                Text(
                  this.description,
                  style: CustomFontStyle.text400Normal12px(
                    textLighterColor,
                    letterSpacing: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
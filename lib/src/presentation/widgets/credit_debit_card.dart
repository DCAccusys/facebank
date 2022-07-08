import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class CreditOrDebitCardInfo extends StatelessWidget {
  final String type;
  final String brand;
  final String maskedNumber;
  final VoidCallback? onPressed;

  const CreditOrDebitCardInfo({
    super.key,
    required this.type,
    required this.brand,
    required this.maskedNumber,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 8, bottom: 9.5, top: 9.5, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/mastercard.png',
            width: 61,
            height: 43,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.type,
                  style: CustomFontStyle.text500Normal14px(
                    textDefaultColor,
                    letterSpacing: true,
                    isBold: true,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  this.brand,
                  style: CustomFontStyle.text400Normal12px(
                    textLighterColor,
                    letterSpacing: true,
                  ),
                )
              ],
            ),
          ),
          Text(
            this.maskedNumber,
            style: CustomFontStyle.text500Normal14px(
              textLighterColor,
              letterSpacing: true,
              isBold: true,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';
import '../../config/constants/icon_routes.dart';

class AccountCardItem extends StatelessWidget {
  final String label;
  final String amount;
  final bool? isPrimary;
  final VoidCallback? onPressed;

  const AccountCardItem({
    super.key,
    required this.label,
    required this.amount,
    this.isPrimary,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 22.23,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: (this.isPrimary ?? false)
              ? cardPrimaryDefaultColor
              : cardSecondary,
          boxShadow: [
            BoxShadow(
              color: (this.isPrimary ?? false)
                  ? cardPrimaryShadow
                  : cardSecondaryShadow,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  (this.isPrimary ?? false)
                      ? IconRoutes.iconDollarAccountPng
                      : IconRoutes.iconDollarAccountAltPng,
                  width: 59.36,
                  height: 65.54,
                ),
              ],
            ),
            Spacer(),
            Text(
              this.label,
              style: CustomFontStyle.text400Normal14px(
                textDefaultColor,
                letterSpacing: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.amount,
              style: CustomFontStyle.text500Normal16px(
                textDefaultColor,
                isBold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

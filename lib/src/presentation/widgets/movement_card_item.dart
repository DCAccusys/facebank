import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';
import '../../config/constants/icon_routes.dart';

class MovementCardItem extends StatelessWidget {
  final String title;
  final String dateAndDetail; // Change this when implement it
  final String amount;
  final String movementType; // Change this when implement it

  const MovementCardItem(
      {super.key,
      required this.title,
      required this.dateAndDetail,
      required this.amount,
      required this.movementType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 61,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderDefaultColor,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          this.movementType == 'exit'
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: iconExitBackgroundColor,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: SvgPicture.asset(
                      IconRoutes.creditCardSvg,
                      color: iconExitColor,
                    ),
                  ),
                )
              : Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: iconEntryBackgroundColor,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: SvgPicture.asset(
                      IconRoutes.receiveDollarsSvg,
                      color: iconEntryColor,
                    ),
                  ),
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
                  overflow: TextOverflow.ellipsis,
                  style: CustomFontStyle.text400Normal16px(
                    textDefaultColor,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  this.dateAndDetail,
                  style: CustomFontStyle.text400Normal12px(
                    textLighterColor,
                    letterSpacing: true,
                  ),
                ),
              ],
            ),
          ),
          Text(
            this.amount,
            style: CustomFontStyle.text500Normal14px(
              textDefaultColor,
              letterSpacing: true,
              isBold: true,
            ),
          )
        ],
      ),
    );
  }
}

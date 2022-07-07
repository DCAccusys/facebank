import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback? onPressed;
  final bool? isActive;
  final bool isBottomMenu;

  const HorizontalMenuItem({
    super.key,
    required this.label,
    required this.iconPath,
    this.onPressed,
    this.isActive,
    this.isBottomMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: this.onPressed,
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: this.isActive ?? false ? blackColor : whiteColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  this.isBottomMenu
                      ? BoxShadow(
                          color: Colors.transparent,
                        )
                      : BoxShadow(
                          color: blackColor.withOpacity(0.09),
                          offset: Offset(1, 1),
                        )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  this.iconPath,
                  color: !this.isBottomMenu
                      ? blackColor
                      : this.isActive ?? false
                          ? whiteColor
                          : blackColor,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              this.label,
              textAlign: TextAlign.center,
              style: CustomFontStyle.text400Normal12px(
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

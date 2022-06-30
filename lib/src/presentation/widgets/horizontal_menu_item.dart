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
                color: this.isActive ?? false ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  this.isBottomMenu
                      ? BoxShadow(
                          color: Colors.transparent,
                        )
                      : BoxShadow(
                          color: Colors.black.withOpacity(0.09),
                          offset: Offset(1, 1),
                        )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(this.iconPath),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff1F2836),
                  height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback? onPressed;
  final bool? isActive;

  const HorizontalMenuItem({
    super.key,
    required this.label,
    required this.iconPath,
    this.onPressed,
    this.isActive,
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
                ),
                child: Center(
                  child: SvgPicture.asset(this.iconPath),
                )),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/constants/colors.dart';
import '../../config/constants/fonts_styles.dart';

class NewsCard extends StatelessWidget {

  final VoidCallback? onClosePresed;

  const NewsCard({super.key, this.onClosePresed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: newsCardColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned(
              bottom: -40,
              right: -30,
              child: Container(
                width: 134,
                height: 134,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(150),
                  color: whiteColor,
                ),
              ),
            ),
            Positioned(
              right: 11,
              top: 18.5,
              child: GestureDetector(
                onTap: this.onClosePresed,
                child: SvgPicture.asset(
                  'assets/images/svg/close.svg',
                ),
              ),
            ),
            Positioned(
              right: 29,
              bottom: 21.43,
              child: GestureDetector(
                child: Image.asset(
                  'assets/images/money-hand.png',
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nuevos préstamos Online',
                      style: CustomFontStyle
                          .text500Normal16px(
                        textDefaultColor,
                        isBold: true,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'No esperes más y accede al\npréstamo que necesitas.',
                      style: CustomFontStyle
                          .text400Normal14px(
                        textLighter2Color,
                        letterSpacing: true,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Conocer más',
                        style: CustomFontStyle
                            .text500Normal12px(
                          textLighterColor,
                          letterSpacing: true,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            8,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        primary: whiteColor,
                        elevation: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
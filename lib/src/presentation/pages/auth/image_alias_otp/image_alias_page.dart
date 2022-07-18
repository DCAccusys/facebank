import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/constants/colors.dart';
import '../../../../config/constants/fonts_styles.dart';
import 'image_alias_controller.dart';

class ImageAliasOTPPage extends GetView<ImageAliasOTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Column(
            children: [
              _getStepHeader(controller),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  children: controller.pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStepHeader(ImageAliasOTPController controller) {
    return Container(
      padding: EdgeInsets.only(
        right: 20,
        bottom: 18,
        top: 18,
      ),
      width: double.infinity,
      height: 76,
      color: bgPrimary,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            // onTap: controller.backButtonClicked,
            icon: SvgPicture.asset('assets/images/svg/icon-container.svg'),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingreso',
                  style: CustomFontStyle.text400Normal12px(
                    textLighterColor,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.headerTitle[controller.currentPage.value],
                    style: CustomFontStyle.text500Normal16px(
                      textDefaultColor,
                      isBold: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

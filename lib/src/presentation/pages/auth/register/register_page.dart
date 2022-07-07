import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/core/fade_in_indexed_stack.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return controller.backButtonClicked();
          },
          child: Obx(
            () => Column(
              children: [
                _getStepHeader(controller),
                Expanded(
                  child: FadeIndexedStack(
                    index: controller.stackIndex.value,
                    children: controller.steps,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _getStepHeader(RegisterController controller) {
    return Container(
      padding: EdgeInsets.only(
        right: 20,
        bottom: 18,
        top: 18,
        left: 16,
      ),
      width: double.infinity,
      height: 76,
      color: bgPrimary,
      child: Row(
        children: [
          GestureDetector(
            onTap: controller.backButtonClicked,
            child: SvgPicture.asset('assets/images/svg/icon-container.svg'),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.titlesString[controller.stackIndex.value],
                    style: CustomFontStyle.text400Normal12px(
                      textLighterColor,
                    ),
                  ),
                  Text(
                    controller.subtitlesString[controller.stackIndex.value],
                    style: CustomFontStyle.text500Normal16px(
                      textDefaultColor,
                      isBold: true
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  'Paso ${controller.stackIndex.value + 1}/9',
                  style: CustomFontStyle.text400Normal12px(
                    textLighterColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

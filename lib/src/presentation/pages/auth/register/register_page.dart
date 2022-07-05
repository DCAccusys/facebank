import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/core/fade_in_indexed_stack.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:facebank/src/presentation/pages/auth/register/steps/step_1.dart';
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
            controller.backButtonClicked();
            return true;
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 20,
                  bottom: 18,
                  top: 18,
                  left: 16,
                ),
                width: double.infinity,
                height: 76,
                color: Color(0xffF3F5F8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controller.backButtonClicked,
                      child: SvgPicture.asset(
                          'assets/images/svg/icon-container.svg'),
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
                            'Etapa 1: Registro',
                            style: CustomFontStyle.text400Normal12px(
                              textLighterColor,
                            ),
                          ),
                          Text(
                            'Identificación',
                            style: CustomFontStyle.text500Normal16px(
                              textDefaultColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Paso 1/9',
                          style: CustomFontStyle.text400Normal12px(
                            textLighterColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: FadeIndexedStack(
                  index: 0,
                  children: [
                    Step1(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

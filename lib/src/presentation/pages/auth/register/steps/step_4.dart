import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/core/common_functions.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:facebank/src/presentation/widgets/custom_button.dart';
import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step4 extends StatelessWidget {
  const Step4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 16,
              ),
              physics: BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cambia tu contraseña por una nueva',
                      style: CustomFontStyle.text500Normal28px(
                        textDefaultColor,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      isPasswordVisible: controller.isNewPasswordVisible.value,
                      textController: controller.newPasswordInputText,
                      text: 'Nueva contraseña',
                      placeholder: 'Contraseña',
                      isPasswordField: true,
                      helperText: 'Debe tener 1 mayuscula y 1 caracter',
                      onShowHidePressed: controller.changeNewPasswordVisible,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      isPasswordVisible:
                          controller.isConfirmPasswordVisible.value,
                      textController: controller.confirmPasswordInputText,
                      text: 'Repetir nueva contraseña',
                      placeholder: 'Contraseña',
                      isPasswordField: true,
                      onShowHidePressed:
                          controller.changeConfirmPasswordVisible,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: CustomButton(
              text: 'Siguiente',
              onPressed: () {
                controller.nextButton3Clicked();
                CommonFunctions.showTopBanner(
                  'Exito!',
                  'Generaste tu contraseña',
                );
              },
              buttonColor: brandMain,
            ),
          )
        ],
      ),
    );
  }
}

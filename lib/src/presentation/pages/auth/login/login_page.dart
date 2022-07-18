import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/config/constants/icon_routes.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_binding.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_page.dart';
import 'package:facebank/src/presentation/widgets/custom_button.dart';
import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandMain,
      body: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 168,
                child: Center(
                  child: Image.asset(
                    IconRoutes.logoFBWhitePng,
                    width: 188.78,
                    height: 25.56,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 24,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inicia sesión',
                        style: CustomFontStyle.text500Normal24px(
                          textDefaultColor,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomInputField(
                        textController: controller.userInputController,
                        text: 'Nombre de usuario',
                        placeholder: 'Usuario',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Obx(
                        () => CustomInputField(
                          textController: controller.passwordInputController,
                          text: 'Contraseña',
                          placeholder: 'contraseña',
                          isPasswordField: true,
                          isPasswordVisible:
                              controller.isPasswordVisible.value,
                          onShowHidePressed:
                              controller.changePasswordVisibility,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // TODO: forgot password
                              print('Forgot password');
                            },
                            child: Text(
                              'Olvidaste tu contraseña?',
                              style: CustomFontStyle.text500Normal12px(
                                textLighterColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RegisterPage(),
                                binding: RegisterBinding(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Si aún no te registraste',
                                  style: CustomFontStyle.text500Normal14px(
                                    textDefaultColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Regístrate aqui',
                                  style: CustomFontStyle.text400Normal14px(
                                    textDefaultColor,
                                    isBold: true,
                                    withUnderline: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        text: 'Siguiente',
                        onPressed: controller.onSigninButtonClicked,
                        buttonColor: brandMain,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

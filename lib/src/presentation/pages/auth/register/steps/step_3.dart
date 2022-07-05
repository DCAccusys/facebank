import 'package:animate_do/animate_do.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/underline_text_button.dart';

class Step3 extends StatelessWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
        top: 24,
      ),
      width: double.infinity,
      height: double.infinity,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Revisa tu email',
              style: CustomFontStyle.text500Normal28px(
                textDefaultColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Te mandamos una contraseña temporal para que puedas iniciar sesión por primera vez a ',
                    style: CustomFontStyle.text400Normal14px(
                      textLighterColor,
                    ),
                  ),
                  TextSpan(
                    text: 's***a@gmail.com',
                    style: CustomFontStyle.text400Normal14px(
                      textLighterColor,
                      isBold: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Obx(
              () => CustomInputField(
                textController: controller.tempPasswordInputText,
                text: 'Contraseña temporal',
                placeholder: 'contraseña',
                isPasswordField: true,
                isPasswordVisible: controller.isPasswordVisible.value,
                onShowHidePressed: controller.changePasswordStateVisibility,
                textInputAction: TextInputAction.done,
              ),
            ),
            Spacer(),
            Visibility(
              visible: !controller.isKeyboard3Visible.value,
              child: FadeIn(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    '¿No recibiste la contraseña?',
                    style: CustomFontStyle.text500Normal14px(
                      textDefaultColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: !controller.isKeyboard3Visible.value,
              child: FadeIn(
                child: UnderlineTextButton(
                  text: 'Reenviar contraseña',
                  onPressed: controller.resendTempPassword,
                  isBold: true,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Visibility(
              visible: !controller.isKeyboard3Visible.value,
              child: FadeIn(
                child: CustomButton(
                  onPressed: controller.isNextButton3Enabled.value
                      ? controller.nextButton3Clicked
                      : null,
                  text: 'Siguiente',
                  buttonColor: controller.isNextButton3Enabled.value
                      ? brandMain
                      : aPrimaryDisabled,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

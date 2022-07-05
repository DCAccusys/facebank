import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_field.dart';
import '../../../../widgets/underline_text_button.dart';
import '../register_controller.dart';

class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
        top: 24,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido!',
              style: CustomFontStyle.text500Normal28px(
                textDefaultColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Ingresa el nombre de usuario con el que abriste la cuenta. Si no lo recuerdas revisa el correo que mandamos a tu correo electronico.',
              style: CustomFontStyle.text400Normal14px(
                textLighterColor,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            CustomInputField(
              textController: controller.userNameInputText,
              text: 'Nombre de usuario',
              placeholder: 'Usuario',
            ),
            Spacer(),
            Visibility(
              visible: !controller.isKeyboardVisible.value,
              child: Container(
                width: double.infinity,
                child: Text(
                  'Si te registraste anteriormente',
                  style: CustomFontStyle.text500Normal14px(
                    textDefaultColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: !controller.isKeyboardVisible.value,
              child: UnderlineTextButton(
                text: 'Inicia sesión',
                onPressed: controller.returnToLoginPage,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Visibility(
              visible: !controller.isKeyboardVisible.value,
              child: CutomButton(
                onPressed: controller.isNextButtonEnabled.value ? controller.nextButtonClicked : null,
                text: 'Siguiente',
                buttonColor: controller.isNextButtonEnabled.value
                    ? brandMain
                    : aPrimaryDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

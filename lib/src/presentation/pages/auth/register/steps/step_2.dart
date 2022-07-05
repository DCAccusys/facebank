import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:facebank/src/presentation/widgets/custom_button.dart';
import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step2 extends StatelessWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 16, right: 16, top: 24),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Hola, Susana Rivera!',
                      style:
                          CustomFontStyle.text500Normal28px(textDefaultColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Ingresa los datos con los que abriste tu cuenta.',
                      style:
                          CustomFontStyle.text400Normal14px(textLighterColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      textController: controller.emailInputText,
                      text: 'Email',
                      placeholder: 'ejemplo@gmail.com',
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      textController: controller.idNumerInputText,
                      text: 'Número de identificación',
                      placeholder: 'xxxxxxxxx',
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      textController: controller.accountNumberInputText,
                      text: 'Número de cuenta',
                      placeholder: 'xx-xxx-xxxxxx-x',
                      textInputType: TextInputType.number,
                      formatters: [controller.accountNumberFormatter],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    CustomInputField(
                      textController: controller.firstPetInputText,
                      text: '¿Cuál fue tu primera mascota?',
                      placeholder: 'Respuesta',
                      helperText:
                          'Esta pregunta fue elegida al crear tu cuenta.',
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _bottomButton(controller)
        ],
      ),
    );
  }

  Container _bottomButton(RegisterController controller) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: blackColor025,
            offset: Offset(0, -1),
            blurRadius: 14,
          )
        ],
      ),
      child: CustomButton(
        text: 'Siguiente',
      ),
    );
  }
}

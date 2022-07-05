import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';

class Step6 extends StatelessWidget {
  const Step6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
        top: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingresa el código de validación',
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
                  text: 'Enviamos este codigo a tu mail ',
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
          _getPinInput(controller, context)
        ],
      ),
    );
  }

  Widget _getPinInput(RegisterController controller, BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 62,
      textStyle: CustomFontStyle.text400Normal28px(textDefaultColor),
      decoration: BoxDecoration(
        border: Border.all(color: borderDefaultColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: cardPrimaryDefaultColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: cardPrimaryDefaultColor),
      borderRadius: BorderRadius.circular(8),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          length: 5,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (s) {
            return s == '2222' ? null : 'Pin is incorrect';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => print(pin),
        ),
      ],
    );
  }
}

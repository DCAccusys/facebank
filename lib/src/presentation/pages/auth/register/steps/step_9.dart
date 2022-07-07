import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../../core/common_functions.dart';
import '../../../../widgets/custom_button.dart';
import '../register_controller.dart';

class Step9 extends StatelessWidget {
  const Step9({Key? key}) : super(key: key);

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
              height: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                  top: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formulario W-8BEN',
                      style: CustomFontStyle.text500Normal28px(
                        textDefaultColor,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Al aceptar otorgas tu firma y confirmas que los datos en este formulario son correctos.',
                      style:
                          CustomFontStyle.text400Normal14px(textLighterColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: borderDefaultColor,
                        ),
                      ),
                      child: Image.asset('assets/images/dummy/DummyW8.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          this._bottomButton(controller, context)
        ],
      ),
    );
  }

  Widget _bottomButton(RegisterController controller, BuildContext context) {
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
      child: Obx(
        () => Column(
          children: [
            CustomButton(
              onPressed: controller.isNextButton5Enabled.value
                  ? () {
                      CommonFunctions.hideKeyboard(context);
                      CommonFunctions.showTopBanner('Registro completado exitosamente', 'Gracias por confiar en nosotros. Comienza a disfrutar tu cuenta de FACEBANK');
                      controller.nextButton9Clicked();
                    }
                  : null,
              buttonColor: controller.isNextButton5Enabled.value
                  ? brandMain
                  : aPrimaryDisabled,
              text: 'Siguiente',
            ),
          ],
        ),
      ),
    );
  }
}

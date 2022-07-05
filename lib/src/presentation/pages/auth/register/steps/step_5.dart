import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../../core/common_functions.dart';
import '../../../../widgets/custom_button.dart';
import '../register_controller.dart';

class Step5 extends StatelessWidget {
  const Step5({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(left: 16, right: 16, top: 24),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecciona una imagen y una palabra',
                    style: CustomFontStyle.text500Normal28px(textDefaultColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'La palabra es independiente a la imagen pero puede hacer referencia a ella. Se te pedirán los dos cada vez que quieras iniciar sesión.',
                    style: CustomFontStyle.text400Normal14px(textLighterColor),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 186,
                    child: Center(child: _getGridView(controller, context)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Obx(
                    () => CustomInputField(
                      textController: controller.imageAliasInputText,
                      text: 'Crea tu palabra',
                      placeholder: 'Palabra asociada con alias',
                      isPasswordField: true,
                      isPasswordVisible: controller.isImageAliasVisible.value,
                      onShowHidePressed: controller.changeImageAliasVisible,
                      textInputAction: TextInputAction.done,
                    ),
                  )
                ],
              ),
            ),
          ),
          _bottomButton(controller, context)
        ],
      ),
    );
  }

  Widget _getGridView(RegisterController controller, BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 8.2,
      mainAxisSpacing: 8.2,
      crossAxisCount: 4,
      children: List.generate(
        8,
        (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.13),
            color: bgTertiary,
          ),
        ),
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
        () => CustomButton(
          onPressed: controller.isNextButton5Enabled.value
              ? () {
                  CommonFunctions.hideKeyboard(context);
                  controller.nextButton2Clicked();
                }
              : null,
          buttonColor: controller.isNextButton5Enabled.value
              ? brandMain
              : aPrimaryDisabled,
          text: 'Siguiente',
        ),
      ),
    );
  }
}

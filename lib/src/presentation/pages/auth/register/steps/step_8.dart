import 'package:facebank/src/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../../core/common_functions.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../../core/custom_expansion_tile.dart' as custom;
import '../../../../widgets/custom_input_alt.dart';
import '../register_controller.dart';

class Step8 extends StatelessWidget {
  const Step8({Key? key}) : super(key: key);

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
                      'Verifica que los siguientes datos sean correctos e ingresa el numero de identificacion fiscal tributario de tu país. Una vez que confirmes mostraremos tu formulario de W-8BEN completado. ',
                      style:
                          CustomFontStyle.text400Normal14px(textLighterColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Obx(
                      () => _expandedTile(controller),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomInputAlt(
                      label: 'Nombre',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomInputAlt(
                      label: 'País de ciudadanía',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomInputAlt(
                      label: 'Dirección',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomInputAlt(
                      label: 'Ciudad',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomInputAlt(
                      label: 'Estado',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomInputAlt(
                      label: 'Código postal',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Hay algún dato mal? Te puedes comunicar con el banco al ',
                            style: CustomFontStyle.text400Normal14px(
                              textLighterColor,
                            ),
                          ),
                          TextSpan(
                            text: '123456789',
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
                    CustomInputField(
                      text: 'Número de identificación fiscal',
                      placeholder: 'xxxxxxxxxxx',
                      helperText: 'Este corresponde al de tu país',
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

  Widget _expandedTile(RegisterController controller) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.09),
              offset: Offset(1, 1),
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: custom.ExpansionTile(
          title: Text('¿Qué es el formulario W-8BEN?'),
          headerBackgroundColor:
              controller.isContentExpanded.value ? actionTertiaryPressed : null,
          onExpandedChange: (value) {
            controller.onChangeContentExtendSatate(value);
          },
          children: [
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
          ],
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
        () => Column(
          children: [
            CustomButton(
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
          ],
        ),
      ),
    );
  }
}

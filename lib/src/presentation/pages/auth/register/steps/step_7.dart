import 'package:facebank/src/config/constants/html-content.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../../core/common_functions.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_checkbox.dart';

class Step7 extends StatelessWidget {
  const Step7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: BouncingScrollPhysics(),
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
                          'Divulgaciones y Términos',
                          style: CustomFontStyle.text500Normal28px(
                            textDefaultColor,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderDefaultColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Html(
                            data: htmlContent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.buttonFloatinVisible.value,
                    child: _floatingButton(controller, context),
                  ),
                ),
              ],
            ),
          ),
          this._bottomButton(controller, context)
        ],
      ),
    );
  }

  Widget _floatingButton(RegisterController controller, BuildContext context) {
    return Positioned(
      right: 14.5,
      bottom: 18,
      child: Visibility(
        visible: true,
        child: GestureDetector(
          onTap: controller.onBottomScrollClicked,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: aSecondDefault,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/svg/download.svg',
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomButton(RegisterController controller, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 18, left: 16, right: 16, bottom: 16),
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
            CustomCheckbox(
              isChecked: controller.termsAndConditionChecked.value,
              onValueChange: (value) {
                controller.changeTermsAndConditionChecked(value!);
              },
              label: 'Acepto los términos y las condiciones',
            ),
            SizedBox(
              height: 18,
            ),
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

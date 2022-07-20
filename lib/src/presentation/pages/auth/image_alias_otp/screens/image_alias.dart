import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/constants/colors.dart';
import '../../../../../config/constants/fonts_styles.dart';
import '../../../../../core/common_functions.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_field.dart';
import '../image_alias_controller.dart';

class ImageAliasScreen extends StatelessWidget {
  const ImageAliasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ImageAliasOTPController>();
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
                    'Imagen y alias',
                    style: CustomFontStyle.text500Normal28px(textDefaultColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Selecciona tu imagen e ingresa tu alias.',
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
                      text: 'Alias',
                      placeholder: 'Alias',
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

  Widget _getGridView(
      ImageAliasOTPController controller, BuildContext context) {
    return Obx(
      () => GridView.count(
        primary: false,
        crossAxisSpacing: 8.2,
        mainAxisSpacing: 8.2,
        crossAxisCount: 4,
        children: controller.gettingImages.value
            ? List.generate(
                8,
                (index) => Shimmer.fromColors(
                  baseColor: bgTertiary,
                  highlightColor: bgTertiary.withOpacity(0.6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.13),
                      color: bgTertiary,
                    ),
                  ),
                ),
              )
            : List.generate(controller.imagesAliasItems.length, (index) {
                final imageItem = controller.imagesAliasItems[index];
                return GestureDetector(
                  onTap: () {
                    controller.setSelectedImageItem(imageItem);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.13),
                      border: controller.imageAliasSelected.value != null &&
                              controller.imageAliasSelected.value!.imgId ==
                                  imageItem.imgId
                          ? Border.all(color: brandMain)
                          : null,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.13),
                            child: FadeIn(
                              child: Image.memory(
                                base64Decode(imageItem.imgData),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        controller.imageAliasSelected.value != null &&
                                controller.imageAliasSelected.value!.imgId ==
                                    imageItem.imgId
                            ? Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: brandMain,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: whiteColor,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
              }),
      ),
    );
  }

  Widget _bottomButton(
      ImageAliasOTPController controller, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Obx(
        () => CustomButton(
          onPressed: controller.isNextButtonEnabled.value
              ? () {
                  CommonFunctions.hideKeyboard(context);
                  controller.onValidateImageAliasClicked();
                }
              : null,
          buttonColor: controller.isNextButtonEnabled.value
              ? brandMain
              : aPrimaryDisabled,
          text: 'Siguiente',
        ),
      ),
    );
  }
}

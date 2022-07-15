import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/constants/colors.dart';
import '../../../config/constants/fonts_styles.dart';
import '../../../config/constants/icon_routes.dart';
import 'account-detail_controller.dart';

class AccountDetailPage extends GetView<AccountDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary,
      body: SafeArea(
        child: Column(
          children: [
            _getAppBar(controller, context),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(

                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: whiteColor,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: generate PDF
                },
                child: Text(
                  'Descargar PDF',
                  style: CustomFontStyle.text500Normal16px(
                    textOnButtonColor,
                    isBold: true,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: whiteColor,
                  elevation: 0,
                  side: BorderSide(
                    color: textOnButtonColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getAppBar(AccountDetailController controller, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      color: bgPrimary,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: Get.back,
            child: SvgPicture.asset(IconRoutes.arrowLeftSvg),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              'Cuenta corriente',
              style: CustomFontStyle.text400Normal16px(
                textDefaultColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/config/constants/icon_routes.dart';
import 'package:facebank/src/presentation/pages/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widgets/account_card_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return FadeIn(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgPrimary,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _amountAppBar(controller, context),
              Text(
                'Saldo total',
                style: CustomFontStyle.text400Normal16px(textLighterColor),
              ),
              SizedBox(
                height: 4,
              ),
              _getTotalAmount(controller, context),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 100),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: controller.accountList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (controller.accountList.length == index) {
                        return _addNewAccountButton(controller, context);
                      } else {
                        final item = controller.accountList[index];
                        return AccountCardItem(
                          label: item.label,
                          amount: item.amount,
                          isPrimary: item.isPrimary,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addNewAccountButton(HomeController controller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: add new account button implementation
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: blackColor009,
              offset: Offset(1, 1),
            ),
          ],
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconRoutes.plusSvg),
            SizedBox(
              height: 5,
            ),
            Text(
              'Nueva cuenta',
              style: CustomFontStyle.text400Normal16px(
                textDefaultColor,
                letterSpacing: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _amountAppBar(HomeController controller, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24),
      height: 72,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // TODO: implement back button clicked
            },
            child: SvgPicture.asset(IconRoutes.arrowLeftSvg),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Cuenta corriente',
            style: CustomFontStyle.text400Normal16px(textDefaultColor),
          )
        ],
      ),
    );
  }

  Widget _getTotalAmount(HomeController controller, BuildContext context) {
    return Row(
      children: [
        Text(
          '\$13,500.00',
          style: CustomFontStyle.text500Normal24px(
            textDefaultColor,
            isBold: true,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            // TODO: implement show or hide amount
          },
          child: Row(
            children: [
              Text(
                'Ocultar saldos',
                style: CustomFontStyle.text400Normal12px(
                  textLighterColor,
                  letterSpacing: true,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              SvgPicture.asset(IconRoutes.eyeEmptySvg)
            ],
          ),
        ),
      ],
    );
  }
}

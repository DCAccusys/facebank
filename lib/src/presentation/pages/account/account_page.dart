import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/config/constants/icon_routes.dart';
import 'package:facebank/src/presentation/pages/account-detail/account-detail_binding.dart';
import 'package:facebank/src/presentation/pages/account-detail/account-detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/bottom_sheet_item.dart';
import '../../widgets/custom_outline_button.dart';
import '../../widgets/movement_card_item.dart';
import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: bgPrimary,
            automaticallyImplyLeading: false,
            title: _getAppBar(controller, context),
            pinned: true,
            expandedHeight: 274,
            flexibleSpace: FlexibleSpaceBar(
              background: _getExpandableContent(controller, context),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  _getMovementAndFilter(controller, context),
                  SizedBox(
                    height: 16,
                  ),
                  ...List.generate(
                    controller.movementList.length + 1,
                    (index) {
                      if (controller.movementList.length == index) {
                        return GestureDetector(
                          onTap: () {
                            // TODO: load more movement implementation
                            print('Load more movements');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 61,
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.only(bottom: 16),
                            child: Center(
                              child: Text(
                                'Cagrar más movimientos',
                                style: CustomFontStyle.text500Normal16px(
                                  textOnButtonColor,
                                  isBold: true,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        final movement = controller.movementList[index];
                        return MovementCardItem(
                          title: movement.text,
                          amount: movement.amount,
                          dateAndDetail: movement.dateAndDetail,
                          movementType: movement.movementType,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMovementAndFilter(
      AccountController controller, BuildContext context) {
    return Row(
      children: [
        Text(
          'Movimientos',
          style: CustomFontStyle.text400Normal16px(textLighterColor),
        ),
        Spacer(),
        Text(
          'Filtros',
          style: CustomFontStyle.text400Normal12px(
            textLighterColor,
            letterSpacing: true,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            // TODO: Do something
            print('Filter clicked');
          },
          child: Container(
            width: 40,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                color: textDefaultColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SvgPicture.asset(IconRoutes.filtersSvg),
            ),
          ),
        )
      ],
    );
  }

  Widget _getAppBar(AccountController controller, BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      color: bgPrimary,
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
          IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            onPressed: () {
              // TODO: Do something
              print('Click 1');
            },
            icon: SvgPicture.asset(IconRoutes.shareSvg),
          ),
          IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.bottomSheet(_buildBottomSheet(controller, context));
            },
            icon: SvgPicture.asset(IconRoutes.moreVertSvg),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(AccountController controller, BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          BottomShetItem(
            label: 'Hacer cuenta principal',
            svgPath: IconRoutes.starOutlineSvg,
          ),
          BottomShetItem(
            label: 'Detalle de cuenta',
            svgPath: IconRoutes.infoEmptySvg,
            onPressed: () {
              Get.to(
                () => AccountDetailPage(),
                binding: AccountDetailBinding(),
                transition: Transition.rightToLeft,
              );
            },
          ),
          BottomShetItem(
            label: 'Cambiar alias',
            svgPath: IconRoutes.editPencilSvg,
          ),
          BottomShetItem(
            label: 'Cambiar imagen de cuenta',
            svgPath: IconRoutes.emojiSvg,
          ),
          BottomShetItem(
            label: 'Ver resúmenes',
            svgPath: IconRoutes.googleDocsSvg,
            isLastItem: true,
          ),
        ],
      ),
    );
  }

  Widget _getExpandableContent(
      AccountController controller, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Cuenta principal',
            style: CustomFontStyle.text400Normal16px(
              textDefaultColor,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '476-363763-7',
            style: CustomFontStyle.text400Normal14px(
              textLighterColor,
              letterSpacing: true,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$4,500.00',
                style: CustomFontStyle.text500Normal32px(
                  textDefaultColor,
                  isBold: true,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Do something
                  print('Show hide account amount');
                },
                child: SvgPicture.asset(IconRoutes.eyeEmptySvg),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOurlineButton(
                text: 'Recibir dinero',
                onPressed: () {},
              ),
              SizedBox(
                width: 16,
              ),
              CustomOurlineButton(
                text: 'Enviar dinero',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

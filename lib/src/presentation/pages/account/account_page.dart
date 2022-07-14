import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/config/constants/icon_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                bottom: 120,
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
          GestureDetector(
            onTap: () {
              print('Clicked 1');
            },
            child: SvgPicture.asset(IconRoutes.shareSvg),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(_buildBottomSheet(controller, context));
            },
            child: SvgPicture.asset(IconRoutes.moreVertSvg),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSheet(AccountController controller, BuildContext context) {
    return Container(
      height: 289,
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

class BottomShetItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback? onPressed;
  final bool? isLastItem;

  const BottomShetItem({
    super.key,
    required this.svgPath,
    required this.label,
    this.onPressed,
    this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 18.5,
        top: 18.5,
        right: 8,
        left: 16,
      ),
      decoration: BoxDecoration(
        border: this.isLastItem ?? false
            ? null
            : Border(
                bottom: BorderSide(
                  color: borderDefaultColor,
                ),
              ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(this.svgPath),
          SizedBox(
            width: 12,
          ),
          Text(
            this.label,
            style: CustomFontStyle.text400Normal14px(
              textDefaultColor,
              letterSpacing: true,
            ),
          )
        ],
      ),
    );
  }
}
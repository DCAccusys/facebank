import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/presentation/pages/home/screens/accounts_screen.dart';
import 'package:facebank/src/presentation/pages/home/screens/main_home_screen.dart';
import 'package:facebank/src/presentation/pages/home/screens/troncal_menu.dart';
import 'package:facebank/src/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/horizontal_menu_item.dart';
import 'home_page_controller.dart';
import 'dart:io' show Platform;

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: [
                MainHomeScreen(),
                AccountScreen(),
                TroncalMenu(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: _bottomMenu(controller, context),
          )
        ],
      ),
      drawer: _getDrawerMenu(),
    );
  }

  Widget _getDrawerMenu() => Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 24,
                  bottom: 25,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: borderDefaultColor),
                  ),
                ),
                child: Text(
                  'Susana Rivera',
                  style: CustomFontStyle.text500Normal18px(
                    textLighterColor,
                    isBold: true,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                itemCount: controller.menuDrawerItems.length,
                itemBuilder: (context, index) {
                  final item = controller.menuDrawerItems[index];
                  return Obx(
                    () => CustomMenuItem(
                      svgPath: item.svgPath,
                      label: item.label,
                      onPressed: () {
                        controller.onChangeDrawerIndex(index);
                        // TODO: navigate to another page
                      },
                      isActive: index == controller.currentDrawerIndex.value,
                    ),
                  );
                },
              )),
              GestureDetector(
                onTap: () {
                  // TODO: logout event
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 24,
                    bottom: 25,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: borderDefaultColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/svg/log-out.svg'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Cerrar sesión',
                        style: CustomFontStyle.text400Normal14px(
                          textDefaultColor,
                          letterSpacing: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _bottomMenu(HomeController conteoller, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: Platform.isIOS ? 30 : 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, -5),
            blurRadius: 15,
          )
        ],
      ),
      child: Row(
          children: List.generate(
        controller.bottomMenuItems.length,
        (index) {
          final item = controller.bottomMenuItems[index];
          return Obx(
            () => HorizontalMenuItem(
              label: item.label,
              iconPath: item.svgPath,
              isBottomMenu: true,
              isActive: index == controller.currentBottomMenuIndex.value,
              onPressed: () {
                controller.onChangeBottomMenuIndex(index);
              },
            ),
          );
        },
      )

          /*  [
          HorizontalMenuItem(
            label: 'Home',
            iconPath: 'assets/images/svg/home-simple-door.svg',
            isBottomMenu: true,
          ),
          HorizontalMenuItem(
            label: 'Home',
            iconPath: 'assets/images/svg/grid-add.svg',
            isBottomMenu: true,
          ),
          HorizontalMenuItem(
            label: 'Home',
            iconPath: 'assets/images/svg/menu.svg',
            isBottomMenu: true,
          ),
        ], */
          ),
    );
  }
}

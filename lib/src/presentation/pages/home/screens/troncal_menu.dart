import 'package:animate_do/animate_do.dart';
import 'package:facebank/src/config/constants/colors.dart';
import 'package:facebank/src/config/constants/fonts_styles.dart';
import 'package:facebank/src/presentation/pages/home/home_page_controller.dart';
import 'package:facebank/src/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TroncalMenu extends StatelessWidget {
  const TroncalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SafeArea(
      child: FadeIn(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 100,
            ),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: this._buildList(context, controller),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildList(BuildContext context, HomeController controller) {
    List<Widget> menuList = <Widget>[];
    String section = '';

    for (var item in controller.troncalMenuItems) {
      if (item.type != null && item.type != section) {
        section = item.type!;
        menuList.add(this._getSectionList(controller, section));
      }

      if (item.type == null) {
        menuList.add(
          CustomMenuItem(
            svgPath: item.svgPath,
            label: item.label,
            onPressed: () {},
          ),
        );
      }
    }

    return menuList;
  }

  Widget _getSectionList(HomeController controller, String section) {
    final filterList = controller.troncalMenuItems
        .where((item) => (item.type ?? '') == section)
        .toList();

    return Container(
      padding: EdgeInsets.only(
        top: 24,
        left: 4,
        right: 4,
        bottom: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: borderDefaultColor),
          bottom: BorderSide(
            color: borderDefaultColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: CustomFontStyle.text500Normal14px(
              textLighterColor,
              isBold: true,
              letterSpacing: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ...List.generate(
            filterList.length,
            (index) {
              final item = filterList[index];
              return CustomMenuItem(
                svgPath: item.svgPath,
                label: item.label,
                onPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}

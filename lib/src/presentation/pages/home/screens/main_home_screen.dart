import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/constants/colors.dart';
import '../../../../config/constants/fonts_styles.dart';
import '../../../widgets/credit_debit_card.dart';
import '../../../widgets/fixed_term_card.dart';
import '../../../widgets/horizontal_menu_item.dart';
import '../../../widgets/informative_product_card.dart';
import '../../../widgets/lend_lease_item_card.dart';
import '../../../widgets/news_card.dart';
import '../home_page_controller.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return FadeIn(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: MyAppBar(),
            pinned: true,
            expandedHeight: 156,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.only(
                top: 18,
                bottom: 120,
              ),
              decoration: BoxDecoration(
                color: bgPrimary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  _rowTopOptionMenu(controller, context),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Novedades',
                        style: CustomFontStyle.text400Normal16px(
                          textLighterColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  _swiperNewsCard(),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text('Tarjetas',
                          style:
                              CustomFontStyle.text400Normal16px(textLighterColor))
                    ],
                  ),
                  SizedBox(
                    height: 11.43,
                  ),
                  InformativeProductCard(
                    title: 'Solicita tu tarjeta débito',
                    description: 'Texto',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CreditOrDebitCardInfo(
                    type: 'Débito',
                    brand: 'Mastercard',
                    maskedNumber: '**** **** **** 2085',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CreditOrDebitCardInfo(
                    type: 'Crédito',
                    brand: 'Mastercard',
                    maskedNumber: '**** **** **** 9004',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InformativeProductCard(
                    title: 'Solicita tu tarjeta crédito',
                    description: 'Planifica tus consumos a tu manera. ',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text('Plazos fijos',
                          style:
                              CustomFontStyle.text400Normal16px(textLighterColor))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InformativeProductCard(
                    title: 'Solicita tu Plazo fijo',
                    description: 'Texto',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 128,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FixedTermCard(
                          title: 'Plazo Fijo',
                          subtitle: 'Con renovación del capital e intereses',
                          amount: '\$2,500.00',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Text('Préstamos',
                          style:
                              CustomFontStyle.text400Normal16px(textLighterColor))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  LendLeaseItemCard(
                    title: 'Préstamo',
                    subtitle: 'Hipotecario taza fija 30 años',
                    amount: '\$2,500.00',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InformativeProductCard(
                    title: 'Solicita tu préstamo hipotecario',
                    description: 'Texto',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowTopOptionMenu(HomeController controller, BuildContext context) {
    return Row(
      children: [
        HorizontalMenuItem(
          label: 'Compartir\ndatos',
          iconPath: 'assets/images/svg/share-android.svg',
        ),
        HorizontalMenuItem(
          label: 'Depositar\ncheque',
          iconPath: 'assets/images/svg/lot-of-cash.svg',
        ),
        HorizontalMenuItem(
          label: 'Realizar\ntransferencia',
          iconPath: 'assets/images/svg/lot-of-cash.svg',
        ),
        HorizontalMenuItem(
          label: 'Realizar\npago',
          iconPath: 'assets/images/svg/lot-of-cash.svg',
        ),
      ],
    );
  }

  Container _swiperNewsCard() {
    return Container(
      width: double.infinity,
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return NewsCard();
        },
        itemCount: 3,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(top: 0),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/ISO-Fb-logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text('Hola Susana',
                style: CustomFontStyle.text400Normal16px(textDefaultColor)),
          ],
        ),
        SvgPicture.asset('assets/images/svg/bell-notification.svg')
      ],
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  color: cardPrimaryDefaultColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff97D1D8),
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/svg/currency-dollar-simple.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Saldo Actual',
                          style: CustomFontStyle.text500Normal14px(
                            textDefaultColor,
                            letterSpacing: true,
                            isBold: true,
                          ),
                        ),
                        Text(
                          'Cuenta principal',
                          style: CustomFontStyle.text400Normal12px(
                            textDefaultColor,
                            letterSpacing: true,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text('\$4,500.00',
                        style: CustomFontStyle.text600Normal18px(
                            textDefaultColor)),
                    SizedBox(
                      width: 11,
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/eye-empty.svg',
                      color: textDefaultColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:facebank/src/presentation/utils/responsive.dart';
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
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: MyAppBar(),
                  pinned: true,
                  expandedHeight: responsive.hp(17),
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
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF3F5F8),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
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
                        ),
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
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff677587),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          height: 180,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: 24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffD0DAFD),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -40,
                                        right: -30,
                                        child: Container(
                                          width: 134,
                                          height: 134,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(150),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 11,
                                        top: 18.5,
                                        child: GestureDetector(
                                          child: SvgPicture.asset(
                                              'assets/images/svg/close.svg'),
                                        ),
                                      ),
                                      Positioned(
                                        right: 29,
                                        bottom: 21.43,
                                        child: GestureDetector(
                                          child: Image.asset(
                                              'assets/images/money-hand.png'),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nuevos préstamos Online',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Color(0xff1F2836),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'No esperes más y accede al\npréstamo que necesitas.',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xff677587),
                                                  height: 1.5,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                  'Conocer más',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Color(0xff677587),
                                                    height: 1.5,
                                                  ),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16,
                                                  ),
                                                  primary: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 3,
                            pagination: SwiperPagination(
                              margin: EdgeInsets.only(top: 0),
                            ),
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
                            Text(
                              'Tarjetas',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff677587),
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11.43,
                        ),
                        Container(
                          width: double.infinity,
                          height: 75,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding:
                              EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.09),
                                  offset: Offset(1, 1),
                                )
                              ]),
                          child: Row(
                            children: [
                              Image.asset('assets/images/cards.png'),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Solicita tu tarjeta Mastercard',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff1F2836),
                                    ),
                                  ),
                                  Text(
                                    'Planifica tus consumos a tu manera.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff677587),
                                    ),
                                  ),
                                ],
                              )
                            ],
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
                            Text(
                              'Tarjetas',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff677587),
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 62,
                          padding: EdgeInsets.symmetric(
                              vertical: 9.5, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Débito'),
                                  Text('Mastercard '),
                                ],
                              ),
                              Spacer(),
                              Text(' **** **** **** 2085'),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomMenu(),
          )
        ],
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: Platform.isIOS ? 30 : 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0, -15),
            blurRadius: 15,
          )
        ],
      ),
      child: Row(
        children: [
          HorizontalMenuItem(
            label: 'Home',
            iconPath: 'assets/images/svg/home-simple-door.svg',
            isActive: true,
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
        ],
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
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile-demo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Hola Susana',
              style: TextStyle(
                color: Color(0xff1F2836),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
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
                  color: Color(0xffB3E7ED),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                            'assets/images/svg/currency-dollar-simple.svg'),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff2D3748),
                          ),
                        ),
                        Text(
                          'Cuenta principal',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff2D3748),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '\$4,500.00',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff2D3748),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    SvgPicture.asset(
                      'assets/images/svg/eye-empty.svg',
                      color: Color(0xff1F2836),
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

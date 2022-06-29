import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/horizontal_menu_item.dart';
import 'home_page_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: MyAppBar(),
            pinned: true,
            expandedHeight: 194.0,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Stack(
              children: [
                Container(
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
                            iconPath: 'assets/images/share-android.svg',
                          ),
                          HorizontalMenuItem(
                            label: 'Depositar\ncheque',
                            iconPath: 'assets/images/lot-of-cash.svg',
                          ),
                          HorizontalMenuItem(
                            label: 'Realizar\ntransferencia',
                            iconPath: 'assets/images/lot-of-cash.svg',
                          ),
                          HorizontalMenuItem(
                            label: 'Realizar\npago',
                            iconPath: 'assets/images/lot-of-cash.svg',
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
                        height: 150,
                        margin: EdgeInsets.symmetric(horizontal: 16),
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
                                    borderRadius: BorderRadius.circular(150),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 11,
                                top: 18.5,
                                child: GestureDetector(
                                  child: SvgPicture.asset(
                                      'assets/images/close.svg'),
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
                                                BorderRadius.circular(8),
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
                        ),
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
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        HorizontalMenuItem(
                          label: 'Home',
                          iconPath: 'assets/images/home-simple-door.svg',
                          isActive: true,
                        ),
                        HorizontalMenuItem(
                            label: 'Home',
                            iconPath: 'assets/images/grid-add.svg'),
                        HorizontalMenuItem(
                            label: 'Home', iconPath: 'assets/images/menu.svg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
                          image: AssetImage('assets/images/profile-demo.png'))),
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
          SvgPicture.asset('assets/images/bell-notification.svg')
        ],
      ),
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(
        top: statusBarHeight * 2.5,
        left: 16,
        right: 16,
      ),
      height: statusBarHeight + appBarHeight,
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
                        'assets/images/currency-dollar-simple.svg'),
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Ocultar saldos',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff677587),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SvgPicture.asset('assets/images/eye-empty.svg')
            ],
          ),
        ],
      ),
    );
  }
}

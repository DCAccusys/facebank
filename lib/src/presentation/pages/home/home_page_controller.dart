import 'package:facebank/src/config/constants/icon_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  List<ItemMenu> menuDrawerItems = [
    ItemMenu(IconRoutes.userCircleAltSvg, 'Datos de perfil'),
    ItemMenu(IconRoutes.languageSvg, 'Idioma'),
    ItemMenu(IconRoutes.settingsSvg, 'Configuración'),
    ItemMenu(IconRoutes.lockSvg, 'Seguridad'),
  ];

  List<ItemMenu> bottomMenuItems = [
    ItemMenu(IconRoutes.homeSimpleDoorSvg, 'Home'),
    ItemMenu(IconRoutes.gridAddSvg, 'Cuentas'),
    ItemMenu(IconRoutes.menuSvg, 'Menú'),
  ];

  List<ItemMenu> troncalMenuItems = [
    ItemMenu(IconRoutes.homeSvg, 'Home'),
    ItemMenu(IconRoutes.dollarSvg, 'Cuentas', type: 'Productos'),
    ItemMenu(IconRoutes.creditCardSvg, 'Tarjetas de débito', type: 'Productos'),
    ItemMenu(IconRoutes.creditCard2Svg, 'Tarjetas de crédito',
        type: 'Productos'),
    ItemMenu(IconRoutes.shoppingBagArrowUpSvg, 'Préstamo', type: 'Productos'),
    ItemMenu(IconRoutes.statUpSvg, 'Plazo fijo', type: 'Productos'),
    ItemMenu(IconRoutes.shareSvg, 'Compartir datos de cuenta',
        type: 'Recibir dinero'),
    ItemMenu(IconRoutes.lotOfCashSvg, 'Depositar un cheque',
        type: 'Recibir dinero'),
    ItemMenu(IconRoutes.dataTransferBothSvg, 'Transferencias',
        type: 'Enviar dinero'),
    ItemMenu(IconRoutes.sendDollarsSvg, 'Pagos', type: 'Enviar dinero'),
    ItemMenu(IconRoutes.archiveSvg, 'Solicitud de chequera',
        type: 'Trámites / Solicitudes'),
    ItemMenu(IconRoutes.homeUserSvg, 'Apertura cuenta menor de edad',
        type: 'Trámites / Solicitudes'),
    ItemMenu(IconRoutes.addUserSvg, 'Adhesion de firmante',
        type: 'Trámites / Solicitudes'),
    ItemMenu(IconRoutes.prohibitionSvg, 'Detener pago',
        type: 'Trámites / Solicitudes'),
    ItemMenu(IconRoutes.chatBubbleSvg, 'Chat', type: 'Atencion al cliente'),
    ItemMenu(IconRoutes.phoneSvg, 'Contacto', type: 'Atencion al cliente'),
    ItemMenu(IconRoutes.questionMarkSvg, 'FAQ’s', type: 'Atencion al cliente'),
    ItemMenu(IconRoutes.userCircleAltSvg, 'Datos de perfil',
        type: 'Configiración y seguridad'),
    ItemMenu(IconRoutes.settingsSvg, 'Configuración',
        type: 'Configiración y seguridad'),
    ItemMenu(IconRoutes.lockSvg, 'Seguridad',
        type: 'Configiración y seguridad'),
  ];

  List<AccountItem> accountList = <AccountItem>[
    AccountItem('Cuenta principal', '\$4,500.00', true,),
    AccountItem('Cuenta principal', '\$4,500.00', false,),
    AccountItem('Cuenta principal', '\$4,500.00', false,),
  ];

  RxInt _currentDrawerIndex = 0.obs;
  RxInt get currentDrawerIndex => this._currentDrawerIndex;

  RxInt _currentBottomMenuIndex = 0.obs;
  RxInt get currentBottomMenuIndex => this._currentBottomMenuIndex;

  onChangeDrawerIndex(int index) {
    this._currentDrawerIndex.value = index;
  }

  onChangeBottomMenuIndex(int index) {
    this._currentBottomMenuIndex.value = index;

    this.pageController.jumpToPage(
          index,
        );
  }
}

class ItemMenu {
  final String svgPath;
  final String label;
  final String? type;

  ItemMenu(this.svgPath, this.label, {this.type});
}

class AccountItem {
  final String label;
  final String amount;
  final bool isPrimary;
  AccountItem(this.label, this.amount, this.isPrimary);
}

import 'package:get/get.dart';

class HomeController extends GetxController {
  List<ItemMenu> menuDrawerItems = [
    ItemMenu('assets/images/svg/user-circle-alt.svg', 'Datos de perfil'),
    ItemMenu('assets/images/svg/language.svg', 'Idioma'),
    ItemMenu('assets/images/svg/settings.svg', 'Configuración'),
    ItemMenu('assets/images/svg/lock.svg', 'Seguridad'),
  ];

  List<ItemMenu> bottomMenuItems = [
    ItemMenu('assets/images/svg/home-simple-door.svg', 'Home'),
    ItemMenu('assets/images/svg/grid-add.svg', 'Cuentas'),
    ItemMenu('assets/images/svg/menu.svg', 'Menú'),
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
  }
}

class ItemMenu {
  final String svgPath;
  final String label;

  ItemMenu(this.svgPath, this.label);
}

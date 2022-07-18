import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'screens/image_alias.dart';

class ImageAliasOTPController extends GetxController {
  List<String> headerTitle = [
    'Imagen y alias',
    'Código de validación',
  ];

  List<Widget> pages = [
    ImageAliasScreen(),
  ];

  RxInt _currentPage = 0.obs;
  RxInt get currentPage => this._currentPage;
  PageController? pageController;
  RxBool _hasImageAlias = false.obs;
  RxBool get hasImageAlias => this._hasImageAlias;

  ImageAliasOTPController() {
    this.pageController = new PageController(initialPage: _currentPage.value);
  }

  @override
  void onInit() {
    _getPageInformation();
    super.onInit();
  }

  /* INIT  Image Alias */
  TextEditingController imageAliasInputText = new TextEditingController();

  RxBool _isImageAliasVisible = false.obs;
  RxBool get isImageAliasVisible => this._isImageAliasVisible;

  RxBool _isNextButtonEnabled = false.obs;
  RxBool get isNextButtonEnabled => this._isNextButtonEnabled;

  changeImageAliasVisible() {
    this.isImageAliasVisible.value = !this.isImageAliasVisible.value;
  }

  onValidateImageAliasClicked() {}

  Future<void> _getPageInformation() async {
    final storage = await SecureStorageService.sss.secureStorage;
    this._hasImageAlias.value =
        (await storage.read(key: KeyStorage.HAS_IMAGE_ALIAS)) == 'true';


  }

  /* END   Image Alias */
}

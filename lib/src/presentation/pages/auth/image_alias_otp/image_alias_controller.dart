import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:facebank/src/data/models/objects/image_alias_item.dart';
import 'package:facebank/src/data/models/request/get_image_alias_request.dart';
import 'package:facebank/src/domain/repositories/security_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'screens/image_alias.dart';

class ImageAliasOTPController extends GetxController {
  ISecurityRepository securityRepository;

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

  RxList<ImageAliasItem> imagesAliasItems = <ImageAliasItem>[].obs;
  RxBool _gettingImages = true.obs;
  RxBool get gettingImages => this._gettingImages;

  ImageAliasOTPController({required this.securityRepository}) {
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
    final userName = await storage.read(key: KeyStorage.USER_LOGIN) ?? '';
    final phoneUdid = await storage.read(key: KeyStorage.UDID) ?? '';
    this._hasImageAlias.value =
        (await storage.read(key: KeyStorage.HAS_IMAGE_ALIAS)) == 'true';

    // TODO: Si tengo imagen alias tengo que mostrar diferente los mensajes de la vista y es diferente el
    // llamado para obtener las imagenes

    if (this._hasImageAlias.value) {
      // Si tengo imagen alias realizo el request a getImageAlias
      final request = GetImageAliasRequest(
        phoneNumber: '0541234567890',
        phoneUdid: phoneUdid,
        userName: userName,
        culture: AppConfig.TEMP_CULTURE,
      );
      final response = await this.securityRepository.getImageAlias(request);

      if (response != null) {
        this.imagesAliasItems.addAll(response.imagenCollection);
      }
      this._gettingImages.value = false;
    } else {
      // SI no tengo imagen alias realizo el request a getImagenPrimeraVez
    }
  }

  /* END   Image Alias */
}

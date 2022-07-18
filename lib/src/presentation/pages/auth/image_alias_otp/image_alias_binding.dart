import 'package:get/get.dart';

import 'image_alias_controller.dart';

class ImageAliasOTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageAliasOTPController());
  }
}

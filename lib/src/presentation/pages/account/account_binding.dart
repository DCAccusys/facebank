import 'package:facebank/src/presentation/pages/account/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AccountController(),
    );
  }
}

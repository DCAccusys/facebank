import 'package:facebank/src/presentation/pages/account-detail/account-detail_controller.dart';
import 'package:get/get.dart';

class AccountDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountDetailController(),);
  }
}

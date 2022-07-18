import 'package:facebank/src/data/repositories/security_repository_impl.dart';
import 'package:facebank/src/presentation/pages/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        securityRepository: SecurityRepositoryImpl(),
      ),
    );
  }
}

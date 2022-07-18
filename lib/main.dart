import 'package:facebank/src/config/themes/app_theme.dart';
import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/data/repositories/configuration_repository_impl.dart';
import 'package:facebank/src/data/models/request/get_initial_configuration_request.dart';
import 'package:facebank/src/domain/repositories/configuration_repository.dart';
import 'package:facebank/src/presentation/pages/auth/login/login_binding.dart';
import 'package:facebank/src/presentation/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();

  runApp(MyApp());
}

Future<void> initialization() async {
  final IConfigurationRepository configurationRepository =
      ConfigurationRepositoryImpl();
  final request = InitialConfifurationRequest(
      indentifier: AppConfig.CHANNEL_MOBILE_BANKING);
  // We get the initial configuration here!
  await configurationRepository.getInitialConfiguration(request);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebank',
      // home: RegisterPage(),
      //home: HomePage(),
      home: LoginPage(),
      //initialBinding: HomeBinding(),
      // initialBinding: RegisterBinding(),
      initialBinding: LoginBinding(),
      theme: AppTheme.light(context),
    );
  }
}

import 'package:facebank/src/config/themes/app_theme.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_binding.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();

  runApp(MyApp());
}

Future<void> initialization() async{

  // TODO: Load resources or queries here!
  await Future.delayed(Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebank',
      home: RegisterPage(),
      // initialBinding: HomeBinding(),
      initialBinding: RegisterBinding(),
      theme: AppTheme.light(context),
    );
  }
}

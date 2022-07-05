import 'package:facebank/src/config/themes/app_theme.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_binding.dart';
import 'package:facebank/src/presentation/pages/auth/register/register_page.dart';
import 'package:facebank/src/presentation/pages/home/home_binding.dart';
import 'package:facebank/src/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

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

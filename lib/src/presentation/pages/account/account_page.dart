import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AccountPage'),
      ),
      body: SafeArea(
        child: Text('AccountController'),
      ),
    );
  }
}

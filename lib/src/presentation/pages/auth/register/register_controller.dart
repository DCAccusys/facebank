import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';

class RegisterController extends GetxController {
  late StreamSubscription<bool> keyboardSubscription;
  RxBool isKeyboardVisible = false.obs;

  /* INIT- Step1 Variables */
  TextEditingController userNameInputText = new TextEditingController();
  RxBool isNextButtonEnabled = false.obs;
  /* END- Step1 Variables */

  @override
  void onReady() {
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) async {
      if(!visible){
        await Future.delayed(Duration(milliseconds: 100));
      }
      this.isKeyboardVisible.value = visible;
    });

    /* INIT- Step1 Listener */

    userNameInputText.addListener(() {
      this.isNextButtonEnabled.value = this.userNameInputText.text.length != 0;
    });

    /* END- Step1 Listener */
    super.onReady();
  }

  @override
  void onClose() {
    userNameInputText.dispose();
    keyboardSubscription.cancel();
    super.onClose();
  }

  // Common functions
  void backButtonClicked(){

  }

  /* INIT- Step1 methods */
  void nextButtonClicked() {

  }

  void returnToLoginPage() {
    print('Return to login page');
  }

  /* END- Step1 methods */

}

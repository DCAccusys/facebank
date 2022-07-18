import 'package:facebank/src/data/models/request/data_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../config/constants/colors.dart';
import '../config/constants/fonts_styles.dart';
import '../data/datasource/local/secure_storage_service.dart';
import 'app_config.dart';
import 'key_storage.dart';

class CommonFunctions {
  static final _methodChannel =
      MethodChannel(AppConfig.ENCRYPT_PASS_METHOD_CHANNEL);

  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static void showTopBanner(String title, String message) {
    Get.snackbar(
      '',
      'Alternative',
      duration: Duration(seconds: 3),
      messageText: Row(
        children: [
          SizedBox(
            width: 36,
          ),
          Text(
            message,
            style: CustomFontStyle.text400Normal14px(
              textAlternativeColor,
            ),
          ),
        ],
      ),
      titleText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.check,
                color: success100,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: CustomFontStyle.text600Normal16px(success100),
              ),
            ],
          ),
          GestureDetector(
            onTap: Get.back,
            child: Icon(
              Icons.close,
              color: textAlternativeColor,
            ),
          )
        ],
      ),
      isDismissible: false,
      margin: EdgeInsets.all(16),
      borderRadius: 8,
      backgroundColor: brandAccent,
    );
  }

  static Future<DataRequest> encryptRequest(String stringRequest) async {
    final storage = await SecureStorageService.sss.secureStorage;

    // We need encript request Data before to send
    final sessionId = await storage.read(key: KeyStorage.SESSION_ID);
    final mappData = {
      AppConfig.SESSION_ID_KEY: sessionId,
      AppConfig.DATA_KEY: stringRequest,
    };

    final data = await _methodChannel.invokeMethod(
        AppConfig.ENCRYPT_DATA_ACTION, mappData);

    return DataRequest(data: data);
  }

  static Future<String> decryptResponse(String stringResponse) async {
    final storage = await SecureStorageService.sss.secureStorage;

    // We need encript request Data before to send
    final sessionId = await storage.read(key: KeyStorage.SESSION_ID);
    final mappData = {
      AppConfig.SESSION_ID_KEY: sessionId,
      AppConfig.DATA_KEY: stringResponse,
    };

    final data = await _methodChannel.invokeMethod(
        AppConfig.DECRYPT_DATA_ACTION, mappData);

    return data;
  }
}

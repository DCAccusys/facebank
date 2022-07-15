import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/data/models/response/auth_login_response.dart';
import 'package:facebank/src/data/models/request/auth_login_request.dart';
import 'package:facebank/src/domain/repositories/auth_repository.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

class AuthRepositoryImp implements AuthRepository {
  Dio _dio = Dio();
  static MethodChannel _platformChannel =
      MethodChannel(AppConfig.ENCRYPT_PASS_METHOD_CHANNEL);
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  AuthRepositoryImp() {
    this._dio.options.baseUrl = AppConfig.BASE_URL;
    this._dio.options.receiveDataWhenStatusError = true;
  }

  Future<String?> getPhoneUid() async {
    // TODO: change this for methodChannel implementation
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }

  @override
  Future<AuthLoginResponse> doLogin(AuthLoginRequest loginRequest) async {
    // Encrypt password
    final mapData = {
      'key': AppConfig.KEY_TO_ENCRYPT,
      'password': loginRequest.password
    };
    final ePassword = await _platformChannel.invokeMethod(
        AppConfig.ENCRYPT_PASS_ACTION, mapData);

    loginRequest.password = ePassword;
    // END - Encrypt password

    // Get Device id
    loginRequest.phoneUdid = await this.getPhoneUid() ?? '';
    //  END Get Device id

    final result = await this._dio.post(
          '/security/login',
          data: loginRequest.toJson(),
        );

    // Save sessionId

    return AuthLoginResponse.fromMap(result.data);
  }
}

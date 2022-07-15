import 'package:dio/dio.dart';
import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/data/models/response/auth_login_response.dart';
import 'package:facebank/src/data/models/request/auth_login_request.dart';
import 'package:facebank/src/domain/repositories/auth_repository.dart';
import 'package:flutter/services.dart';

class AuthRepositoryImp implements AuthRepository {
  late Dio _dio;
  static MethodChannel _platformChannel =
      MethodChannel(AppConfig.ENCRYPT_PASS_METHOD_CHANNEL);

  AuthRepositoryImp() {
    this._dio.options.baseUrl = AppConfig.BASE_URL;
    this._dio.options.receiveDataWhenStatusError = true;
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

    final result = await this._dio.post(
          '/security/login',
          data: loginRequest.toJson(),
        );

    // Save sessionId

    return AuthLoginResponse.fromMap(result.data);
  }
}

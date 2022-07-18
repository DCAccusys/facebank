import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:facebank/src/data/datasource/remote/dio_service.dart';
import 'package:facebank/src/data/models/request/data_request.dart';
import 'package:facebank/src/data/models/request/validate_existing_alias_request.dart';
import 'package:facebank/src/data/models/response/data_response.dart';
import 'package:facebank/src/data/models/response/login_response.dart';
import 'package:facebank/src/data/models/request/login_request.dart';
import 'package:facebank/src/data/models/response/validate_image_alias_response.dart';
import 'package:facebank/src/domain/repositories/security_repository.dart';
import 'package:flutter/services.dart';

import '../../core/app_config.dart';

class SecurityRepositoryImpl implements ISecurityRepository {
  static final _methodChannel =
      MethodChannel(AppConfig.ENCRYPT_PASS_METHOD_CHANNEL);

  static const _host = '/security';

  @override
  Future<LoginResponse?> login(LoginRequest request) async {
    final endpoint = '$_host/login';
    final dio = await DioService.dio.dioService;

    final result = await dio.post(endpoint, data: request.toJson());
    final response = LoginResponse.fromMap(result.data);

    if (response.success) {
      final storage = await SecureStorageService.sss.secureStorage;
      await storage.write(
          key: KeyStorage.SESSION_ID, value: response.sessionId);
      final cookie = result.headers['set-cookie']![0];
      await storage.write(key: KeyStorage.COOKIES, value: cookie);
      await storage.write(key: KeyStorage.USER_LOGIN, value: request.login);
      await storage.write(
          key: KeyStorage.USER_PASSWORD, value: request.password);
      await storage.write(
          key: KeyStorage.PUSH_NOTIFICATION_ACTIVE, value: response.pushActive);
      await storage.write(key: KeyStorage.ENTITY_ID, value: response.entityId);
      await storage.write(
          key: KeyStorage.CUSTOMER_ID, value: response.customerId);
    }

    return response;
  }

  @override
  Future<ValidateExistingAliasResponse?> validateExistingAlias(
      ValidateExistingAliasRequest request) async {
    final endpoint = '$_host/API2/validateExistingAlias';
    final dio = await DioService.dio.dioService;
    final storage = await SecureStorageService.sss.secureStorage;

    // We need encript request Data before to send
    final sessionId = await storage.read(key: KeyStorage.SESSION_ID);
    final cookie = await storage.read(key: KeyStorage.COOKIES);

    final mappData = {
      AppConfig.SESSION_ID_KEY: sessionId,
      AppConfig.DATA_KEY: request.toJson(),
    };

    final data = await _methodChannel.invokeMethod(
        AppConfig.ENCRYPT_DATA_ACTION, mappData);

    final requestData = DataRequest(data: data);

    final result = await dio.post(
      endpoint,
      data: requestData.toJson(),
      options: Options(
        headers: {'cookie': cookie},
      ),
    );

    final dataResponse = DataResponse.fromMap(result.data);

    if (dataResponse.success) {
      // We need decript data
      final mappDataToDecrypt = {
        AppConfig.SESSION_ID_KEY: sessionId,
        AppConfig.DATA_KEY: dataResponse.data,
      };

      final decrypt = await _methodChannel.invokeMethod(
          AppConfig.DECRYPT_DATA_ACTION, mappDataToDecrypt);
      final response = ValidateExistingAliasResponse.fromJson(decrypt);
      await storage.write(
          key: KeyStorage.HAS_IMAGE_ALIAS, value: response.success.toString());
      return response;
    }
    return null;
  }
}

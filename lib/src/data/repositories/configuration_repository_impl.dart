import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:facebank/src/data/datasource/remote/dio_service.dart';
import 'package:facebank/src/data/models/response/get_initial_configuration_response.dart';
import 'package:facebank/src/data/models/request/get_initial_configuration_request.dart';
import 'package:facebank/src/domain/repositories/configuration_repository.dart';
import 'package:flutter/services.dart';

class ConfigurationRepositoryImpl implements IConfigurationRepository {
  static final _methodChannel = MethodChannel(AppConfig.ID_METHOD_CHANNEL);

  static const _host = '/configuration';

  ConfigurationRepositoryImpl() {
    DioService.dio.initDio();
    SecureStorageService.sss.initSSS();
  }

  @override
  Future<InitialConfifurationResponse?> getInitialConfiguration(
      InitialConfifurationRequest request) async {
    final endpoint = '$_host/getInitialConfiguration';

    final dio = await DioService.dio.dioService;

    final result = await dio.post(endpoint, data: request.toJson());

    final response = InitialConfifurationResponse.fromMap(result.data);

    print('Resultado');

    // Get ID

    final uniqueId =
        await _methodChannel.invokeMethod(AppConfig.UNIQUE_ID_ACTION);

    // save Id in secure storage
    final storage = await SecureStorageService.sss.secureStorage;
    await storage.write(key: KeyStorage.UDID, value: uniqueId);

    return null;
  }
}

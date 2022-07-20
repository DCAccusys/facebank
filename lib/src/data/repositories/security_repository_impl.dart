import 'package:facebank/src/core/common_functions.dart';
import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:facebank/src/data/datasource/remote/dio_service.dart';
import 'package:facebank/src/data/models/request/get_image_alias_request.dart';
import 'package:facebank/src/data/models/request/validate_existing_alias_request.dart';
import 'package:facebank/src/data/models/request/validate_image_alias_request.dart';
import 'package:facebank/src/data/models/response/get_image_alias_response.dart';
import 'package:facebank/src/data/models/response/login_response.dart';
import 'package:facebank/src/data/models/request/login_request.dart';
import 'package:facebank/src/data/models/response/validate_image_alias_response.dart';
import 'package:facebank/src/data/repositories/base_repository.dart';
import 'package:facebank/src/domain/repositories/security_repository.dart';

class SecurityRepositoryImpl extends BaseRepository
    implements ISecurityRepository {
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
    final storage = await SecureStorageService.sss.secureStorage;

    final dataResponse = await this.call(endpoint, request.toJson());
    if (dataResponse.success) {
      // We need decript data
      final jsonData = await CommonFunctions.decryptResponse(dataResponse.data);
      final response = ValidateExistingAliasResponse.fromJson(jsonData);
      await storage.write(
          key: KeyStorage.HAS_IMAGE_ALIAS, value: response.success.toString());
      return response;
    }
    return null;
  }

  @override
  Future<GetImageAliasResponse?> getImageAlias(
      GetImageAliasRequest request) async {
    final endpoint = '$_host/API2/getAliasImage';

    final dataResponse = await this.call(endpoint, request.toJson());

    if (dataResponse.success) {
      // We need decript data
      final jsonData = await CommonFunctions.decryptResponse(dataResponse.data);
      final response = GetImageAliasResponse.fromJson(jsonData);
      return response;
    }
    return null;
  }

  @override
  Future<void> validateImagenAlias(ValidateImagenAliasRequest request) async {
    final endpoint = '$_host/API2/validateImagenAlias';

    final dataResponse = await this.call(endpoint, request.toJson());

    if(dataResponse.success){
      final jsonData = await CommonFunctions.decryptResponse(dataResponse.data);
      print('');
    }
  }
}

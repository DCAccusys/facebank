import 'package:dio/dio.dart';

import '../../core/common_functions.dart';
import '../../core/key_storage.dart';
import '../datasource/local/secure_storage_service.dart';
import '../datasource/remote/dio_service.dart';
import '../models/response/data_response.dart';

class BaseRepository {
  Future<DataResponse> call(String endpoint, String request) async {
    final dio = await DioService.dio.dioService;
    final storage = await SecureStorageService.sss.secureStorage;

    // We need encript request Data before to send
    final cookie = await storage.read(key: KeyStorage.COOKIES);
    final requestData =
        await CommonFunctions.encryptRequest(request.toString());

    final result = await dio.post(
      endpoint,
      data: requestData.toJson(),
      options: Options(
        headers: {'cookie': cookie},
      ),
    );

    return DataResponse.fromMap(result.data);
  }
}

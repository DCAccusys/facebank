import 'package:dio/dio.dart';

import '../../../core/app_config.dart';

class DioService {
  static Dio? _dio;
  static final DioService dio = DioService._();

  DioService._();

  Future<Dio> get dioService async {
    if (_dio != null) {
      return _dio!;
    }

    _dio = await initDio();

    return _dio!;
  }

  Future<Dio> initDio() async {
    Dio dio = new Dio();

    dio.options.baseUrl = AppConfig.BASE_URL;
    dio.options.receiveDataWhenStatusError = true;

    return dio;
  }
}

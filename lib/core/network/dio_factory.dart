import 'package:acthub/config/constants.dart';
import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppSettingsSharedPreferences _appSettingsPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      ApiConstants.authorization:
          getAuthorization(_appSettingsPreferences.getToken()),
    };
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      receiveTimeout:
          const Duration(seconds: ApiConstants.receiveTimeOutDuration),
      sendTimeout: const Duration(seconds: ApiConstants.sendTimeOutDuration),
    );
    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      String token = _appSettingsPreferences.getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    });
    dio.interceptors.add(interceptorsWrapper);
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            requestHeader: true,
            request: true),
      );
    }
    return dio;
  }

  String getAuthorization(String token) {
    return '${ManagerString.bearer} $token';
  }
}

import '../../utils/utils.dart';

class DioClient {
  DioClient._();
  static  Dio dio = Dio(BaseOptions(
    baseUrl: BaseUrl.baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    validateStatus: (_) => true,
    connectTimeout: const Duration(minutes: 10),
    receiveTimeout: const Duration(minutes: 10),
  ))
    ..interceptors.addAll([
      // AuthorizationInterceptor(),
      // DioFirebasePerformanceInterceptor(),
      LoggerInterceptor(),
      // TokenInterceptor(),
      // NetworkInterceptor(),
    ]);

}

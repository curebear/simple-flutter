import 'package:chopper/chopper.dart';

import 'package:app/data/apis/rest/converter.dart';
import 'package:app/data/apis/rest/posts_service.dart';

class ConnectionOptions {
  static const String HTTP_HEADER_CACHE_CONTROL = 'Cache-Control';
  static const String HTTP_HEADER_APP_VERSION = 'x-app-version';

  final String appVersion;
  final String baseUrl;
  final String token;

  ConnectionOptions(String baseUrl, {String appVersion, String token})
      : this.appVersion = appVersion,
        this.baseUrl = baseUrl,
        this.token = token;
}

// ref: https://github.com/viniciustozzi/tcc_lang/blob/master/lib/components/core/logic/api_service.dart
typedef String StringCallback();
class CustomAuthInterceptor implements RequestInterceptor {
  final StringCallback callback;

  CustomAuthInterceptor(this.callback);

  Future<Request> onRequest(Request request) async {
    if (this.callback != null) {
      var token = callback();
      return applyHeaders(request, {'Authorization': 'Bearer $token'});
    } else {
      return request;
    }
  }
}

class ApiService {
  final ChopperClient chopper;
  ApiService._internal(this.chopper);

  factory ApiService.build(ConnectionOptions options) {
    final client = ApiService._internal(ChopperClient(
      baseUrl: options.baseUrl,
      converter: jsonConverter,
      services: [
        PostsService.create(),
      ],
      interceptors: [
        if (options.token != null) { CustomAuthInterceptor(() => options.token) },
        HeadersInterceptor({
          ConnectionOptions.HTTP_HEADER_CACHE_CONTROL: 'no-cache',
          ConnectionOptions.HTTP_HEADER_APP_VERSION: options.appVersion,
        }),
        CurlInterceptor(),
        HttpLoggingInterceptor(),
      ],
    ));
    return client;
  }

  // Helpers for services
  PostsService get posts => chopper.getService<PostsService>();
}

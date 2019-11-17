import 'package:chopper/chopper.dart';

import 'package:app/data/apis/rest/converter.dart';
import 'package:app/data/apis/rest/posts_service.dart';

class ConnectionOptions {
  static const String HTTP_HEADER_CACHE_CONTROL = 'Cache-Control';
  static const String HTTP_HEADER_APP_VERSION = 'x-app-version';

  final String baseUrl;
  final String appVersion;

  ConnectionOptions(String baseUrl, String appVersion)
      : this.appVersion = appVersion,
        this.baseUrl = baseUrl;
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

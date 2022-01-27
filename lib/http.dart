import 'package:dio/dio.dart';

import 'config.dart';

abstract class API {
  static const login = '/user/login'; // 首页顶部导航
}

// http请求
final httpClient = Dio(BaseOptions(
  baseUrl: Config.baseUrl,
  responseType: ResponseType.json,
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

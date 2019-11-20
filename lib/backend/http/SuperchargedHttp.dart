import 'dart:convert';

import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;

class SuperchargedHTTP {
  static Future<dynamic> request(
      {@required String URL, @required int timeout}) async {
    BaseOptions options =
        BaseOptions(connectTimeout: timeout, responseType: ResponseType.json);

    var handler;

    if(kIsWeb) {
      handler = DioForBrowser(options);
    } else {
      handler = Dio(options);
    }

    handler.transformer = FlutterTransformer();
    handler.interceptors.add(
        DioCacheManager(CacheConfig(defaultMaxAge: Duration(seconds: 30)))
            .interceptor);

    Response<dynamic> response;

    try {
      response = await handler.get(URL);
    } on DioError catch (e) {
      if (e.response != null) {
        print("Did not result to 200");
        return requestFallback(URL: URL, timeout: timeout, headers: null);
      } else {
        print("Request failed");
        return requestFallback(URL: URL, timeout: timeout, headers: null);
      }
    }

    return response.data;
  }

  static Future<dynamic> requestAdvanced(
      {@required String URL,
      @required int timeout,
      @required Map<String, dynamic> headers}) async {
    BaseOptions options = BaseOptions(
        connectTimeout: timeout,
        responseType: ResponseType.json,
        headers: headers);

    var handler;

    if(kIsWeb) {
      handler = DioForBrowser(options);
    } else {
      handler = Dio(options);
    }

    handler.transformer = FlutterTransformer();
    handler.interceptors.add(
        DioCacheManager(CacheConfig(defaultMaxAge: Duration(seconds: 30)))
            .interceptor);

    Response<dynamic> response;

    try {
      response = await handler.get(URL);
    } on DioError catch (e) {
      if (e.response != null) {
        print("Did not result to 200");
        return requestFallback(URL: URL, timeout: timeout, headers: headers);
      } else {
        print("Request failed");
        return requestFallback(URL: URL, timeout: timeout, headers: headers);
      }
    }

    return response.data;
  }

  static Future<dynamic> requestFallback(
      {
        @required String URL,
        @required int timeout,
        Map<String, dynamic> headers
      }) async {
      var response = await http.get(URL, headers: headers);

      return jsonDecode(response.body);
  }
}

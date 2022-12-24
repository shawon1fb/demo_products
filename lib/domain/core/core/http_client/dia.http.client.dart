import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config.dart';
import 'dio_flutter_transformer.dart';

class AppHttpClient extends GetLifeCycle {
  final Dio httpClient = Dio(BaseOptions(
    baseUrl: ConfigEnvironments.getEnvironments().url,
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
    receiveDataWhenStatusError: true,

    responseType: ResponseType.plain,
  ));

  AppHttpClient();

  @override
  void onInit() {
    httpClient.transformer = FlutterTransformer();
    initCache();
    super.onInit();
  }

  void initCache() {
    try {
      // Directory tempDir = await getTemporaryDirectory();
      CacheStore store =
          MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576);
      // CacheStore store = HiveCacheStore(tempDir.path);
      httpClient.interceptors
          .add(DioCacheInterceptor(options: CacheOptions(store: store)));
    } catch (e, t) {
      debugPrint(e.toString());
      debugPrint(t.toString());
    }
  }
}

import 'dart:convert';

import '../../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/exceptions/default.exception.dart';
import '../../../../domain/core/exceptions/forbidden.exception.dart';
import '../../../../domain/core/exceptions/unauthorized.exception.dart';
import '../../../../domain/core/exceptions/unprocessable.entity.exception.dart';
import '../usecase/products.service.interface.dart';
import 'request/all_products.response.dart';

class ProductNetworkService extends IProductService {
  final IHttpConnect _connect;

  ProductNetworkService({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'products';

  @override
  Future<AllProductsResponse> getAllProducts() async {
    try {
      final response = await _connect.get<AllProductsResponse>(
        _prefix,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',
        },
        decoder: (value) {
          return AllProductsResponse.fromJson(
            value is String ? json.decode(value) : value as List,
          );
        },
      );
      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 401:
            throw UnAuthorizedException(
              message:
                  response.payload?.message ?? 'invalid username or password',
            );
          case 403:
            throw ForbiddenException(
              message:
                  response.payload?.message ?? 'invalid username or password',
            );
          case 422:
            throw UbProcessAbleEntityException(
                message: response.payload?.message ??
                    'UbProcessAbleEntityException');
          case 500:
            throw DefaultException(
              message: response.payload?.message ?? 'Server error',
            );
          default:
            throw DefaultException(
              message: response.payload?.message ??
                  'Error loading data, check your internet!',
            );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}

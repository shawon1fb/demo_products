import 'dart:convert';

import '../../../../domain/core/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/core/exceptions/default.exception.dart';
import '../../../../domain/core/core/exceptions/forbidden.exception.dart';
import '../../../../domain/core/core/exceptions/unprocessable.entity.exception.dart';
import '../usecase/auth.service.interface.dart';
import 'dto/login.dto.dart';
import 'response/token.response.model.dart';

class AuthNetworkService extends IAuthService {
  final IHttpConnect _connect;

  AuthNetworkService({required IHttpConnect connect}) : _connect = connect;

  String get _prefix => 'accounts';

  @override
  Future<TokenResponse> signIn(LoginDto dto) async {
    try {
      final response = await _connect.post<TokenResponse>(
        'token',
        dto.toString(),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'user-Agent': 'PostmanRuntime/7.29.2',
        },
        decoder: (value) {
          // print(value);
          return TokenResponse.fromJson(
            value is String ? jsonDecode(value) : value as Map<String, dynamic>,
          );
        },
      );
      if (response.success) {
        return response.payload!;
      } else {
        switch (response.statusCode) {
          case 422:
            throw UbProcessAbleEntityException(
                message: response.payload?.message ??
                    'UbProcessAbleEntityException');
          case 401:
            throw ForbiddenException(
              message:
                  response.payload?.message ?? 'invalid username or password',
            );
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
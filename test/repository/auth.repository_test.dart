import 'package:demo_products/domain/core/exceptions/unauthorized.exception.dart';
import 'package:demo_products/domain/repository/usecase/auth.reposirory.interface.dart';
import 'package:demo_products/infrastructure/dal/services/auth/dto/login.dto.dart';
import 'package:demo_products/infrastructure/navigation/bindings/domains/auth.repository.bindings.dart';
import 'package:demo_products/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_products/main.dart';

void main() {
  // setUpAll(()  {
  //   Initializer.testInit();
  // });

  test('login api  success test', () async {
    await Initializer.testInit();

    IAuthRepository repository = AuthRepositoryBindings().repository;

    LoginDto dto = LoginDto(
      username: 'mor_2314',
      password: '83r5^_',
    );
    String token = await repository.signIn(dto);
    expect(token.isNotEmpty, true);
  });

  test('login api failed test', () async {
    await Initializer.testInit();

    try {
      IAuthRepository repository = AuthRepositoryBindings().repository;

      LoginDto dto = LoginDto(
        username: 'mor_23145',
        password: '83r5^_',
      );
      String token = await repository.signIn(dto);
      expect(token.isNotEmpty, true);
    } on UnAuthorizedException catch (e) {
      expect(true, true);
    }
    // on FormatException catch (e) {
    //   expect(true, true);
    // }
    catch (e) {
      print(e.runtimeType);
      expect(false, true);
    }
  });
}

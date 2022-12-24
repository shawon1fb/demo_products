import 'package:get/get.dart';

import '../../../domain/repository/usecase/app.data.repository.interface.dart';
import '../../../domain/repository/usecase/auth.reposirory.interface.dart';
import '../../../infrastructure/dal/services/auth/dto/login.dto.dart';

class LoginController extends GetxController {
  final IAuthRepository _authRepository;
  final IAppDataRepository _appDataRepository;

  LoginController(
      {required IAuthRepository authRepository,
      required IAppDataRepository appDataRepository})
      : _authRepository = authRepository,
        _appDataRepository = appDataRepository;

  Future<void> loginMethod({
    required String username,
    required String password,
  }) async {
    try {
      LoginDto dto = LoginDto(
        username: username,
        password: password,
      );
      String token = await _authRepository.signIn(dto);

      /// save the token
      _appDataRepository.setJwtToken(token);
    } catch (e) {
      rethrow;
    }
  }
}

import '../../../infrastructure/dal/services/auth/dto/login.dto.dart';
import '../../../infrastructure/dal/services/auth/response/token.response.model.dart';
import '../../../infrastructure/dal/services/usecase/auth.service.interface.dart';
import '../usecase/auth.reposirory.interface.dart';

class AuthRepository extends IAuthRepository {
  final IAuthService _authService;

  AuthRepository({required IAuthService authService})
      : _authService = authService;

  @override
  Future<String> signIn(LoginDto dto) async {
    try {
      TokenResponse res = await _authService.signIn(dto);
      return res.token!;
    } catch (e) {
      rethrow;
    }
  }
}

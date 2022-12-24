import '../../../infrastructure/dal/services/auth/dto/login.dto.dart';

abstract class IAuthRepository {
  Future<String> signIn(LoginDto dto);
}

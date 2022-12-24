import '../auth/dto/login.dto.dart';
import '../auth/response/token.response.model.dart';

abstract class IAuthService{
  Future<TokenResponse> signIn(LoginDto dto);
}
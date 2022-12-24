import 'package:get/get.dart';

import '../../../../domain/repository/auth/auth.repository.dart';
import '../../../../domain/repository/usecase/auth.reposirory.interface.dart';
import '../../../dal/connect.dart';
import '../../../dal/services/auth/auth.network.service.dart';

class AuthRepositoryBindings {
  late IAuthRepository _repository;

  IAuthRepository get repository => _repository;

  AuthRepositoryBindings() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final services = AuthNetworkService(connect: connect);
    _repository = AuthRepository(authService: services);
  }
}

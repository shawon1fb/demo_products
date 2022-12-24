import 'package:get/get.dart';

import '../../../../domain/core/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/core/http_client/dia.http.client.dart';
import '../../../../domain/repository/auth/auth.repository.dart';
import '../../../../domain/repository/usecase/auth.reposirory.interface.dart';
import '../../../dal/connect.dart';
import '../../../dal/dio.connect.dart';
import '../../../dal/services/auth/auth.network.service.dart';

class AuthRepositoryBindings {
  late IAuthRepository _repository;

  IAuthRepository get repository => _repository;

  AuthRepositoryBindings() {
    /// get connect client
    // final getConnect = Get.find<GetConnect>();
    // final connect = Connect(connect: getConnect);

    /// dio client
    final AppHttpClient getHttpClient = Get.find<AppHttpClient>();
    final IHttpConnect connect = DioConnect(connect: getHttpClient.httpClient);

    final services = AuthNetworkService(connect: connect);
    _repository = AuthRepository(authService: services);
  }
}

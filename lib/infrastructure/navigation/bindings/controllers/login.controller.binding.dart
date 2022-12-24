import 'package:get/get.dart';

import '../../../../presentation/login/controllers/login.controller.dart';
import '../domains/auth.repository.bindings.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: AuthRepositoryBindings().repository,
      ),
    );
  }
}

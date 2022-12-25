import 'package:get/get.dart';

import '../../../domain/repository/usecase/app.data.repository.interface.dart';
import '../../../infrastructure/navigation/routes.dart';

class ProfileController extends GetxController {
  final IAppDataRepository _appDataRepository;

  ProfileController({required IAppDataRepository appDataRepository})
      : _appDataRepository = appDataRepository;

  Future<void> logOut() async {
    try {
      _appDataRepository.clearJwtToken();
      Get.offAllNamed(Routes.LOGIN);
    } catch (_) {}
  }
}

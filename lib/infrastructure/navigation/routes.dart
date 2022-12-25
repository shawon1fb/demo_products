import 'bindings/domains/app.data.repository.bindings.dart';

class Routes {
  static Future<String> get initialRoute async {
    var repo = AppDataRepositoryBinding().repository;

    try {
      String token = await repo.getJwtToken();
      if (token.isEmpty) {
        return LOGIN;
      } else {
        return HOME;
      }
    } catch (_) {}
    return LOGIN;
  }

  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PRODUCT_DETAILS = '/product-details';
}

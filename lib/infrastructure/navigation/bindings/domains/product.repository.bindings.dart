import 'package:get/get.dart';

import '../../../../domain/core/abstractions/http_connect.interface.dart';
import '../../../../domain/core/http_client/dia.http.client.dart';
import '../../../../domain/repository/product/product.repository.dart';
import '../../../../domain/repository/usecase/product.repository.interface.dart';
import '../../../dal/dio.connect.dart';
import '../../../dal/services/product/product.network.service.dart';

class ProductRepositoryBindings {
  late IProductRepository _repository;

  IProductRepository get repository => _repository;

  ProductRepositoryBindings() {
    /// get connect client
    // final getConnect = Get.find<GetConnect>();
    // final connect = Connect(connect: getConnect);

    /// dio client
    final AppHttpClient getHttpClient = Get.find<AppHttpClient>();
    final IHttpConnect connect = DioConnect(connect: getHttpClient.httpClient);

    final services = ProductNetworkService(connect: connect);
    _repository = ProductRepository(productService: services);
  }
}

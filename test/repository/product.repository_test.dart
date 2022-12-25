import 'package:demo_products/domain/core/data_model/product.data.model.dart';
import 'package:demo_products/domain/core/pagination/pagination_model.dart';
import 'package:demo_products/domain/repository/usecase/product.repository.interface.dart';
import 'package:demo_products/infrastructure/navigation/bindings/domains/product.repository.bindings.dart';
import 'package:demo_products/initializer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('get all products', () async {
    await Initializer.testInit();
    IProductRepository repository = ProductRepositoryBindings().repository;

    PaginationModel<ProductDataModel> res = await repository.getAllProduct();

    List<ProductDataModel> products = res.list;

    expect(products.isNotEmpty, true);
  });
}

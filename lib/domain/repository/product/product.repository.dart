import '../../../infrastructure/dal/services/product/request/all_products.response.dart';
import '../../../infrastructure/dal/services/usecase/products.service.interface.dart';
import '../../core/data_model/product.data.model.dart';
import '../../core/pagination/pagination_model.dart';
import '../usecase/product.repository.interface.dart';

class ProductRepository extends IProductRepository {
  final IProductService _productService;

  ProductRepository({required IProductService productService})
      : _productService = productService;

  @override
  Future<PaginationModel<ProductDataModel>> getAllProduct() async {
    try {
      AllProductsResponse res = await _productService.getAllProducts();

      List<ProductsResponseData> productsResponse = res.products;
      List<ProductDataModel> list = <ProductDataModel>[];

      for (var v in productsResponse) {
        ProductDataModel m = ProductDataModel(
          id: v.id!,
          title: v.title!,
          price: v.price!,
          description: v.description!,
          category: v.category!,
          image: v.image ?? '',
        );
        list.add(m);
      }

      return PaginationModel<ProductDataModel>(
        page: 1,
        totalPages: 1,
        list: list,
      );
    } catch (e) {
      rethrow;
    }
  }
}

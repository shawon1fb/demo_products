import '../../core/data_model/product.data.model.dart';
import '../../core/pagination/pagination_model.dart';

abstract class IProductRepository {
  Future<PaginationModel<ProductDataModel>> getAllProduct();
}

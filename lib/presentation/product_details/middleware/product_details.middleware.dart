import 'package:get/get.dart';

class ProductDetailsMiddleWare extends GetMiddleware {
  ProductDetailsMiddleWare();

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return page;
  }
}

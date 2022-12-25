import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../../../domain/core/data_model/product.data.model.dart';
import '../controllers/product_details.controller.dart';

class ProductDetailsMiddleWare extends GetMiddleware {
  ProductDetailsMiddleWare();

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    String jsonString = Get.parameters['model'] ?? '';
    if (jsonString.isNotEmpty) {
      try {
        ProductDataModel model = ProductDataModel.fromString(jsonString);
        ProductDetailsController controller = Get.find();
        controller.product = model;
      } catch (e, t) {
        if (kDebugMode) {
          print(e);
          print(t);
        }
      }
    }

    return page;
  }
}

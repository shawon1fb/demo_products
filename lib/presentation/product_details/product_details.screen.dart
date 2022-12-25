import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/product_details.controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductDetailsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

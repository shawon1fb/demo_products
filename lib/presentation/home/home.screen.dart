import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';
import 'controllers/products.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: GetBuilder<ProductsController>(
        builder: (c) {
          if (c.isLoading == true) {
            return const Center(child: Text('Loading'));
          }
          if (c.allProducts.isEmpty) {
            return const Center(child: Text('Empty'));
          }

          return ListView.builder(
            itemCount: c.allProducts.length,
            itemBuilder: (context, i) {
              var product = c.allProducts[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.title),
              );
            },
          );
        },
      ),
    );
  }
}

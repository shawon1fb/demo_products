import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../shared/image/cache_image.dart';
import 'controllers/home.controller.dart';
import 'controllers/products.controller.dart';
import 'controllers/profile.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          GetBuilder<ProfileController>(builder: (logic) {
            return InkWell(
              onTap: () {
                logic.logOut();
              },
              child: const Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(
            width: 20,
          ),
        ],
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
                child: Column(
                  children: [
                    CacheImageView(
                      image: product.image,
                      child: SizedBox(
                        width: Get.width,
                        height: Get.width,
                      ),
                    ),
                    Row(
                      children: [
                        /// title and price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'price : ${product.price}\$',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /// delete widget
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

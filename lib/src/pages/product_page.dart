import 'package:flutter/material.dart';
import 'package:flutter_model_class_app/src/pages/product_details_page.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products'), centerTitle: true),

      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: productController.productList.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),

          itemBuilder: (context, index) {
            final product = productController.productList[index];

            return GestureDetector(
              onTap: () {
                //Get.to(() => ProductDetailsPage(product: product));
              },

              child: Card(
                elevation: 3,
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(product.image, fit: BoxFit.cover),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              '৳ ${product.price}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          InkWell(
                            onTap: () {
                              Get.to(
                                () => ProductDetailsPage(product: product),
                              );
                            },
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'View Details',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

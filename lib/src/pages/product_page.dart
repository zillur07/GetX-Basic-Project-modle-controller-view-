import 'package:flutter/material.dart';
import 'package:flutter_model_class_app/src/pages/cart_page.dart';
import 'package:flutter_model_class_app/src/pages/wish_list_page.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import 'product_details_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          // Wishlist Icon
          Obx(
            () => IconButton(
              onPressed: () {
                Get.to(() => WishlistPage());
              },
              icon: Badge(
                label: Text('${controller.wishlist.length}'),
                child: const Icon(Icons.favorite),
              ),
            ),
          ),

          // Cart Icon
          Obx(
            () => IconButton(
              onPressed: () {
                Get.to(() => CartPage());
              },
              icon: Badge(
                label: Text('${controller.cartList.length}'),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),

      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.productList.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),

          itemBuilder: (context, index) {
            final product = controller.productList[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailsPage(product: product));
              },

              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            '৳ ${product.price}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text('View Details'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

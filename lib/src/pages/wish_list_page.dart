import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wishlist')),

      body: Obx(() {
        if (controller.wishlist.isEmpty) {
          return const Center(
            child: Text('Wishlist is Empty!', style: TextStyle(fontSize: 18)),
          );
        }

        return ListView.builder(
          itemCount: controller.wishlist.length,

          itemBuilder: (context, index) {
            final product = controller.wishlist[index];

            return Card(
              margin: const EdgeInsets.all(10),

              child: ListTile(
                leading: Image.network(
                  product.image,
                  width: 60,
                  fit: BoxFit.cover,
                ),

                title: Text(product.name),

                subtitle: Text('৳ ${product.price}'),

                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'cart') {
                      controller.addToCart(product);
                    }

                    if (value == 'remove') {
                      controller.removeFromWishlist(product);
                    }
                  },

                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'cart',
                      child: Text('Add To Cart'),
                    ),

                    const PopupMenuItem(value: 'remove', child: Text('Remove')),
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

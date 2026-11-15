import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import '../controllers/product_controller.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  ProductDetailsPage({super.key, required this.product});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Price
                  Text(
                    '৳ ${product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(product.description),

                  const SizedBox(height: 30),

                  // Wishlist Button
                  Obx(() {
                    bool isFav = controller.isWishlisted(product);

                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          if (isFav) {
                            controller.removeFromWishlist(product);
                            Get.snackbar('Wishlist', 'Removed from wishlist');
                          } else {
                            controller.addToWishlist(product);
                          }
                        },

                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),

                        label: Text(
                          isFav ? 'Remove Wishlist' : 'Add To Wishlist',
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 12),

                  // Cart Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.addToCart(product);
                      },

                      icon: const Icon(Icons.shopping_cart),

                      label: const Text('Add To Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

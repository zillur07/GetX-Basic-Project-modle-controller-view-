import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),

      body: Obx(() {
        if (controller.cartList.isEmpty) {
          return const Center(
            child: Text('Your Cart is Empty!', style: TextStyle(fontSize: 18)),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartList.length,

                itemBuilder: (context, index) {
                  final product = controller.cartList[index];

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

                      trailing: IconButton(
                        onPressed: () {
                          controller.removeFromCart(product);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Total Price
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,

              child: Column(
                children: [
                  Text(
                    'Total: ৳ ${controller.totalPrice}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          'Checkout',
                          'Checkout feature coming soon',
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/product_controller.dart';
import 'pages/product_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Register Controller before ProductPage
    Get.put(ProductController(), permanent: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

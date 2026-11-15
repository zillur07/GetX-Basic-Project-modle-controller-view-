import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  /// A list of products observed by the controller
  // var productList = <ProductModel>[].obs;
  var productList = RxList<ProductModel>([]);
  // Cart Products
  var cartList = <ProductModel>[].obs;

  // Wishlist Products
  var wishlist = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    productList.value = [
      ProductModel(
        id: 1,
        name: 'iPhone 16',
        description: 'Apple iPhone 16 with powerful performance.',
        price: 85000,
        image: 'https://picsum.photos/id/1/300/300',
      ),

      ProductModel(
        id: 2,
        name: 'Samsung S24',
        description: 'Samsung flagship smartphone.',
        price: 75000,
        image: 'https://picsum.photos/id/2/300/300',
      ),

      ProductModel(
        id: 3,
        name: 'Headphone',
        description: 'High quality wireless headphone.',
        price: 2500,
        image: 'https://picsum.photos/id/3/300/300',
      ),
      ProductModel(
        id: 4,
        name: 'Laptop',
        description: 'High performance laptop for work and gaming.',
        price: 120000,
        image: 'https://picsum.photos/id/4/300/300',
      ),
      ProductModel(
        id: 5,
        name: 'Smart Watch',
        description: 'Stylish smart watch with health tracking features.',
        price: 15000,
        image: 'https://picsum.photos/id/5/300/300',
      ),
      ProductModel(
        id: 6,
        name: 'Camera',
        description: 'Professional DSLR camera for photography enthusiasts.',
        price: 55000,
        image: 'https://picsum.photos/id/6/300/300',
      ),
      ProductModel(
        id: 7,
        name: 'Tablet',
        description: 'Portable tablet for entertainment and productivity.',
        price: 30000,
        image: 'https://picsum.photos/id/7/300/300',
      ),
      ProductModel(
        id: 8,
        name: 'Gaming Console',
        description: 'Next-gen gaming console for immersive gaming experience.',
        price: 40000,
        image: 'https://picsum.photos/id/8/300/300',
      ),
      ProductModel(
        id: 9,
        name: 'Bluetooth Speaker',
        description: 'Compact Bluetooth speaker with excellent sound quality.',
        price: 5000,
        image: 'https://picsum.photos/id/9/300/300',
      ),
      ProductModel(
        id: 10,
        name: 'Fitness Tracker',
        description:
            'Wearable fitness tracker to monitor your health and activity.',
        price: 8000,
        image: 'https://picsum.photos/id/10/300/300',
      ),
    ];
  }

  // Add To Cart
  void addToCart(ProductModel product) {
    bool exists = cartList.any((e) => e.id == product.id);

    if (exists) {
      Get.snackbar('Cart', 'Already added to cart');
    } else {
      cartList.add(product);
      Get.snackbar('Success', 'Product added to cart');
    }
  }

  // Remove From Cart
  void removeFromCart(ProductModel product) {
    cartList.removeWhere((e) => e.id == product.id);
  }

  // Add To Wishlist
  void addToWishlist(ProductModel product) {
    bool exists = wishlist.any((e) => e.id == product.id);

    if (exists) {
      Get.snackbar('Wishlist', 'Already added');
    } else {
      wishlist.add(product);
      Get.snackbar('Success', 'Added to wishlist');
    }
  }

  // Remove From Wishlist
  void removeFromWishlist(ProductModel product) {
    wishlist.removeWhere((e) => e.id == product.id);
  }

  // Check Wishlist
  bool isWishlisted(ProductModel product) {
    return wishlist.any((e) => e.id == product.id);
  }

  // Total Price
  double get totalPrice {
    return cartList.fold(0, (sum, product) => sum + product.price);
  }
}

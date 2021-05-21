// import 'package:cooking_app/models/product.dart';
// import 'package:cooking_app/services/products.dart';
// import 'package:flutter/material.dart';

// class AppProvider with ChangeNotifier {
//   List<Product> _featureProducts = [];
//   ProductService _productServices = ProductService();

//   AppProvider() {
//     _getFeaturedProducts();
//   }

//   //getter
//   List<Product> get featureProducts => _featureProducts;

//   //methods
//   void _getFeaturedProducts() async {
//     _featureProducts = await _productServices.getFeaturedProducts();
//     notifyListeners();
//   }
// }

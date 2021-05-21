import 'package:cooking_app/models/product.dart';
import 'package:cooking_app/services/products.dart';
import 'package:flutter/cupertino.dart';

class FoodData extends ChangeNotifier {
  bool isSelected = false;
  void updateSelected() {
    isSelected = !isSelected;
    notifyListeners();
  }

  List<Product> _featureProducts = [];
  ProductService _productServices = ProductService();

  FoodData() {
    _getFeaturedProducts();
  }

  //getter
  List<Product> get featureProducts => _featureProducts;

  //methods
  void _getFeaturedProducts() async {
    _featureProducts = await _productServices.getFeaturedProducts();
    notifyListeners();
  }
}

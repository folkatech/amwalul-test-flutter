import 'package:flutter/foundation.dart';
import 'package:product/data/repository/product_repository.dart';
import 'package:product/ui/ui_state.dart';

class ProductListProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  UiState _state = const UiState();

  UiState get state => _state;

  ProductListProvider() {
    getProductList();
  }

  Future<void> getProductList() async {
    _state = Loading();
    notifyListeners();

    try {
      final productList = await _productRepository.getProductList();
      _state = Success(data: productList);

      notifyListeners();
    } catch (e) {
      _state = const Failure(message: "Error fetching products");
      notifyListeners();
    }
  }
}

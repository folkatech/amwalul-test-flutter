import 'package:product/data/remote/api_service.dart';
import 'package:product/data/remote/response/product_response.dart';

abstract class ProductRepository {
  Future<List<ProductResponse>> getProductList();
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService = ApiService();

  @override
  Future<List<ProductResponse>> getProductList() {
    return _apiService.getProductList();
  }
}
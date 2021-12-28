import 'package:dio/dio.dart';
import 'package:product/data/remote/response/product_response.dart';
import 'package:product/utils/constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ProductResponse>> getProductList() async {
    final response = await _dio.get(
      "${kBaseUrl}52c41978-6e31-4ea3-b917-01899e3ed373",
    );

    final productList = (response.data as List?)
        ?.map((e) => ProductResponse.fromMap(e))
        .toList();

    return productList ?? [];
  }
}

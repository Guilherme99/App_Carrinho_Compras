import 'package:carrinho_compras/app/shared/models/products/products_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  late Dio dio;
  final url = 'https://fakestoreapi.com/products?limit=5';

  ProductRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<ProductModelRoot>> fetchProducts() async {
    List<ProductModelRoot> models = [];

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data as List;
        for (var item in data) {
          models.add(ProductModelRoot.fromJson(item));
        }
      }

      return models;
    } catch (e) {
      throw Exception();
    }
  }
}

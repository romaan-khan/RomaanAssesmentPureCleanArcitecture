import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../models/product_model.dart';



class ApiProvider extends GetxService {
  late dio.Dio _dio;
  final _baseUrl = 'https://www.oddaapp.com/appadmin/api/user/';

  ApiProvider() {
    _dio = dio.Dio();
  }

  Future<ApiProvider> init() async {
    return this;
  }

  String getApiUrl(String endpoint) {
    return _baseUrl + endpoint;
  }

  Future<ProductData> getProducts() async {
    var response = await _dio.get(getApiUrl("banners"));
    if (response.statusCode == 200) {
      return ProductData.fromJson(response.data);
    } else {
      throw Exception(response.data);
    }
  }
}

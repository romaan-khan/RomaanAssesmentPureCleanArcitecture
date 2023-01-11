import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';

import '../../../../data/models/product_model.dart';
import '../../../../data/providers/api_provider.dart';
import '../../../../utils/constants.dart';

class HomeRepository {
  late ApiProvider _apiProvider;

  HomeRepository() {
    _apiProvider = Get.find<ApiProvider>();
  }

  Future<ProductData> getProducts() async {
    if (await ConnectivityWrapper.instance.isConnected) {
      return _apiProvider.getProducts();
    } else {
      if (GetStorage().hasData(SharedPref.productDataKey)) {
        String jsonString = GetStorage().read(SharedPref.productDataKey);
        var jsonObject = jsonDecode(jsonString);
        return ProductData.fromJson(jsonObject);
      } else {
        throw Exception('No Internet connection and No Data stored in local.');
      }
    }
  }
}

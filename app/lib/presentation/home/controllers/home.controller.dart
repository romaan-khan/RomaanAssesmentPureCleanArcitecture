import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/product_model.dart';
import '../../../infrastructure/navigation/bindings/domains/home_repository.dart';
import '../../../utils/constants.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  HomeRepository? homeRepository;
  final productList = <ProductDatum>[].obs;

  HomeController() {
    homeRepository = HomeRepository();
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      isLoading.value = true;
      ProductData productData = await homeRepository!.getProducts();
      productList.assignAll(productData.data);
      var json = jsonEncode(productData);
      GetStorage().write(SharedPref.productDataKey, json);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      if (e is DioError) {
        Get.log('Upper ===  ${e.response!.data}');
      } else {
        Get.snackbar('', e.toString(),
            backgroundColor: Colors.black, colorText: Colors.white);
        Get.log('Lower ===  $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}

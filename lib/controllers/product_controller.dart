import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/recipes_model.dart';

class ProductController extends GetxController {
  RxList<ProductModal> productList = <ProductModal>[].obs;
  RxList<ProductModal> addToCartList = <ProductModal>[].obs;

  ProductController() {
    loadProductJsonData();
  }

  Future<void> loadProductJsonData() async {
    String assetJsonPath = "assets/json/product.json";

    String productdata = await rootBundle.loadString(assetJsonPath);

    List allproductdata = jsonDecode(productdata);

    productList.value = allproductdata
        .map(
          (e) => ProductModal.fromJson(json: e),
        )
        .toList();
  }

  void addToCartProduct({required ProductModal item}) {
    addToCartList.add(item);

    log("Cart List Length : ${addToCartList.length}");

    Get.back();
  }

  void removeFromCart({required ProductModal item}) {
    addToCartList.remove(item);
  }
}

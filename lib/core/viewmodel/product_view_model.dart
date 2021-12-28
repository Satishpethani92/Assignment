import 'package:assignment/core/constants/constants.dart';
import 'package:assignment/core/model/product_add_argument.dart';
import 'package:assignment/core/viewmodel/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewModel extends ChangeNotifier{
  List<ProductModel> _productList = productsList;
  List<ProductModel> get productList => _productList;
  ProductListview pc = Get.put(ProductListview());
  set productList(List<ProductModel> value) {
    _productList = value;
    notifyListeners();
  }

  void addProduct(product) {
    //productList.add(product);
    pc.products.add(product);
    notifyListeners();
  }

  void editProduct(ProductModel productModel) {

    print(productModel.id);
    int index =  pc.products.indexWhere((element) {

      return element!.id == productModel.id;
    });
    print(index);
    pc.products[productModel.id!] = productModel;
    notifyListeners();
  }

}
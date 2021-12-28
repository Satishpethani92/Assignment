import 'package:assignment/core/model/product_add_argument.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ProductListview extends GetxController {
  var products =<ProductModel?>[].obs;
  void add(ProductModel n) {
    products.add(n);
  }
  @override
  void onInit() {
    List? storedProducts=GetStorage().read<List>('products');
    if(storedProducts!=null){
      products=storedProducts.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    ever(products, (_){
      GetStorage().write('products',products.toList());
    });
    super.onInit();
  }




}

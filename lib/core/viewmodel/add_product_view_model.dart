import 'package:assignment/core/helper/navigation_service.dart';
import 'package:assignment/core/locator/locator.dart';
import 'package:assignment/core/model/product_add_argument.dart';
import 'package:assignment/core/viewmodel/product_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


import 'base_model.dart';

class AddProductViewModel extends BaseModel {
  int? id;
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var launchedAt = TextEditingController();
  var launchSiteController = TextEditingController();
  double _rating = 0.0;

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
    updateUI();
  }

  void resetData() {
    rating = 0.0;
    nameController.clear();
    launchedAt.clear();
    launchSiteController.clear();
  }

  void addProduct(ProductViewModel productViewModel, bool isEdit) {
    if (formKey.currentState!.validate()) {
      if (isEdit) {

        productViewModel.editProduct(ProductModel(
            id: id,
            name: nameController.text,
            popularity: rating,
            launchSite: launchSiteController.text,
            launchedAt: DateFormat("dd-MM-yyyy").format(DateFormat("yyyy-MM-dd").parse(launchedAt.text))));
      } else {
        productViewModel.addProduct(ProductModel(
            id: productViewModel.productList.length,
            name: nameController.text,
            popularity: rating,
            launchSite: launchSiteController.text,
            launchedAt: DateFormat("dd-MM-yyyy").format(DateFormat("yyyy-MM-dd").parse(launchedAt.text))));
      }
      final NavigationService _navigationService = locator<NavigationService>();
      _navigationService.pop();
    }
  }
}

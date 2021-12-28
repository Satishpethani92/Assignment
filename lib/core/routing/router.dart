import 'package:assignment/core/model/product_add_argument.dart';
import 'package:assignment/core/routing/routes.dart';
import 'package:assignment/ui/view/add_product.dart';
import 'package:assignment/ui/view/home_screen.dart';

import 'package:flutter/material.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HomeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);

      case Routes.AddProduct:
        ProductAddArgument productArgument = settings.arguments != null
            ? settings.arguments as ProductAddArgument
            : ProductAddArgument();
        return MaterialPageRoute(
            builder: (context) => AddProduct(productAddArgument: productArgument),settings: settings);
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}

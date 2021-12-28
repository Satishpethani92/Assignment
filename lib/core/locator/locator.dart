import 'package:assignment/core/helper/navigation_service.dart';
import 'package:assignment/core/viewmodel/add_product_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setupLocator(){
  locator.registerLazySingleton(() => AddProductViewModel());
  locator.registerLazySingleton(() => NavigationService());
}
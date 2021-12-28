import 'package:assignment/core/viewmodel/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...uiConsumableProvider,
];


List<SingleChildWidget> uiConsumableProvider = [
  ChangeNotifierProvider(create: (_) => ProductViewModel())
];

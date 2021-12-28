import 'package:assignment/core/constants/color_constants.dart';
import 'package:assignment/core/helper/navigation_service.dart';
import 'package:assignment/core/locator/locator.dart';
import 'package:assignment/core/preferences/Preferences.dart';
import 'package:assignment/core/routing/routes.dart';
import 'package:assignment/provider_setup.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'core/routing/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: providers,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: locator<NavigationService>().navigationKey,
          theme: ThemeData(
              primaryColor: ColorConstants.primaryColor,
              splashColor: ColorConstants.secondaryColor,
              brightness: Brightness.light),
          initialRoute: Routes.HomeScreen,
          onGenerateRoute:PageRouter.generateRoute),

    );
  }
}


import 'package:easy_bus_tracker/pages.dart';
import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/screens/splash/SplashPage.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:easy_bus_tracker/translations.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const EasyBusApp());
}
class EasyBusApp extends StatelessWidget {
  const EasyBusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var currentUserJsonString = box.read(APP_CONST.STORAGE_SECURITY_USER_ACC);
    //print("---<<$currentUserJsonString");

    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // Set your desired status bar color here
    ));


    return GetMaterialApp(
      key: UniqueKey(), // Set a unique key
      enableLog: true,
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en','US'),
      getPages: getPages,
      title: "Easy Bus Tracker",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialRoute: Routes.splash_route,//currentUserJsonString == null || currentUserJsonString == "" ? Routes.login : Routes.dashboard_route,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
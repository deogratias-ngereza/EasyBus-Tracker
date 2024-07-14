import 'dart:async';

import 'package:easy_bus_tracker/models/User.dart';
import 'package:easy_bus_tracker/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants.dart';


class SplashPageController extends GetxController{
  var box = GetStorage();

  void goToDashBoard() async{
    print("REASON AND MOVE");
    try{
      var userAccRaw = await box.read(APP_CONST.STORAGE_USER_ACC);
      print("--> USER SAVED --${userAccRaw}");
      if(userAccRaw != null && userAccRaw != ""){
        print("--> HAS USER --");
        var currentUser = User.fromJson(userAccRaw);

        if(currentUser.role == "ADMIN"){
          print("ADMIN AREA");
          Get.offAllNamed(Routes.admin_page_route);
        }
        else{
          //user
          print("USER AREA");
          Get.offAllNamed(Routes.bus_routes_route);
        }

        //Get.offNamed(Routes.bus_routes_route);
        //Get.toNamed(Routes.dashboard_route);
        //Get.offNamed(Routes.dashboard_route);
        //Get.offAllNamed(Routes.dashboard_route);
      }else{
        print("--> NO USER --");
        //Get.offAndToNamed(Routes.login_route);
        Get.offAllNamed(Routes.login_route);
      }
    }
    catch(e){
       print("EXP::" + e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 2), () {
      //Navigator.of(context).pushReplacement(
      //MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage with your actual home page
      //);
      //goToDashBoard();
      goToDashBoard();
    });

  }


}
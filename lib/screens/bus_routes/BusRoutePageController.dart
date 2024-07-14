import 'dart:convert';

import 'package:easy_bus_tracker/constants.dart';
import 'package:easy_bus_tracker/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/BusRoute.dart'; // Import your BusRoute model here

class BusRoutePageController extends GetxController {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var busRoutes = <BusRoute>[].obs;
  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchBusRoutes();
  }

  void fetchBusRoutes() {
    busRoutes.value = <BusRoute>[];
    dbRef.child('bus_routes').once().then((DatabaseEvent dbEvent) {
      DataSnapshot snapshot = dbEvent.snapshot;

      String jsonString = jsonEncode(snapshot.value);
      print("DB-EVENT JSON: $jsonString");

      if (snapshot.value != null) {
        busRoutes.value = BusRoute.fromJsonList(jsonDecode(jsonString));
      }

      print("DB-EVENT : ${snapshot.value}");
    }).catchError((error) {
      print('Error fetching bus routes: $error');
    });
  }

  void logout() async{
    try{
      await box.remove(APP_CONST.STORAGE_USER_ACC);
      Get.offNamed(Routes.login_route);
    }catch(e){

    }
  }

}

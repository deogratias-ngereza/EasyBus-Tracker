
import 'dart:convert';

import 'package:easy_bus_tracker/constants.dart';
import 'package:easy_bus_tracker/models/Bus.dart';
import 'package:easy_bus_tracker/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';


class AdmBusesPageController extends GetxController {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var buses = <Bus>[].obs;
  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchBuses();
  }

  void fetchBuses() {
    buses.value = <Bus>[];
    dbRef.child('buses').once().then((DatabaseEvent dbEvent) {
      DataSnapshot snapshot = dbEvent.snapshot;

      String jsonString = jsonEncode(snapshot.value);
      print("DB-EVENT JSON: $jsonString");

      if (snapshot.value != null) {
        buses.value = Bus.fromJsonList(jsonDecode(jsonString));
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

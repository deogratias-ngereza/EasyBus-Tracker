import 'dart:convert';

import 'package:easy_bus_tracker/constants.dart';
import 'package:easy_bus_tracker/models/User.dart';
import 'package:easy_bus_tracker/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';

class LoginPageController extends GetxController {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  var users = <User>[].obs;
  var box = GetStorage();

  Future<bool> login(inputAcc,inputPassword) async {
    try {
      DatabaseEvent dbEvent = await dbRef.child('users').once();

      DataSnapshot snapshot = dbEvent.snapshot;

      String jsonString = jsonEncode(snapshot.value);

      if (snapshot.value != null) {
        users.value = User.fromJsonList(jsonDecode(jsonString));


        bool canLogin = false;
        var currentUser = new User();
        for(var i =0; i < users.value.length;i++){
          if(users.value[i].accountNo.toString() == inputAcc.toString() && users.value[i].password.toString() ==inputPassword.toString()){
            currentUser = users.value[i];
            canLogin = true;break;
          }
        }

        if(canLogin){
          //store user in db
          await box.write(APP_CONST.STORAGE_USER_ACC, currentUser.toJson());

          if(currentUser.role == "ADMIN"){
            print("GO TO ADMIN DASHBOARD");
            Get.offNamed(Routes.admin_page_route);
          }
          else{
            Get.offNamed(Routes.bus_routes_route);
          }
        }
        else{
          Get.snackbar('Error', 'Invalid account number or password',
              snackPosition: SnackPosition.BOTTOM);
        }
        return canLogin;

      }
      return false;

    } catch (e) {
      print("Error: $e");
    }
    return false;
  }

  @override
  void onInit() {
    super.onInit();
  }
}

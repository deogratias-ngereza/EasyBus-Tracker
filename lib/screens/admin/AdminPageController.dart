import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants.dart';
import '../../routes.dart';


class AdminPageController extends GetxController{

  var box = GetStorage();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logout() async{
    try{
      await box.remove(APP_CONST.STORAGE_USER_ACC);
      Get.offNamed(Routes.login_route);
    }catch(e){

    }
  }
}
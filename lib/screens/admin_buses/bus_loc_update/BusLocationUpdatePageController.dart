import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../models/Bus.dart';

class  BusLocationUpdatePageController extends GetxController{

  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void updateLocation(Bus busObj, double lat, double long) async {
    print("Update Bus Location");
    isLoading.value = true;

    try {
      await dbRef.child('buses/${busObj.id}').update({
        'latitude': lat,
        'longitude': long,
      });
      print("Bus location updated successfully");
    } catch (error) {
      print("Error updating bus location: $error");
    } finally {
      isLoading.value = false;
    }
  }





}
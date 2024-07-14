import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/Bus.dart';
import 'BusLocationUpdatePageController.dart';

class BusLocationUpdatePage extends StatelessWidget {
  var selectedBus = new Bus();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  var c = Get.put(BusLocationUpdatePageController());

  BusLocationUpdatePage(Bus obj){
    selectedBus = obj;
    longitudeController.text = selectedBus.longitude.toString();
    latitudeController.text = selectedBus.latitude.toString();

  }

  void updateBusLocation() {
    // Implement the function to update the bus location
    // Use longitudeController.text and latitudeController.text to get the input values
    print('Updating bus location for: ${selectedBus.plateNo}');
    print('Longitude: ${longitudeController.text}');
    print('Latitude: ${latitudeController.text}');

    c.updateLocation(selectedBus,double.parse(latitudeController.text),double.parse(longitudeController.text.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bus LocSimulator: ${selectedBus.plateNo}"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Bus Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(
                labelText: 'Longitude',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(
                labelText: 'Latitude',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: updateBusLocation,
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Update Bus Location',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            
            Obx(() => Visibility(
                visible: c.isLoading.value,
                child: Center(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                )
            ))

          ],
        ),
      ),
    );
  }
}

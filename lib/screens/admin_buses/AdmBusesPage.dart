import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AdmBusesPageController.dart';
import 'bus_loc_update/BusLocationUpdatePage.dart';

class AdmBusesPage extends StatelessWidget {
  final AdmBusesPageController controller = Get.put(AdmBusesPageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: (){
              controller.fetchBuses();
            },
          ),
          appBar: AppBar(
            title: Text('Bus-Listing-Simulations'),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            leading: Icon(Icons.bus_alert_rounded),
            actions: [
              PopupMenuButton<String>(
                onSelected: (String result) {
                  if (result == 'logout') {
                    // Handle the logout action
                    // For example, you can navigate to the login page or clear user session
                    //Get.offAll(LoginPage());
                    controller.logout();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'refresh',
                    child: Text('Refresh'),
                  ),
                ],
              ),
            ],
          ),
          body: Obx(() => controller.buses.value.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: controller.buses.value.length,
            itemBuilder: (context, index) {
              var obj = controller.buses.value[index];
              return ListTile(
                leading: Icon(Icons.directions_bus, color:AppColors.primaryColor),
                title: Text(obj.plateNo.toString()),
                subtitle: Text(obj.currentRouteCode.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle route selection or navigation if needed
                  //Get.toNamed(Routes.route_map_buses_route);

                  Get.dialog(BusLocationUpdatePage(obj));

                },
              );
            },
          )),
        ),
        onWillPop: ()async{
          return true;
        });
  }
}

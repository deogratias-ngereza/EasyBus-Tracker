import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BusRoutePageController.dart';

class BusRoutePage extends StatelessWidget {
  final BusRoutePageController controller = Get.put(BusRoutePageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: (){
              controller.fetchBusRoutes();
            },
          ),
          appBar: AppBar(
            title: Text('Bus Routes'),
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
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ],
              ),
            ],
          ),
          body: Obx(() => controller.busRoutes.value.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: controller.busRoutes.value.length,
            itemBuilder: (context, index) {
              var route = controller.busRoutes.value[index];
              return ListTile(
                leading: Icon(Icons.directions_bus, color:AppColors.primaryColor),
                title: Text(route.routeName.toString()),
                subtitle: Text(route.routeCode.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle route selection or navigation if needed
                  Get.toNamed(Routes.route_map_buses_route);
                },
              );
            },
          )),
        ),
        onWillPop: ()async{
          return false;
        });
  }
}

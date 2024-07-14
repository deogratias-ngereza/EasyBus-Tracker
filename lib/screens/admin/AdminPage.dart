import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AdminPageController.dart';

class AdminPage extends StatelessWidget {
  //const AdminPage({Key? key}) : super(key: key);

  var c = Get.put(AdminPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Admin Area"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                // Handle the logout action
                //Get.offAll(LoginPage());
                c.logout();
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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.directions_bus, color: Colors.blue),
            title: Text('Buses'),
            onTap: () {
              // Navigate to Buses page
              //Get.to(BusesPage());
              Get.toNamed(Routes.admin_buses_route);
            },
          ),
          ListTile(
            leading: Icon(Icons.map, color: Colors.green),
            title: Text('Routes'),
            onTap: () {
              // Navigate to Routes page
              //Get.to(RoutesPage());
              Get.toNamed(Routes.bus_routes_route);
            },
          ),
          ListTile(
            leading: Icon(Icons.place, color: Colors.red),
            title: Text('Drop Points'),
            onTap: () {
              // Navigate to Drop Points page
              //Get.to(DropPointsPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.orange),
            title: Text('Users'),
            onTap: () {
              // Navigate to Users page
              //Get.to(UsersPage());
            },
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.grey),
            title: Text('Logout'),
            onTap: () {
              // Navigate to Users page
              //Get.to(UsersPage());
              c.logout();
            },
          ),

        ],
      ),
    );
  }
}

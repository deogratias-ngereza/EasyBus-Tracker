import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'RouteMapBusesPageController.dart';


import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class RouteMapBusesPage extends StatelessWidget {

  final List<Marker> _markers = [
    Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(39.21186804142327, -6.793581508934457),
      builder: (ctx) => Container(
        child: Column(
          children: [
            Icon(
              Icons.directions_bus,
              color: Colors.blue,
              size: 50.0,
            ),
            Text(
              'Bus 1',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    ),
    Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(-6.793581508934457,39.21186804142327),
      builder: (ctx) => Container(
        child: Column(
          children: [
            Icon(
              Icons.directions_bus,
              color: AppColors.primaryColor,
              size: 35.0,
            ),
            Text(
              'T130DXW',
              style: TextStyle(color: Colors.green,fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  ];
  var c = Get.put(RouteMapBusesPageController());



  @override
  Widget build(BuildContext context) {
    //monitorBusChanges();
    return Obx(() => Container(
      child: Column(
        children: [
          Expanded(child: FlutterMap(
            options: MapOptions(
              //initialCenter: LatLng(51.509364, -0.128928),
              //initialZoom: 9.2,
              //center: LatLng(39.21186804142327,-6.793581508934457),
                center: LatLng(-6.793581508934457,39.21186804142327),
                zoom: 12.5
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: c.busMarkers.value,
              ),
              /*PolylineLayer(
          polylines: [
            Polyline(
              points: [LatLng(-6.786210007096974,39.16644945546329), LatLng(-6.8215710869824959,39.28375036967111)],
              color: Colors.blue, // Color of the polyline
              strokeWidth: 3.0, // Width of the polyline
            ),
          ],
        ),*/
              /*RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () {
                //=> launchUrl(Uri.parse('https://openstreetmap.org/copyright')
                }
            ),
          ],
        ),*/
            ],
          )),

        ],
      ),
    ));
  }
}

/*
class RouteMapBusesPage extends StatelessWidget {
  final RouteMapBusesPageController controller = Get.put(RouteMapBusesPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          controller.fetchBusRoutes();
        },
      ),
      appBar: AppBar(
        title: Text('Mapped-Buses'),
        centerTitle: true,
      ),
      body: Obx(() => controller.buses.value.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: controller.buses.value.length,
        itemBuilder: (context, index) {
          var bus = controller.buses.value[index];
          return ListTile(
            leading: Icon(Icons.directions_bus, color: Colors.blue),
            title: Text(bus.plateNo.toString()),
            subtitle: Text(bus.currentRouteCode.toString()),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle route selection or navigation if needed
              Get.toNamed(Routes.route_map_buses_route);
            },
          );
        },
      )),
    );
  }
}
*/

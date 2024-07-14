import 'dart:convert';
import 'package:easy_bus_tracker/theme.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../models/Bus.dart'; // Import your BusRoute model here

class RouteMapBusesPageController extends GetxController {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
  var buses = <Bus>[].obs;
  var busMarkers = (<Marker>[]).obs;



  @override
  void onInit() {
    super.onInit();print("GRAND");
    monitorBusChanges();
    fetchBusRoutes();


    /*// Listen for changes in the 'buses' collection
    dbRef.child('buses').onValue.listen((event) {
      print("CHANGES---");
      // Handle data change
      DataSnapshot snapshot = event.snapshot;

      String jsonString = jsonEncode(snapshot.value);
      print("DB-EVENT-CHANGED JSON: $jsonString");
      //print('Bus data changed: ${event.snapshot.key}');
      //print('New data: ${event.snapshot.value}');
    });

    dbRef.child('buses').onChildChanged.listen((event) {
      print("CHILD-CHANGES CHANGES---");
    });*/

  }
  @override
  void onReady() {
    super.onReady();

  }
  void monitorBusChanges() {
    print("--FB-CHANGES MONITOR--");
    dbRef.child('buses').onChildAdded.listen((event) {
      print("CHILD ADDED: ${event.snapshot.value}");
      //updateBusList();
    });

    dbRef.child('buses').onChildChanged.listen((event) {
      print("CHILD CHANGED: ${event.snapshot.value}");
      //updateBusList();
      //for(var i = 0; i < bus){}
      fetchBusRoutes();
    });

    dbRef.child('buses').onChildRemoved.listen((event) {
      print("CHILD REMOVED: ${event.snapshot.value}");
      //updateBusList();
    });
  }


  void fetchBusRoutes() {
    buses.value = <Bus>[];
    dbRef.child('buses').once().then((DatabaseEvent dbEvent) {
      DataSnapshot snapshot = dbEvent.snapshot;

      String jsonString = jsonEncode(snapshot.value);
      print("DB-EVENT JSON: $jsonString");

      if (snapshot.value != null) {
        buses.value = Bus.fromJsonList(jsonDecode(jsonString));

        // create markers
        //busMarkers.value =
        var markers = <Marker>[];
        for(var i = 0; i < buses.value.length;i++){
          markers.add(getBusMarkerWidget(buses.value[i]));
        }
        busMarkers.value = markers;
        busMarkers.refresh();
      }

    }).catchError((error) {
      print('Error fetching bus routes: $error');
    });
  }

  Marker getBusMarkerWidget(Bus busInfo){
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(busInfo.latitude!,busInfo.longitude!),
      builder: (ctx) => Container(
        child: Column(
          children: [
            Icon(
              Icons.directions_bus,
              color: AppColors.primaryColor,
              size: 35.0,
            ),
            Text(
              "${busInfo.plateNo}",
              style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}

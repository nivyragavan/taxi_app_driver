import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constants/colors.dart';
import '../view/notification_screen.dart';
import '../widgets/drawer_widget.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Completer<GoogleMapController> googleMapCompleter = Completer();
  GoogleMapController? googleMapController;

  Position? currentPosition;
  var geoLocator = Geolocator();

  Future<Position?> locatePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    CameraPosition(target: latLngPosition, zoom: 20);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String address =
    // await ServiceMethods().searchCoordinateAddress(context, position);
    // print("This is your address " + address);

    return null;
  }

  final CameraPosition currentLocation =
  const CameraPosition(target: LatLng(11.0168, 76.9558), zoom: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          buildMap()
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: TextButton(onPressed: (){}, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Online Now',style: TextStyle(fontSize: 20),),
          Icon(Icons.phone_android_outlined)
        ],
      )),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 2, end: 5),
            badgeContent: const Text(
              '3',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: blueGreen,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notification_important_outlined,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(const NotificationScreen());
              },
            ),
          ),
        )
      ],
    );
  }

  buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: currentLocation,
      myLocationEnabled: true,
      // zoomGesturesEnabled: true,
      // zoomControlsEnabled: true,
      // polylines: polylineSet,
      // markers: markers,
      // circles: circles,
      onMapCreated: (GoogleMapController controller) {
        googleMapCompleter.complete(controller);
        googleMapController = controller;
        locatePosition();
      },
    );
  }
}

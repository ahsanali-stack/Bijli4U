
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:testproject/Factory/Factory.dart';

class MapScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Map();
  }

}

class Map extends State<MapScreen>{
  Location location = new Location();
  static var lat = 37.42796133580664;
  static var lng =  -122.08832357078792;

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(lat,lng),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  void initState() {
    isEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GoogleMap(
        mapType: MapType.terrain,
        zoomControlsEnabled: true,
        initialCameraPosition: _kGooglePlex,
        mapToolbarEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (controller) => {
          _controller.complete(controller)
        },
      ),
    );
  }

  void isEnabled() async {

    if(await Factory().isLocationServiceEnable())
      Factory().showSnackbar(context, "Location Enable");
    else
      Factory().showSnackbar(context, "Location False");

    if(await Factory().isLocationPermissionGranted())
      Factory().showSnackbar(context, "Permission Enable");
    else
      Factory().showSnackbar(context, "False");

    _locationData = await location.getLocation();
    //
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(LatLng(_locationData.latitude!,_locationData.longitude!)));
    StreamSubscription<LocationData> locationSubscription;

    locationSubscription = location.onLocationChanged.listen((LocationData currentLocation) async{
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(LatLng(currentLocation.latitude!,currentLocation.longitude!)));
    });

  }

}
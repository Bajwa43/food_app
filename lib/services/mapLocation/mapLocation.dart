import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utility/Constant/googleMap.dart';

class MapsLocation {
  static Future<String> convertToAddress(
      {required LatLng currentLocation}) async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.latitude, currentLocation.longitude);
    var data = placemark[0];

    return '${data.subLocality.toString()},${data.locality.toString()}';
  }

  // ....................................... On CameraPosiotion Method For Focusing On User Where he/she  During Live Movement
  static Future<void> onCameraPosition(
      LatLng position, Completer<GoogleMapController> _mapController) async {
    GoogleMapController controler = await _mapController.future;

    CameraPosition newCameraPosition =
        CameraPosition(target: position, zoom: 12);

    await controler
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

// .............................................................................. GENERATE POLYLINES IN MAP
  static Future<List<LatLng>> getPolylinePoints(
      {required LatLng startCordinate, required endCordinate}) async {
    List<LatLng> polylinesCordinates = [];

    print("ENTER IN METHOD");

    PolylinePoints polylinePoints = PolylinePoints();
    print('BEFORE GET ROUTE');

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        GoogleMapConstants.GOOGLE_API_KEY,
        PointLatLng(startCordinate.latitude, startCordinate.longitude),
        PointLatLng(endCordinate.latitude, endCordinate.longitude),
        travelMode: TravelMode.driving);
    print('AFTER ROUTE');

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylinesCordinates.add(LatLng(point.latitude, point.longitude));
      });

      // setState(() {});
    } else {
      print('....................>${result.errorMessage}');
    }

    print('POLYLINE CORNINATES >>>>> $polylinesCordinates');
    return polylinesCordinates;
  }

  // ............................................................................. GET LOCATION BY GEOLOCATOR PACKAJ
//   _getLocation() async
//       {
//         Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//         debugPrint('location: ${position.latitude}');
//         final coordinates = new Coordinates(position.latitude, position.longitude);
//         var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//         var first = addresses.first;
//         print("${first.featureName} : ${first.addressLine}");
//       }

  // Future getLiveLocation() async {
  //   var coordinates = LatLng(0, 0);
  //   Position? position;
  //   // Position? livePosition;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((value) {
  //     setState(() {
  //       position = value;
  //     });
  //   });

  //   // coordinates = LatLng(position.latitude, position.longitude);

  //   StreamSubscription<Position> positionStream =
  //       Geolocator.getPositionStream().listen((Position currrentPosition) {
  //     setState(() {
  //       position = currrentPosition;
  //     });
  //   });
  //   print(
  //       'position ------------------------------------------------------------------------------------> ${position!.latitude}');
  //   coordinates = LatLng(position!.latitude, position!.longitude);
  //   print(
  //       '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$coordinates');
  //   return coordinates;
  // }
}

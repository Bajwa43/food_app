import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:location/location.dart' as location;

import '../../services/mapLocation/mapLocation.dart';

part '_event.dart';
part '_state.dart';

class LocationBlocClass extends Bloc<LocationEventClass, LocationStateClass> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final location.Location _locationControler = location.Location();

  LocationBlocClass() : super(InitialState()) {
    initialMethod();

    // GET LIVE LOCATION AND LIVE CAMERA FOCUS Methd
  }

  Completer<GoogleMapController> onMapController(
      GoogleMapController controller) {
    mapController.complete(controller);
    return mapController;
  }

  initialMethod() async {
    try {
      location.PermissionStatus permissionStatus;
      LatLng currentLocation;
      String address = 'not found';

      // bool serviceEnable;

      // serviceEnable = await _locationControler.serviceEnabled();
      // if (serviceEnable) {
      //   serviceEnable = await _locationControler.requestService();
      // } else {
      //   return;
      // }

      permissionStatus = await _locationControler.hasPermission();
      if (permissionStatus == location.PermissionStatus.denied) {
        permissionStatus = await _locationControler.requestPermission();
      } else if (permissionStatus == location.PermissionStatus.granted) {
        currentLocation = LatLng(100, 100);
        emit(LocationLoadedState(currentLocation, address));
      }

      _locationControler.onLocationChanged
          .listen((location.LocationData currentData) async {
        currentLocation = LatLng(currentData.latitude!, currentData.longitude!);

        await MapsLocation.onCameraPosition(currentLocation, mapController);
        MapsLocation.convertToAddress(currentLocation: currentLocation)
            .then((value) {
          address = value;
          emit(LocationLoadedState(currentLocation, value));
          print('.................');
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

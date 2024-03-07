import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapTypeStateClass {}

class OnInitialMapTypeState extends MapTypeStateClass {}

class OnMapTypeChangedState extends MapTypeStateClass {
  final MapType mapType;

  OnMapTypeChangedState(this.mapType);
}

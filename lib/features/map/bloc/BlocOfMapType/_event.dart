import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class MapTypeEventClass {}

@immutable
class OnMapTypeChangeEvent extends MapTypeEventClass {
  final MapType mapType;

  OnMapTypeChangeEvent(this.mapType);
}

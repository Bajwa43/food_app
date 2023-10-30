part of '_bloc.dart';

@immutable
abstract class LocationEventClass {}

@immutable
class OnLiveLocationEvent extends LocationEventClass {
  final Completer<GoogleMapController> mapController;
  final location.Location locationControler;
  final MapType mapType;

  OnLiveLocationEvent(this.mapType, this.mapController, this.locationControler);
}

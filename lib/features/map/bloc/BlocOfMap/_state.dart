part of '_bloc.dart';

@immutable
abstract class LocationStateClass {}

class InitialState extends LocationStateClass {}

class LocationLoadedState extends LocationStateClass {
  final LatLng currentLocation;
  final String address;

  LocationLoadedState(this.currentLocation, this.address);
}

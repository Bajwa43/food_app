import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '_event.dart';
import '_state.dart';

class MapTypeBlocClass extends Bloc<MapTypeEventClass, MapTypeStateClass> {
  MapTypeBlocClass() : super(OnInitialMapTypeState()) {
    on<OnMapTypeChangeEvent>(
      (event, emit) {
        if (event == MapType.normal) {
          emit(OnMapTypeChangedState(MapType.satellite));
        } else {
          emit(OnMapTypeChangedState(MapType.normal));
        }
      },
    );
  }
}

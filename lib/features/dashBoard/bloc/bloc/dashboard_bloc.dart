import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
import 'package:food_panda_clone/services/Firebase/FirebaseServices.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as dev;

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<DashboardInitialEvent>(dashboardInitialEvent);
    on<DashboardProductDetailEvent>(dashboardOpenProductDetailState);
  }

  FutureOr<void> dashboardInitialEvent(
      DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    try {
      emit.call(DashboardLoadingState());
      FirebaseServices firebaseServices = FirebaseServices();
      List<FoodItemModel> listOfFood = await firebaseServices.getDashboardData(
          collectionName: event.collectionName);
      emit.call(DashboardLoadedState(listOfData: listOfFood));
    } catch (e) {
      emit(DashboardErrorState('Error To LOADED :> $e.toString()'));
    }
  }

  FutureOr<void> dashboardOpenProductDetailState(
      DashboardProductDetailEvent event, Emitter<DashboardState> emit) {
    emit(DashboardOpenProductDetailState(foodItemModel: event.foodItemModel));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_panda_clone/features/dashBoard/model/cart_product_model.dart';
import 'package:food_panda_clone/services/Firebase/FirebaseServices.dart';
import 'package:meta/meta.dart';

part 'carted_event.dart';
part 'carted_state.dart';

class CartedBloc extends Bloc<CartedEvent, CartedState> {
  CartedBloc() : super(CartedLoadingState()) {
    on<CartedInitialEvent>(cartedInitialEvent);
    on<CartedProductDeletedEvent>(cartedProductDeletedEvent);
  }

  FutureOr<void> cartedInitialEvent(
      CartedInitialEvent event, Emitter<CartedState> emit) async {
    List<CartedProductsModel> list;

    emit(CartedLoadingState());
    list = await FirebaseServices()
        .getCartedData(collectionName: 'CartedProducts');

    emit(CartedLoadedState(listOfCartedModel: list));
  }

  FutureOr<void> cartedProductDeletedEvent(
      CartedProductDeletedEvent event, Emitter<CartedState> emit) async {
    FirebaseServices firebaseServices = FirebaseServices();
    await firebaseServices.deleteDoc(
        collectionName: 'CartedProducts', docID: event.idOfDoc);
    List<CartedProductsModel> list =
        await firebaseServices.getCartedData(collectionName: 'CartedProducts');

    emit.call(CartedLoadedState(listOfCartedModel: list));
  }
}

part of 'carted_bloc.dart';

@immutable
sealed class CartedState {}

final class CartedInitialState extends CartedState {}

final class CartedLoadingState extends CartedState {}

final class CartedLoadedState extends CartedState {
  final List<CartedProductsModel> listOfCartedModel;
  CartedLoadedState({required this.listOfCartedModel});
}

final class CartedErrorState extends CartedState {
  final String errorMessage;

  CartedErrorState({required this.errorMessage});
}

final class CartedProductDeletedState extends CartedState {}

part of 'carted_bloc.dart';

@immutable
sealed class CartedEvent {}

final class CartedInitialEvent extends CartedEvent {}

class CartedProductDeletedEvent extends CartedEvent {
  final String idOfDoc;

  CartedProductDeletedEvent({required this.idOfDoc});
}

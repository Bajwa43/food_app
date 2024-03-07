part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetEvent {}

final class IncrementPrductItemEvent extends BottomSheetEvent {
  final int noOfItem;

  IncrementPrductItemEvent({required this.noOfItem});
}

final class DecrementPrductItemEvent extends BottomSheetEvent {
  final int noOfItem;

  DecrementPrductItemEvent({required this.noOfItem});
}

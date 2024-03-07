part of 'bottom_sheet_bloc.dart';

@immutable
sealed class BottomSheetState {}

final class BottomSheetInitial extends BottomSheetState {}

final class IncrementProductItemState extends BottomSheetState {
  final int noOfItem;
  IncrementProductItemState({required this.noOfItem});
}

final class DecrementProductItemState extends BottomSheetState {
  final int noOfItem;
  DecrementProductItemState({required this.noOfItem});
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as dev;

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(IncrementProductItemState(noOfItem: 1)) {
    on<IncrementPrductItemEvent>(incrementPrductItemEvent);
    on<DecrementPrductItemEvent>(decrementProductItemEvent);
  }

  FutureOr<void> incrementPrductItemEvent(
      IncrementPrductItemEvent event, Emitter<BottomSheetState> emit) {
    int no = event.noOfItem + 1;
    emit(IncrementProductItemState(noOfItem: no));
    dev.log(no.toString());
  }

  FutureOr<void> decrementProductItemEvent(
      DecrementPrductItemEvent event, Emitter<BottomSheetState> emit) {
    if (event.noOfItem > 1) {
      emit(DecrementProductItemState(noOfItem: event.noOfItem - 1));
    } else {
      emit(DecrementProductItemState(noOfItem: 1));
    }
  }
}

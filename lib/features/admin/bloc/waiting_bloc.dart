import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'waiting_event.dart';
part 'waiting_state.dart';

class WaitingBloc extends Bloc<WaitingEvent, WaitingState> {
  WaitingBloc() : super(WaitingInitialState()) {
    on<OnWaitingInitialEvent>((event, emit) {
      emit(WaitingInitialState());
    });

    on<OnWaitingLoadedEvent>((event, emit) {
      emit(WaitingLoadedState());
    });
  }
}

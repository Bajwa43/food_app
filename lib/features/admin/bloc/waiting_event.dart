part of 'waiting_bloc.dart';

@immutable
sealed class WaitingEvent {}

final class OnWaitingInitialEvent extends WaitingEvent {}

final class OnWaitingLoadedEvent extends WaitingEvent {}

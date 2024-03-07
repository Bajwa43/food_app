part of 'waiting_bloc.dart';

@immutable
sealed class WaitingState {}

final class WaitingInitialState extends WaitingState {}

final class WaitingLoadedState extends WaitingState {}

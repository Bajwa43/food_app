part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

abstract class DashboardActionState extends DashboardState {}

final class DashboardInitialState extends DashboardState {}

final class DashboardLoadingState extends DashboardState {}

@immutable
final class DashboardLoadedState extends DashboardState {
  List<FoodItemModel> listOfData;
  DashboardLoadedState({required this.listOfData});
}

final class DashboardErrorState extends DashboardState {
  final String errorMessage;

  DashboardErrorState(this.errorMessage);
}

final class DashboardOpenProductDetailState extends DashboardActionState {
  final FoodItemModel foodItemModel;

  DashboardOpenProductDetailState({required this.foodItemModel});
}

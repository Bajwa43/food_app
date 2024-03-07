part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

// abstract class DashboardActionEvent extends DashboardEvent {}

final class DashboardInitialEvent extends DashboardEvent {
  final String collectionName;

  DashboardInitialEvent({required this.collectionName});
}

final class DashboardProductDetailEvent extends DashboardEvent {
  final FoodItemModel foodItemModel;

  DashboardProductDetailEvent({required this.foodItemModel});
}

part of 'bloc_food_category_bloc.dart';

@immutable
sealed class BlocFoodCategoryEvent {}

class OnSelectCategoryEvent extends BlocFoodCategoryEvent {
  final String selectCategory;

  OnSelectCategoryEvent({required this.selectCategory});
}

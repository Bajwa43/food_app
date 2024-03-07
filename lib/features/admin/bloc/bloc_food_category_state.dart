part of 'bloc_food_category_bloc.dart';

@immutable
sealed class BlocFoodCategoryState {}

final class BlocFoodCategoryInitial extends BlocFoodCategoryState {}

final class LoadedFoodCategoryState extends BlocFoodCategoryState {
  final String selectedCategory;

  LoadedFoodCategoryState(this.selectedCategory);
}

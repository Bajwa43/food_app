import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_food_category_event.dart';
part 'bloc_food_category_state.dart';

class BlocFoodCategoryBloc
    extends Bloc<BlocFoodCategoryEvent, BlocFoodCategoryState> {
  BlocFoodCategoryBloc() : super(BlocFoodCategoryInitial()) {
    on<OnSelectCategoryEvent>((event, emit) {
      emit(LoadedFoodCategoryState(event.selectCategory));
    });
  }
}

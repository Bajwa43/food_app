import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
import 'package:food_panda_clone/features/dashBoard/bloc/bloc/dashboard_behaviour.dart';
import 'package:food_panda_clone/features/dashBoard/bloc/bloc/dashboard_bloc.dart';
import 'package:food_panda_clone/features/dashBoard/screens/HomePageComponents/serviceWidget.dart';
import 'dart:developer' as developer;

class CategoryLoadWidget extends StatefulWidget {
  const CategoryLoadWidget({
    required this.collectionName,
    super.key,
  });

  final String collectionName;

  @override
  State<CategoryLoadWidget> createState() => _CategoryLoadWidgetState();
}

class _CategoryLoadWidgetState extends State<CategoryLoadWidget> {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  // User? user = FirebaseAuth.instance.currentUser;
  DashboardBloc bloc = DashboardBloc();
  DashboardBehaviour dashboardBehaviour = DashboardBehaviour();

  final List<FoodItemModel> burgerList = [];

  @override
  Widget build(BuildContext context) {
    double width = THelpingFunction.screenWidth(context: context);
    double height = THelpingFunction.screenHeight(context: context);
    DashboardBloc bloc = DashboardBloc();
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      listener: (context, state) {
        if (state is DashboardOpenProductDetailState) {
          dashboardBehaviour.displayBottomSheet(
              context: context, foodItemModel: state.foodItemModel);
        }
      },
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DashboardLoadedState) {
          var foods = (state).listOfData;
          return GridView.builder(
            itemCount: foods.length,
            addAutomaticKeepAlives: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ServiceContainerWidget(
                imageOfServiceContainer: foods[index].imageUrl,
                textForServiceName: foods[index].itemName,
                textForProductPrice: foods[index].itemPrice,
                heightOfContainer: height * 0.2,
                widthOfContainer: width * 0.5,
                onTap: () {
                  bloc.add(
                      DashboardProductDetailEvent(foodItemModel: foods[index]));
                  // developer.log();
                },
              );
            },
          );
        } else if (state is DashboardErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is DashboardInitialState) {
          bloc.add(
              DashboardInitialEvent(collectionName: widget.collectionName));
          return Center(child: Text(state.toString()));
        } else {
          return const Center(child: Text('No State'));
        }
      },
    );
  }
}

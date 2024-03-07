import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda_clone/Utility/helpers/helping_function.dart';
import 'package:food_panda_clone/Widgets/customWidgets.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
import 'package:food_panda_clone/features/dashBoard/bloc/bloc/bottom_sheet_bloc.dart';
import 'package:food_panda_clone/features/dashBoard/bloc/bloc/dashboard_bloc.dart';
import 'package:food_panda_clone/features/dashBoard/model/cart_product_model.dart';
import 'package:food_panda_clone/features/dashBoard/screens/HomePageComponents/Drawer/DrawerWidgets/InkwellIconTextBtn.dart';
import 'dart:developer' as dev;

import 'package:food_panda_clone/services/Firebase/FirebaseServices.dart';

class DashboardBehaviour {
  static DashboardBehaviour? _dashboardBehaviour;

  DashboardBehaviour._internal();

  factory DashboardBehaviour() {
    return _dashboardBehaviour ??= DashboardBehaviour._internal();
  }

  Future displayBottomSheet({
    required BuildContext context,
    // required,
    required FoodItemModel foodItemModel,
  }) {
    double height = THelpingFunction.screenHeight(context: context) * 0.7;
    double width = THelpingFunction.screenWidth(context: context);
    int noOfItem = 1;

    // double height=height*0.01

    return showModalBottomSheet(
        useSafeArea: true,
        // anchorPoint: Offset(0, ),
        // constraints: BoxConstraints.loose(MediaQuery.of(context).size) * 0.95,
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(width * 0.1))),
        builder: (context) {
          BottomSheetBloc bottomSheetBloc = BottomSheetBloc();
          return SizedBox(
            height: height,
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.amber,
                  height: height * 0.85,
                  child: SingleChildScrollView(
                      // padding: EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      // .
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.5,
                            width: width,
                            child: Image.network(
                              foodItemModel.imageUrl,
                              fit: BoxFit.fill,
                              // color: Colors.grey,
                            ),
                          ),
                          //

                          SizedBox(
                            height: (height * 0.85) * 0.05,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05, right: width * 0.05),
                            child: SizedBox(
                              height: (height * 0.85) * 0.25,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(foodItemModel.itemName,
                                          style: TextStyle(
                                              fontSize: width * 0.06,
                                              fontWeight: FontWeight.w500))),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Rs.${foodItemModel.itemPrice}.00",
                                          style: TextStyle(
                                              fontSize: width * 0.06,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text('Single Serving',
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black45)))
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: height * 0.3,
                              color: Colors.grey.shade200,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05,
                                    right: width * 0.05,
                                    top: width * 0.025),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(foodItemModel.description,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54))),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Spacer(),
                Divider(height: 0),
                Container(
                  height: height * 0.15,
                  color: Colors.white,
                  child: Padding(
                    // padding: EdgeInsets.only(top: width * 0.1),
                    padding:
                        EdgeInsets.symmetric(vertical: (height * 0.15) * 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // .
                        SizedBox(
                          height: ((height * 0.15) * 0.45),
                          child: TWidgets.inkwellIconBtn(
                              color: Colors.black26,
                              context: context,
                              fun: () {
                                bottomSheetBloc.add(DecrementPrductItemEvent(
                                    noOfItem: noOfItem));
                              },
                              icon: Icons.remove),
                        ),
                        // ..

                        BlocConsumer<BottomSheetBloc, BottomSheetState>(
                          bloc: bottomSheetBloc,
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is IncrementProductItemState) {
                              noOfItem = state.noOfItem;
                              return Text(noOfItem.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500));
                            } else if (state is DecrementProductItemState) {
                              noOfItem = state.noOfItem;
                              return Text(noOfItem.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w500));
                            } else {
                              return Container(
                                  width: 5, height: 5, color: Colors.amber);
                            }
                          },
                        ),

                        // ...
                        SizedBox(
                          height: (height * 0.15) * 0.45,
                          child: TWidgets.inkwellIconBtn(
                              color: Colors.pink,
                              context: context,
                              fun: () {
                                bottomSheetBloc.add(IncrementPrductItemEvent(
                                    noOfItem: noOfItem));
                                // context.read<BottomSheetBloc>().add(
                                //     IncrementPrductItemEvent(
                                //         noOfItem: noOfItem));
                              },
                              icon: Icons.add),
                        ),
                        // ....
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: width * 0.4,
                          // height: heightOfSelectionLocationbtn,
                          decoration: BoxDecoration(
                              // color: Colors.lightBlue,
                              borderRadius:
                                  BorderRadius.circular(height * 0.02)),
                          child: TWidgets.inkWellBtn(
                              context: context,
                              fun: () {
                                CartedProductsModel cartedProductsModel =
                                    CartedProductsModel(
                                        itemName: foodItemModel.itemName,
                                        itemPrice:
                                            int.parse(foodItemModel.itemPrice),
                                        noOfItems: noOfItem,
                                        imageUrl: foodItemModel.imageUrl);

                                FirebaseServices firebaseServices =
                                    FirebaseServices();

                                firebaseServices.insertData(
                                    collectionName: 'CartedProducts',
                                    modelClass: cartedProductsModel);
                                Navigator.pop(context);
                                THelpingFunction.showSnackBar(
                                    context: context, message: 'Add to Cart');
                              },
                              btnText: 'Add To Cart',
                              color: Colors.pink),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

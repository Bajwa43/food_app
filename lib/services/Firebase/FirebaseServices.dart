import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_panda_clone/features/admin/models/food_item_model.dart';
import 'package:food_panda_clone/features/dashBoard/model/cart_product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as dev;

class FirebaseServices {
  static FirebaseServices? _dashBoardServices;

  FirebaseServices._internal();

  factory FirebaseServices() {
    return _dashBoardServices ??= FirebaseServices._internal();
  }

  Future<List<FoodItemModel>> getDashboardData(
      {required String collectionName}) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    List<FoodItemModel> data = documents.map((e) {
      return FoodItemModel.fromMap(e.data() as Map<String, dynamic>);
    }).toList();

    return data;
  }

  Future<List<CartedProductsModel>> getCartedData(
      {required String collectionName}) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    List<CartedProductsModel> data = documents.map((e) {
      // dev.log(e.id);
      Map<String, dynamic> map = e.data() as Map<String, dynamic>;
      return CartedProductsModel(
        id: e.id,
        itemName: map['itemName'] as String,
        itemPrice: map['itemPrice'] as num,
        noOfItems: map['noOfItems'] as num,
        imageUrl: map['imageUrl'] as String,
      );
      // return CartedProductsModel.fromMap(e.data() as Map<String, dynamic>);
    }).toList();

    return data;
  }

  Future insertData(
      {required String collectionName,
      required CartedProductsModel modelClass}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc()
        .set(modelClass.toMap());
  }

  deleteDoc({required String collectionName, required String docID}) {
    FirebaseFirestore.instance.collection(collectionName).doc(docID).delete();
  }
}

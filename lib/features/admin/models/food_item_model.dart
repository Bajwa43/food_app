// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FoodItemModel {
  String itemName;
  String itemPrice;
  String category;
  String description;
  String imageUrl;

  FoodItemModel({
    required this.itemName,
    required this.itemPrice,
    required this.category,
    required this.description,
    required this.imageUrl,
  });

  FoodItemModel copyWith({
    String? itemName,
    String? itemPrice,
    String? category,
    String? description,
    String? imageUrl,
  }) {
    return FoodItemModel(
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'itemPrice': itemPrice,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory FoodItemModel.fromMap(Map<String, dynamic> map) {
    return FoodItemModel(
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItemModel.fromJson(String source) =>
      FoodItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodItemModel(itemName: $itemName, itemPrice: $itemPrice, category: $category, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant FoodItemModel other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName &&
        other.itemPrice == itemPrice &&
        other.category == category &&
        other.description == description &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        itemPrice.hashCode ^
        category.hashCode ^
        description.hashCode ^
        imageUrl.hashCode;
  }

  factory FoodItemModel.fromSnapshote(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // var data=document.data();
    return FoodItemModel(
        itemName: document['itemName'],
        itemPrice: document['itemPrice'],
        category: document['category'],
        description: document['description'],
        imageUrl: document['imageUrl']);
  }
}

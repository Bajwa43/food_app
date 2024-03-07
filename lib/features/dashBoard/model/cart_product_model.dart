// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartedProductsModel {
  String? id;
  String itemName;
  num itemPrice;
  num noOfItems;
  String imageUrl;

  CartedProductsModel({
    this.id,
    required this.itemName,
    required this.itemPrice,
    required this.noOfItems,
    required this.imageUrl,
  });

  CartedProductsModel copyWith({
    String? id,
    String? itemName,
    num? itemPrice,
    num? noOfItems,
    String? imageUrl,
  }) {
    return CartedProductsModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      noOfItems: noOfItems ?? this.noOfItems,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'itemName': itemName,
      'itemPrice': itemPrice,
      'noOfItems': noOfItems,
      'imageUrl': imageUrl,
    };
  }

  factory CartedProductsModel.fromMap(Map<String, dynamic> map) {
    return CartedProductsModel(
      id: map['id'] != null ? map['id'] as String : null,
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as num,
      noOfItems: map['noOfItems'] as num,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartedProductsModel.fromJson(String source) =>
      CartedProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartedProductsModel(id: $id, itemName: $itemName, itemPrice: $itemPrice, noOfItems: $noOfItems, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant CartedProductsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.itemName == itemName &&
        other.itemPrice == itemPrice &&
        other.noOfItems == noOfItems &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        itemName.hashCode ^
        itemPrice.hashCode ^
        noOfItems.hashCode ^
        imageUrl.hashCode;
  }
}

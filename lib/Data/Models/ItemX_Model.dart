// To parse this JSON data, do
// final userX = userXFromJson(jsonString);

import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';

ItemX userXFromJson(String str) => ItemX.fromJson(json.decode(str));

String userXToJson(ItemX data) => json.encode(data.toJson());

class ItemX {
  final String? imageUrl;
  final String? title;
  final int? price;
  final String? productId;

  // factory ItemX.fromJson(Map<String, dynamic> json) => ItemX(
  //       imageUrl: json["IMAGE_URL"],
  //       title: json["TITLE"],
  //       price: json["PRICE"],
  //       quantity: json["QUANTITY"],
  //     );

  ItemX({this.imageUrl, this.title, this.price, this.productId});

  factory ItemX.fromJson(Map<String, dynamic> json) => ItemX(
      imageUrl: json["IMAGE_URL"],
      title: json["TITLE"],
      price: json["PRICE"],
      productId: json["PRODUCT_ID"]);

  Map<String, dynamic> toJson() => {
        "IMAGE_URL": imageUrl,
        "TITLE": title,
        "PRICE": price,
        "PRODUCT_ID": productId
      };

  //       ItemX.fromSnapshot(DocumentSnapshot documentSnapshot)
  //  : title = documentSnapshot.data()['TITLE'],
  //  imageUrl = documentSnapshot.data()['IMAGE_URL'],
  //  price = documentSnapshot.data()['PRICE']

  // Map toMap(UserX user) {
  //   var data = Map<String, dynamic>();
  //   data['UID'] = user.uid;
  //   data['NAME'] = user.name;
  //   data['EMAIL'] = user.email;
  //   data['USER_NAME'] = user.userName;
  //   data["PROFILE_PHOTO"] = user.profilePhoto;
  //   return data;
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/Data/Repository/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBMethods {
  static final FirebaseFirestore? _firestore = FirebaseFirestore.instance;
  static final CollectionReference? _shopCollectionReference =
      _firestore!.collection("SHOP_COLLECTION");

  static final CollectionReference? _userCollectionReference =
      _firestore!.collection("USERS_COLLECTION");

  static final AuthRepository _authRepository = AuthRepository();

  Future<List<ItemX>> fetchItemList() async {
    List<ItemX> itemList = [];
    QuerySnapshot<Map<String, dynamic>> data = await _shopCollectionReference!
        .doc("1")
        .collection("ITEM_COLLECTION")
        .get();
    data.docs.forEach((element) {
      itemList.add(ItemX.fromJson(element.data()));
    });

    // for (int i = 0; i < event.docs.length; i++) {
    //   var title = await event.docs[i].get("TITLE");
    //   var price = await event.docs[i].get("PRICE");
    //   var imageUrl = await event.docs[i].get("IMAGE_URL");
    //   ItemX itemX = ItemX(title: title, price: price, imageUrl: imageUrl);
    //   itemList.add(itemX);
    // }
    return itemList;
  }

  Future<List<ItemX>> fetchFavouriteItems() async {
    List<ItemX> favouriteItems = [];
    User? user = await _authRepository.getCurrentUser();
   QuerySnapshot<Map<String, dynamic>> data = await _userCollectionReference!
        .doc(user!.uid)
        .collection("FAVOURITE_ITEMS_COLLECTION")
        .get();
    // QuerySnapshot<Map<String, dynamic>> data = await _shopCollectionReference!
    //     .doc("1")
    //     .collection("ITEM_COLLECTION")
    //     .get();
     data.docs.forEach((element) async {
      favouriteItems.add(ItemX.fromJson(element.data()));
    });
    // for (int i = 0; i < event.docs.length; i++) {
    //   var title = await event.docs[i].get("TITLE");
    //   var price = await event.docs[i].get("PRICE");
    //   var imageUrl = await event.docs[i].get("IMAGE_URL");
    //   ItemX itemX = ItemX(title: title, price: price, imageUrl: imageUrl);
    //   itemList.add(itemX);
    // }
    return favouriteItems;
  }

  // static Future<List<ItemX?>> getList() async {
  //   QuerySnapshot<Map<String, dynamic>> documentSnapshot =
  //       await _collectionReference!
  //           .doc("1")
  //           .collection("ITEM_COLLECTION")
  //           .get();
  //   Map<String, dynamic> docX = documentSnapshot.docs as Map<String, dynamic>;
  // }

  Future<void> addFavouriteItem(ItemX itemX) async {
    User? user = await _authRepository.getCurrentUser();
    await _userCollectionReference!
        .doc(user!.uid)
        .collection("FAVOURITE_ITEMS_COLLECTION")
        .doc(itemX.productId)
        .set(itemX.toJson());
  }

  Future<bool> isFavouriteItem(ItemX itemX) async {
    User? user = await _authRepository.getCurrentUser();
    bool isFavouriteItem = true;

    await _userCollectionReference!
        .doc(user!.uid)
        .collection("FAVOURITE_ITEMS_COLLECTION")
        .doc(itemX.productId)
        .get()
        .then((value) {
      if (value.exists) {
        isFavouriteItem = true;
      } else {
        isFavouriteItem = false;
      }
    });
    return isFavouriteItem;
  }

  // Future<bool> isFavouriteItem(ItemX itemX) async {
  //   User user = await _authRepository.getCurrentUser();
  //   bool isFavouriteItem = true;
  //   await _userCollectionReference!
  //       .doc(user.uid)
  //       .collection("FAVOURITE_ITEMS_COLLECTION")
  //       .doc(itemX.productId)
  //       .get()
  //       .then((value) {
  //     if (value.exists) {
  //       isFavouriteItem = true;
  //     } else {
  //       isFavouriteItem = false;
  //     }
  //     // for (int i = 0; i < value.docs.length; i++) {
  //     //   if (value.docs[i].exists) {
  //     //     isFavouriteItem = true;
  //     //     break;
  //     //   }
  //     // }
  //     // value.docs.forEach((element) {
  //     //   element.exists;
  //     // }
  //   });
  //   return isFavouriteItem;
  // }

}

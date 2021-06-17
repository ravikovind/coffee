import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';

class DBMethods {
  static final FirebaseFirestore? _firestore = FirebaseFirestore.instance;
  static final CollectionReference? _collectionReference =
      _firestore!.collection("SHOP_COLLECTION");
  Future<List<ItemX?>> fetchItemList() async {
    List<ItemX?> itemList = [];
    _collectionReference!
        .doc("1")
        .collection("ITEM_COLLECTION")
        .snapshots()
        .asyncMap((event) async {
      for (int i = 0; i < event.docs.length; i++) {
        var title = await event.docs[i].get("TITLE");
        var price = await event.docs[i].get("PRICE");
        var imageUrl = await event.docs[i].get("IMAGE_URL");
        ItemX itemX = ItemX(title: title, price: price, imageUrl: imageUrl);
        itemList.add(itemX);
      }
    });
    return itemList;
  }

  // static Future<List<ItemX?>> getList() async {
  //   QuerySnapshot<Map<String, dynamic>> documentSnapshot =
  //       await _collectionReference!
  //           .doc("1")
  //           .collection("ITEM_COLLECTION")
  //           .get();
  //   Map<String, dynamic> docX = documentSnapshot.docs as Map<String, dynamic>;
  // }
}

import 'package:flutter/material.dart';
import 'package:signup/BLoC/cubit/item_cubit.dart';

import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/UI/Pages/CartPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List<ItemX> items = [
  //   ItemX(
  //     title: "Coffee",
  //     price: 10,
  //     imageUrl:
  //         "https://firebasestorage.googleapis.com/v0/b/assignment-65eaf.appspot.com/o/IMAGES%2Fpexels-tirachard-kumtanom-544113.jpg?alt=media&token=46f1e503-dbdf-4a0c-804c-d3f69f2da2be",
  //   ),
  //   ItemX(
  //     title: "Coffee Y",
  //     price: 9,
  //     imageUrl:
  //         "https://firebasestorage.googleapis.com/v0/b/assignment-65eaf.appspot.com/o/IMAGES%2Fpexels-tirachard-kumtanom-544113.jpg?alt=media&token=46f1e503-dbdf-4a0c-804c-d3f69f2da2be",
  //   ),
  //   ItemX(
  //     title: "Coffee",
  //     price: 10,
  //     imageUrl:
  //         "https://firebasestorage.googleapis.com/v0/b/assignment-65eaf.appspot.com/o/IMAGES%2Fpexels-tirachard-kumtanom-544113.jpg?alt=media&token=46f1e503-dbdf-4a0c-804c-d3f69f2da2be",
  //   ),
  //   ItemX(
  //     title: "Coffee XX",
  //     price: 10,
  //     imageUrl:
  //         "https://firebasestorage.googleapis.com/v0/b/assignment-65eaf.appspot.com/o/IMAGES%2Fpexels-tirachard-kumtanom-544113.jpg?alt=media&token=46f1e503-dbdf-4a0c-804c-d3f69f2da2be",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(builder: (context, state) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: state.itemX.isEmpty
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return CartPage();
                          }));
                },
                label: const Text(
                  '      Checkout      ',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                icon: Icon(
                  Icons.shopping_cart,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/1.jpg",
                        ),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: ListTile(
                    tileColor: Colors.transparent,
                    leading: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    trailing: Container(
                        height: 60.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 24.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                child: Text(
                  "Starbucks Coffee",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.location_pin),
                  title: Text(
                    "avenues St. 187",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.people),
                  title: Text(
                    "2990+ orders placed to make poeple smile",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("SHOP_COLLECTION")
                    .doc("1")
                    .collection("ITEM_COLLECTION")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Text(
                      "Loading Items ....",
                      textAlign: TextAlign.center,
                    ));
                  }
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text(
                      "no Items ....",
                      textAlign: TextAlign.center,
                    ));
                  }
                  var items = snapshot.data!.docs;
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1.75),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: items.map((e) {
                      return Container(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(
                                e.get("IMAGE_URL").toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    e.get("TITLE").toString(),
                                  ),
                                  Text(
                                    e.get("TITLE").toString(),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rs " + e.get("PRICE").toString(),
                                      ),
                                      MaterialButton(
                                        padding: EdgeInsets.all(12.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0))),
                                        elevation: 4.0,
                                        color: Colors.red,
                                        onPressed: () {
                                          // ItemX itemX = ItemX(
                                          //     imageUrl: e.get("IMAGE_URL"),
                                          //     title: e.get("TITLE"),
                                          //     price: e.get("PRICE"));
                                          BlocProvider.of<ItemCubit>(context)
                                              .addItemX(
                                                  ItemX.fromJson(e.data()));
                                          final snackBar = SnackBar(
                                              duration: Duration(seconds: 2),
                                              backgroundColor: Colors.white,
                                              content: ListTile(
                                                tileColor: Colors.white,
                                                title: Text(
                                                  e.get("TITLE").toString() +
                                                      " Added",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.red),
                                                ),
                                                subtitle: Text(
                                                  "Rs - " +
                                                      e.get("PRICE").toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.red),
                                                ),
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              // BlocBuilder<ShopitemCubit, ShopitemState>(
              //   builder: (context, state) {
              //     if (!(state is ShopitemDone)) {
              //       return Center(
              //           child: Text(
              //         "Loading Items ....",
              //         textAlign: TextAlign.center,
              //       ));
              //     }
              //     List<ItemX?> items = state.itemX;
              //     return GridView.count(
              //       crossAxisCount: 2,
              //       childAspectRatio: (1 / 1.75),
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       children: items.map((e) {
              //         return Container(
              //           padding: EdgeInsets.all(12.0),
              //           child: Column(
              //             children: [
              //               Container(
              //                 child: Image.asset(
              //                   "assets/1.jpg",
              //                   fit: BoxFit.contain,
              //                 ),
              //               ),
              //               Container(
              //                 alignment: Alignment.bottomLeft,
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(
              //                       height: 8.0,
              //                     ),
              //                     Text(
              //                       e!.title.toString(),
              //                     ),
              //                     Text(
              //                       e.title.toString(),
              //                       style: TextStyle(
              //                         fontSize: 20.0,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: 12.0,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           "Rs " + e.price.toString(),
              //                         ),
              //                         MaterialButton(
              //                           padding: EdgeInsets.all(12.0),
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.all(
              //                                   Radius.circular(6.0))),
              //                           elevation: 4.0,
              //                           color: Colors.red,
              //                           onPressed: () {
              //                             BlocProvider.of<ItemCubit>(context)
              //                                 .addItemX(e);
              //                             final snackBar = SnackBar(
              //                                 duration: Duration(seconds: 2),
              //                                 backgroundColor: Colors.white,
              //                                 content: ListTile(
              //                                   tileColor: Colors.white,
              //                                   title: Text(
              //                                     e.title.toString() + " Added",
              //                                     textAlign: TextAlign.center,
              //                                     style: TextStyle(
              //                                         fontSize: 20.0,
              //                                         color: Colors.red),
              //                                   ),
              //                                   subtitle: Text(
              //                                     "Rs - " + e.price.toString(),
              //                                     textAlign: TextAlign.center,
              //                                     style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         color: Colors.red),
              //                                   ),
              //                                 ));
              //                             ScaffoldMessenger.of(context)
              //                                 .showSnackBar(snackBar);
              //                           },
              //                           child: const Text(
              //                             'Add',
              //                             style: TextStyle(color: Colors.white),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         );
              //       }).toList(),
              //     );
              //   },
              // )

              // BlocBuilder<ItemCubit, ItemState>(
              //   builder: (context, state) {
              //     List<ItemX> items = state.itemX;
              //     return items.isEmpty
              //         ? Container()
              //         : Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //             child: FloatingActionButton.extended(
              //               // minWidth: double.maxFinite,
              //               // height: 60.0,
              //               // padding: EdgeInsets.all(12.0),
              //               // shape: RoundedRectangleBorder(
              //               //     borderRadius:
              //               //         BorderRadius.all(Radius.circular(6.0))),
              //               // elevation: 4.0,
              //               // color: Colors.red,
              //               onPressed: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         fullscreenDialog: true,
              //                         builder: (BuildContext context) {
              //                           return CartPage();
              //                         }));
              //               },
              //               icon: Icon(Icons.shopping_cart),
              //               label: const Text(
              //                 'Checkout',
              //                 style:
              //                     TextStyle(color: Colors.white, fontSize: 24.0),
              //               ),
              //             ),
              //           );
              //   },
              // ),
              SizedBox(
                height: 32.0,
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: items.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       padding: EdgeInsets.all(8.0),
              //       child: Stack(
              //         children: [
              //           Container(
              //             child: Image.asset(
              //               "assets/1.jpg",
              //               fit: BoxFit.contain,
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // )
              // BlocBuilder<ItemCubit, ItemState>(
              //   builder: (context, state) {
              //     List<ItemX> items = state.itemX;
              //     return ListView.builder();
              //   },
              // )
            ],
          ),
        ),
      );
    });
  }
}

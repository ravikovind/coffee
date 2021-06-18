import 'package:flutter/material.dart';
import 'package:signup/BLoC/cubit/fetch_favourite_items_cubit.dart';
import 'package:signup/BLoC/cubit/item_cubit.dart';
import 'package:signup/Data/Models/ItemX_Model.dart';
import 'package:signup/UI/Pages/CartPage.dart';
import 'package:signup/UI/Widgets/MyImageWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteItemsPage extends StatelessWidget {
  const FavouriteItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchFavouriteItemsCubit>(context).fetchFavouriteItems();
    return BlocBuilder<ItemCubit, ItemState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Items"),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
                child: Text(
                  "Favourite Items",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              BlocBuilder<FetchFavouriteItemsCubit, FetchFavouriteItemsState>(
                builder: (context, state) {
                  if (!(state is FetchFavouriteItemsDone)) {
                    return Center(
                        child: Text(
                      "Loading Favourite Items ....",
                      textAlign: TextAlign.center,
                    ));
                  }
                  List<ItemX?> items = state.itemX;
                  return items.isEmpty
                      ? Center(
                          child: Text(
                            "not have any Favourite Items",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height),
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  MyImageWidget(
                                    h: 200.0,
                                    w: 200.0,
                                    r: 12.0,
                                    url: items[index]!.imageUrl.toString(),
                                  ),
                                  // Container(
                                  //   child: Image.network(
                                  //     e.imageUrl.toString(),
                                  //     fit: BoxFit.contain,
                                  //   ),
                                  // ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          items[index]!.title.toString(),
                                        ),
                                        Text(
                                          items[index]!.title.toString(),
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
                                              "Rs " +
                                                  items[index]!
                                                      .price
                                                      .toString(),
                                            ),
                                            MaterialButton(
                                              padding: EdgeInsets.all(12.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              6.0))),
                                              elevation: 4.0,
                                              color: Colors.red,
                                              onPressed: () {
                                                BlocProvider.of<ItemCubit>(
                                                        context)
                                                    .addItemX(items[index]!);
                                                final snackBar = SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    backgroundColor:
                                                        Colors.white,
                                                    content: ListTile(
                                                      tileColor: Colors.white,
                                                      title: Text(
                                                        items[index]!
                                                                .title
                                                                .toString() +
                                                            " Added",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.red),
                                                      ),
                                                      subtitle: Text(
                                                        "Rs - " +
                                                            items[index]!
                                                                .price
                                                                .toString(),
                                                        textAlign:
                                                            TextAlign.center,
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
                                                style: TextStyle(
                                                    color: Colors.white),
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
                          },
                        );
                },
              ),
              SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:signup/UI/Pages/CartPage.dart';
import 'package:signup/UI/Pages/FavouriteItemsPage.dart';
import 'package:signup/UI/Pages/ShopPage.dart';
import 'package:signup/UI/Pages/UserProfilePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 24.0,
            ),
            onPressed: () {
              // showModalBottomSheet(
              //     context: context,
              //     barrierColor: Colors.transparent,
              //     elevation: 24.0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(,
              //           topLeft: Radius.circular(8.0),
              //           topRight: Radius.circular(8.0)),
              //     ),
              //     builder: (context) {
              //       // return StreamBuilder(
              //       //     stream: _methods.getCurrentUser().asStream(),
              //       //     builder: (BuildContext context,
              //       //         AsyncSnapshot<User> snapshot) {
              //       //       if (snapshot.connectionState ==
              //       //               ConnectionState.waiting ||
              //       //           !snapshot.hasData ||
              //       //           snapshot.data == null) {
              //       //         return Center(
              //       //           child: CircularProgressIndicator(
              //       //             backgroundColor: Colors.white,
              //       //             strokeWidth: 2.0,
              //       //           ),
              //       //         );
              //       //       } else {
              //       return StreamBuilder(
              //           stream: FirebaseAuth.instance.authStateChanges(),
              //           builder: (BuildContext context,
              //               AsyncSnapshot<User?> snapshot) {
              //             if (snapshot.connectionState ==
              //                 ConnectionState.waiting) {
              //               return Text("Loading ...");
              //             }
              //             if (!snapshot.hasData || snapshot.data == null) {
              //               return Text("Something went wrong!!");
              //             }
              //             return SingleChildScrollView(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: <Widget>[
              //                   SizedBox(
              //                     height: MediaQuery.of(context).size.height *
              //                         0.025,
              //                   ),
              //                   ListTile(
              //                       leading: IconButton(
              //                     icon: Icon(
              //                       Icons.close,
              //                     ),
              //                     onPressed: () {
              //                       Navigator.pop(context);
              //                     },
              //                   )),
              //                   snapshot.data!.photoURL.toString() == "null"
              //                       ? Container()
              //                       : CircleAvatar(
              //                           backgroundColor: Colors.orange,
              //                           radius: MediaQuery.of(context)
              //                                   .size
              //                                   .height *
              //                               0.1550,
              //                           child: CircleAvatar(
              //                             radius: MediaQuery.of(context)
              //                                     .size
              //                                     .height *
              //                                 0.1425,
              //                             backgroundImage: NetworkImage(
              //                                 snapshot.data!.photoURL
              //                                     .toString()),
              //                             backgroundColor: Colors.white,
              //                           ),
              //                         ),
              //                   SizedBox(
              //                     height: 16.0,
              //                   ),
              //                   snapshot.data!.displayName.toString() ==
              //                           "null"
              //                       ? Container()
              //                       : ListTile(
              //                           onTap: () {
              //                             Navigator.pop(context);
              //                             showDialog(
              //                               barrierColor: Colors.transparent,
              //                               context: context,
              //                               builder: (BuildContext context) {
              //                                 return AlertDialog(
              //                                   shape: RoundedRectangleBorder(
              //                                       borderRadius:
              //                                           BorderRadius.all(
              //                                               Radius.circular(
              //                                                   8.0))),
              //                                   content: ListTile(
              //                                     onTap: () {
              //                                       Navigator.of(context,
              //                                               rootNavigator:
              //                                                   true)
              //                                           .pop('dialog');
              //                                       BlocProvider.of<
              //                                                   SignupwithgoogleCubit>(
              //                                               context)
              //                                           .signOut();
              //                                       // _methods
              //                                       //     .signOut()
              //                                       //     .whenComplete(() {
              //                                       //   Navigator.pop(context);
              //                                       //   setState(() {});
              //                                       // });
              //                                     },
              //                                     trailing: Icon(
              //                                       Icons.logout,
              //                                       color: Colors.redAccent,
              //                                       size: 16.0,
              //                                     ),
              //                                     leading: Text(
              //                                       "sign out",
              //                                       textAlign:
              //                                           TextAlign.center,
              //                                       style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         color: Colors.redAccent,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 );
              //                               },
              //                             );
              //                           },
              //                           contentPadding: EdgeInsets.symmetric(
              //                               horizontal: MediaQuery.of(context)
              //                                       .size
              //                                       .height *
              //                                   0.125),
              //                           leading: Text(
              //                             snapshot.data!.displayName
              //                                 .toString(),
              //                             textAlign: TextAlign.center,
              //                             style: TextStyle(
              //                               fontSize: 16.0,
              //                             ),
              //                           ),
              //                           trailing: Icon(
              //                             Icons.logout,
              //                             size: 20.0,
              //                           ),
              //                         ),
              //                   SizedBox(
              //                     height: 16.0,
              //                   ),
              //                   snapshot.data!.displayName.toString() !=
              //                           "null"
              //                       ? Container()
              //                       : ListTile(
              //                           onTap: () {
              //                             Navigator.pop(context);
              //                             showDialog(
              //                               barrierColor: Colors.transparent,
              //                               context: context,
              //                               builder: (BuildContext context) {
              //                                 return AlertDialog(
              //                                   shape: RoundedRectangleBorder(
              //                                       borderRadius:
              //                                           BorderRadius.all(
              //                                               Radius.circular(
              //                                                   8.0))),
              //                                   content: ListTile(
              //                                     onTap: () {
              //                                       Navigator.of(context,
              //                                               rootNavigator:
              //                                                   true)
              //                                           .pop('dialog');
              //                                       BlocProvider.of<
              //                                                   SignupwithgoogleCubit>(
              //                                               context)
              //                                           .signOut();
              //                                       // _methods
              //                                       //     .signOut()
              //                                       //     .whenComplete(() {
              //                                       //   Navigator.pop(context);
              //                                       //   setState(() {});
              //                                       // });
              //                                     },
              //                                     trailing: Icon(
              //                                       Icons.logout,
              //                                       color: Colors.redAccent,
              //                                       size: 16.0,
              //                                     ),
              //                                     leading: Text(
              //                                       "sign out",
              //                                       textAlign:
              //                                           TextAlign.center,
              //                                       style: TextStyle(
              //                                         fontSize: 16.0,
              //                                         color: Colors.redAccent,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 );
              //                               },
              //                             );
              //                           },
              //                           contentPadding: EdgeInsets.symmetric(
              //                               horizontal: MediaQuery.of(context)
              //                                       .size
              //                                       .height *
              //                                   0.125),
              //                           leading: Text(
              //                             snapshot.data!.email.toString(),
              //                             textAlign: TextAlign.center,
              //                             style: TextStyle(
              //                               fontSize: 16.0,
              //                             ),
              //                           ),
              //                           trailing: Icon(
              //                             Icons.logout,
              //                             size: 20.0,
              //                           ),
              //                         ),
              //                   ListTile(
              //                     onTap: () {
              //                       // Navigator.push(
              //                       //     context,
              //                       //     MaterialPageRoute(
              //                       //         fullscreenDialog: true,
              //                       //         builder: (BuildContext context) {
              //                       //           return SettingsPage();
              //                       //         }));
              //                     },
              //                     contentPadding: EdgeInsets.symmetric(
              //                         horizontal:
              //                             MediaQuery.of(context).size.height *
              //                                 0.125),
              //                     trailing: Icon(
              //                       Icons.settings,
              //                       size: 20.0,
              //                     ),
              //                     leading: Text(
              //                       "Settings",
              //                       textAlign: TextAlign.center,
              //                       style: TextStyle(
              //                         fontSize: 16.0,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           });
              //     });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return UserProfilePage();
                      }));
            },
          ),
          title: Text("Welcome"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return FavouriteItemsPage();
                          }));
                },
                icon: Icon(Icons.favorite)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return CartPage();
                          }));
                },
                icon: Icon(Icons.shopping_cart)),
          ],
        ),
        // body: Center(
        //   child: TextButton(
        //     onPressed: () {
        //       BlocProvider.of<SignupwithgoogleCubit>(context).signOut();
        //     },
        //     child: Text("sign out"),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   child: Image.network(
              //     "https://firebasestorage.googleapis.com/v0/b/assignment-65eaf.appspot.com/o/IMAGES%2Fpexels-tirachard-kumtanom-544113.jpg?alt=media&token=46f1e503-dbdf-4a0c-804c-d3f69f2da2be",
              //     fit: BoxFit.contain,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Shops",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ),
              ExpansionTile(
                leading: Icon(Icons.coffee),
                title: Text(
                  "Starbucks Coffee",
                  style: TextStyle(fontSize: 24.0),
                ),
                subtitle: Text(
                    "Address: NH30, Gomti Nagar, Lucknow, Uttar Pradesh 226002"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        "Seattle Washington based coffee retailer and coffee bean roasting brand Starbucks Coffee are arguably the most successful coffee chains in the world. This American-born coffee brand has become so popular it is literally a part of daily life for many people living in the cities and suburbs."),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(240.0, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ShopPage();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Buy',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

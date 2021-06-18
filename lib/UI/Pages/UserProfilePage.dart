import 'package:flutter/material.dart';
import 'package:signup/BLoC/cubit/getuser_cubit.dart';
import 'package:signup/BLoC/cubit/signup_cubit.dart';
import 'package:signup/Data/Models/UserX_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/UI/Widgets/Indicator.dart';
import 'package:signup/UI/Widgets/MyImageWidget.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetuserCubit, GetuserState>(
      builder: (context, state) {
        if (!(state is GetUserDone)) {
          return Indicator();
        }
        UserX? userX = state.userX;
        return Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              // ListTile(
              //     leading: IconButton(
              //   icon: Icon(
              //     Icons.close,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // )),
              userX!.profilePhoto == "null"
                  ? Container()
                  // : MyImageWidget(
                  //       url: userX.profilePhoto.toString(),
                  //     ),

                  : MyImageWidget(
                      h: 200.0,
                      w: 200.0,
                      r: 40.0,
                      url: userX.profilePhoto.toString(),
                    ),

              SizedBox(
                height: 32.0,
              ),
              userX.name.toString() == "null"
                  ? Container()
                  : ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              content: ListTile(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');
                                  BlocProvider.of<SignupCubit>(context)
                                      .signOut();
                                  // _methods
                                  //     .signOut()
                                  //     .whenComplete(() {
                                  //   Navigator.pop(context);
                                  //   setState(() {});
                                  // });
                                },
                                trailing: Icon(
                                  Icons.logout,
                                  color: Colors.redAccent,
                                  size: 16.0,
                                ),
                                leading: Text(
                                  "sign out",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.height * 0.125),
                      leading: Text(
                        userX.name.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      trailing: Icon(
                        Icons.logout,
                        size: 20.0,
                      ),
                    ),
              SizedBox(
                height: 16.0,
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     showDialog(
              //       barrierColor: Colors.transparent,
              //       context: context,
              //       builder: (BuildContext context) {
              //         return AlertDialog(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.all(
              //                   Radius.circular(8.0))),
              //           content: ListTile(
              //             onTap: () {
              //               Navigator.of(context,
              //                       rootNavigator: true)
              //                   .pop('dialog');
              //               BlocProvider.of<
              //                           SignupwithgoogleCubit>(
              //                       context)
              //                   .signOut();
              //               // _methods
              //               //     .signOut()
              //               //     .whenComplete(() {
              //               //   Navigator.pop(context);
              //               //   setState(() {});
              //               // });
              //             },
              //             trailing: Icon(
              //               Icons.logout,
              //               color: Colors.redAccent,
              //               size: 16.0,
              //             ),
              //             leading: Text(
              //               "sign out",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                 fontSize: 16.0,
              //                 color: Colors.redAccent,
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              //   contentPadding: EdgeInsets.symmetric(
              //       horizontal:
              //           MediaQuery.of(context).size.height *
              //               0.125),
              //   leading: Text(
              //     userX.email.toString(),
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 16.0,
              //     ),
              //   ),
              //   trailing: Icon(
              //     Icons.logout,
              //     size: 20.0,
              //   ),
              // ),

              ListTile(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         fullscreenDialog: true,
                  //         builder: (BuildContext context) {
                  //           return SettingsPage();
                  //         }));
                },
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.125),
                trailing: Icon(
                  Icons.settings,
                  size: 20.0,
                ),
                leading: Text(
                  "Settings",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

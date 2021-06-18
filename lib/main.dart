import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/BLoC/cubit/favouriteitem_cubit.dart';
import 'package:signup/BLoC/cubit/fetch_favourite_items_cubit.dart';
import 'package:signup/BLoC/cubit/getuser_cubit.dart';
import 'package:signup/BLoC/cubit/item_cubit.dart';
import 'package:signup/BLoC/cubit/shopitem_cubit.dart';
import 'package:signup/BLoC/cubit/signup_cubit.dart';
import 'package:signup/UI/Pages/MyHomePage.dart';
import 'package:signup/UI/Pages/SignUpPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup/UI/Widgets/Indicator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(),
        ),
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),
        BlocProvider<ShopitemCubit>(
          create: (context) => ShopitemCubit(),
        ),
        BlocProvider<GetuserCubit>(
          create: (context) => GetuserCubit(),
        ),
        BlocProvider<FavouriteitemCubit>(
          create: (context) => FavouriteitemCubit(),
        ),
        BlocProvider<FetchFavouriteItemsCubit>(
          create: (context) => FetchFavouriteItemsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Coffe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Lato"),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Indicator();
            }
            if (snapshot.data == null) {
              return SignUpPage();
            } else {
              return MyHomePage();
            }
          },
        ),
      ),
    );
  }
}

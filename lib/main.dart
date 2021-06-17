import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/BLoC/cubit/item_cubit.dart';
import 'package:signup/BLoC/cubit/shopitem_cubit.dart';
import 'package:signup/BLoC/cubit/signupwithgoogle_cubit.dart';
import 'package:signup/UI/Pages/MyHomePage.dart';
import 'package:signup/UI/Pages/SignUpPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        BlocProvider<SignupwithgoogleCubit>(
          create: (context) => SignupwithgoogleCubit(),
        ),
        BlocProvider<ItemCubit>(
          create: (context) => ItemCubit(),
        ),
        BlocProvider<ShopitemCubit>(
          create: (context) => ShopitemCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Coffe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.red,
            fontFamily: "Lato"
            ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
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

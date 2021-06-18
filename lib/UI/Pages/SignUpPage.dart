import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup/BLoC/cubit/signup_cubit.dart';
import 'package:signup/UI/Widgets/Indicator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _name;
  late PageController _pageController;

  void initState() {
    super.initState();
    _pageController = PageController();
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _pageController.dispose();
    super.dispose();
  }

  DateTime? _birthDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _birthDate!,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != _birthDate)
      setState(() {
        _birthDate = picked;
        print(_birthDate!.day);
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      if (state is SignupwithgoogleLoading) {
        return Indicator();
      }
      if (state is SignupwithEmailPasswordLoading) {
        return Indicator();
      }
      return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32.0),
                      ),
                      SizedBox(
                        height: 56.0,
                      ),
                      TextFormField(
                        controller: _name,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(32),
                        ],
                        textAlign: TextAlign.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) => input!.validateName()
                            ? null
                            : "Please Check your name",
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) => value!.isEmpty
                        //     ? 'Enter Your Name'
                        //     : (RegExp('[a-zA-Z]').hasMatch(value)
                        //         ? null
                        //         : 'Enter a Valid Name'),
                        decoration: InputDecoration(
                            hintText: 'enter your name',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                            )),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextButton.icon(
                          icon: Icon(Icons.calendar_today),
                          label: Text(
                            "Select date of birth",
                            style: TextStyle(fontSize: 24.0),
                          ),
                          onPressed: () {
                            _selectDate();
                          }),
                      Text(
                        _birthDate!.day.toString() +
                            "/" +
                            _birthDate!.month.toString() +
                            "/" +
                            _birthDate!.year.toString(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      MaterialButton(
                        minWidth: 240.0,
                        padding: EdgeInsets.all(12.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        elevation: 4.0,
                        color: Colors.red,
                        onPressed: () {
                          if (_name.text.validateName() &&
                              _birthDate!.year != DateTime.now().year) {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          } else {
                            final snackBar = SnackBar(
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.white,
                              content: Text(
                                "name or Date of Birth is not Valid!!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.red,
                                    fontFamily: "Lato"),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          "assets/2.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ]))),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 32.0),
                    ),
                    SizedBox(
                      height: 56.0,
                    ),
                    TextFormField(
                      controller: _email,
                      textAlign: TextAlign.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) => input!.validateEmail()
                          ? "email is valid."
                          : "Please Check your email!!",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
                      decoration: InputDecoration(
                          hintText: 'enter email',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          )),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (input) => input!.validatePassword()
                          ? "Password is Strong."
                          : "Password is Week\nminimum password length should be 8.\nPassword should contain\nUPPER CASE[A-Z]\nLOWER CASE[a-z]\nNumbers[0-9]\nSpecial Character[# @ ! % & * ( ) ]",
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'enter password',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          )),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    // TextButton.icon(
                    //     icon: Icon(Icons.calendar_today),
                    //     label: Text("Select date of birth"),
                    //     onPressed: () {
                    //       _selectDate();
                    //     }),
                    // Text(_birthDate!.day.toString() +
                    //     "/" +
                    //     _birthDate!.month.toString() +
                    //     "/" +
                    //     _birthDate!.year.toString()),

                    SizedBox(
                      height: 32.0,
                    ),
                    MaterialButton(
                      minWidth: 240.0,
                      height: 40.0,
                      padding: EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      elevation: 4.0,
                      color: Colors.red,
                      onPressed: () {
                        if (_email.text.validateEmail() &&
                            _password.text.validatePassword()) {
                          String dob = _birthDate.toString();
                          int age = DateTime.now().year - _birthDate!.year;
                          BlocProvider.of<SignupCubit>(context)
                              .signUpWithEmailPassword(_email.text,
                                  _password.text, dob, age, _name.text);
                        } else {
                          final snackBar = SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.white,
                            content: Text(
                              "Please enter valid email and password!!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontFamily: "Lato"),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("i have acoount!"),
                    //     TextButton(
                    //       onPressed: () {
                    //         Navigator.pushReplacement(context,
                    //             MaterialPageRoute(builder: (BuildContext context) {
                    //           return SignInPage();
                    //         }));
                    //       },
                    //       child: Text("Sign In"),
                    //     )
                    //   ],
                    // ),
                    Text(
                      "Or",
                      style: TextStyle(fontSize: 32.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(240.0, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        side: BorderSide(width: 2, color: Colors.red),
                      ),
                      onPressed: () {
                        String dob = _birthDate.toString();
                        int age = DateTime.now().year - _birthDate!.year;
                        BlocProvider.of<SignupCubit>(context)
                            .signInWithGoogle(dob, age, _name.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Sign Up With Google',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

extension EmailValidator on String {
  bool validateEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool validatePassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

extension NameValidator on String {
  bool validateName() {
    return RegExp(r'^([a-z A-Z,.\-]).{2,}$').hasMatch(this);
  }
}

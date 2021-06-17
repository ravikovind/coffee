import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/UI/Pages/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
           Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40.0),),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(fontSize: 32.0),
                  ),
                  SizedBox(
                    height: 56.0,
                  ),
                  TextField(
                    controller: _email,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(32),
                    ],
                    textAlign: TextAlign.center,
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
                  TextField(
                    controller: _password,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'enter password',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        )),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  MaterialButton(
                    minWidth: 240.0,
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    elevation: 4.0,
                    color: Colors.red,
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("dont have acoount?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return SignUpPage();
                          }));
                        },
                        child: Text("Create Account"),
                      )
                    ],
                  ),
                  Text(
                    "Or",
                    style: TextStyle(fontSize: 32.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.grey),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Sign In With Google',
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
  }
}

import 'package:antre/pages/Navbar.dart';
import 'package:antre/pages/page5.dart';
import 'package:antre/theme.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import '../reusable_widget/reusable_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginPage(
                // onTap: () {},
                );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  // final Function()? onTap;
  // LoginPage({super.key, required this.onTap});
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController _emailTextController = TextEditingController();
  // TextEditingController _passwordTextController = TextEditingController();

  // void showmessage(String errorMessage) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(title: Text(errorMessage));
  //       });
  // }

  // void _signUserIn(BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Center(child: CircularProgressIndicator());
  //       });
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailTextController.text,
  //       password: _passwordTextController.text,
  //     );
  //     Navigator.pop(context);
  //     print('cok');
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     //wrong Email
  //     showmessage(e.code);
  //   }
  // }
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Masuk',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // color: blackColor,
              child: SizedBox(
                width: 310,
                height: 47,
                child: reusableTextField("Enter UserName", Icons.person_outline,
                    false, _emailTextController),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: SizedBox(
                width: 310,
                height: 47,
                child: reusableTextField("Enter Password", Icons.lock_outline,
                    true, _passwordTextController),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                      context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Page5()));
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                )),
            // firebaseUIButton(
            //   context, "Masuk",
            //   // () async {
            //   //   FirebaseAuth.instance
            //   //       .signInWithEmailAndPassword(
            //   //           email: _emailTextController.text,
            //   //           password: _passwordTextController.text)
            //   //       .then((value) {
            //   //     print(_passwordTextController.text);
            //   //     Navigator.pushReplacement(
            //   //         context, MaterialPageRoute(builder: (context) => Page5()));
            //   //     // print('masuk');
            //   //   }).onError((error, stackTrace) {
            //   //     print("Error ${error.toString()}");
            //   //   });
            //   // }
            //   // () => _signUserIn(context),
            //   () async {
            //     User? user = await loginUsingEmailPassword(
            //         email: _emailTextController.text,
            //         password: _passwordTextController.text,
            //         context: context);
            //     if (user != null) {
            //       Navigator.of(context).pushReplacement(
            //           MaterialPageRoute(builder: (context) => Page5()));
            //     }
            //   },
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 310,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => RegisterPage(),
                  //   ),
                  // );
                },
                child: Text(
                  'Daftar',
                  style: greenTextStyle,
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(whiteColor),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(blackColor)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

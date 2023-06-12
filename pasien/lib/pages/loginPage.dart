import 'package:antri/pages/Navbar.dart';
import 'package:antri/pages/homePage.dart';
import 'package:antri/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}


  static Future<User?> loginUsingEmailPassword(
    {required String Email,
    required String Password,
    required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
            print('No User')          
        }
      }
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
              child: SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  controller: _emailTextController,
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  // keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  controller: _passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 310,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: context)=>Navbar())
                  }
                },
                child: Text(
                  'Masuk',
                  style: whiteMediumTextStyle,
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(greenColor),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(whiteColor)),
              ),
            ),
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

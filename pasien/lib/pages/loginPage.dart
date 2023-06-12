import 'package:antri/pages/page5.dart';
import 'package:antri/theme.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../reusable_widget/reusable_widget.dart';
import 'package:antri/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                child:
                    // TextField(
                    //   controller: _emailTextController,
                    //   obscureText: false,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Color(0xffF6F6F6),
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Email',
                    //   ),
                    //   // keyboardType: TextInputType.number,
                    // ),
                    reusableTextField("Enter UserName", Icons.person_outline,
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
                child:
                    // TextField(
                    //   controller: _passwordTextController,
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Color(0xffF6F6F6),
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Password',
                    //   ),
                    // ),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            firebaseUIButton(context, "Masuk", () async {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                print(_passwordTextController.text);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Page5()));
                // print('masuk');
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
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

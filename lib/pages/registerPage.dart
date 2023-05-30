// import 'package:antriajaa/theme.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 31,
            ),
            Text(
              'Daftar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 31,
            ),
            PasswordTextFieldSample(),
            SizedBox(
              height: 15,
            ),
            PasswordTextFieldSample(),
            SizedBox(
              height: 15,
            ),
            PasswordTextFieldSample(),
          ],
        ),
      )),
    );
  }
}

class PasswordTextFieldSample extends StatelessWidget {
  const PasswordTextFieldSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 310,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.green, width: 0.0),
          // ),
          // border: OutlineInputBorder(),
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );
  }
}

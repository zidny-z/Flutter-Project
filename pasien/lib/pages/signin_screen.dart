import 'package:antre/pages/homepage.dart';
import 'package:antre/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:antre/widgets/input_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const SignInScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF308E78),
      //   centerTitle: true,
      //   title: const Text('Note Dairy Login'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 64, left: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.jpeg', // Ubah dengan path file gambar Anda
                ),
              ),
              const SizedBox(height: 96.0),
              Column(
                children: [
                  InputText(
                    hint: 'Email',
                    obscure: false,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16.0),
                  InputText(
                    line: 1,
                    hint: "Password",
                    obscure: true,
                    controller: _passwordController,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                width: 150.0, // Atur lebar sesuai kebutuhan
                height: 40.0, // Atur tinggi sesuai kebutuhan
                child: ElevatedButton(
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFF308E78), // Atur warna latar belakang tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur border radius tombol
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Belum punya akun? Daftar disini',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

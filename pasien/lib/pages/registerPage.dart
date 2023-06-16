import 'dart:io';
import 'package:antre/pages/signin_screen.dart';
import 'package:antre/pages/uploudGambar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:antre/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // File? _image;

  // Future getImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image == null) return;

  //   final imageTemporary = File(image.path);

  //   setState(() {
  //     this._image = imageTemporary;
  //   });

  //   return imageTemporary;
  // }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _displayNameController = TextEditingController();

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      User? user = userCredential.user;
      if (user != null) {
        // await _uploadPhoto(user.uid);
        // await user.updateDisplayName(_displayNameController.text);
        // await user.updatePhotoURL(await getImage());

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UploadImageScreen()),
        );
      }
    } catch (error) {
      print('Error signing up: $error');
    }
  }

  // const RegisterPage({Key? key}) : super(key: key);
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
              'Daftar',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  controller: _displayNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  controller: _passwordController,
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
              height: 10,
            ),
            // GestureDetector(
            //     child: Container(
            //       width: 310,
            //       height: 175,
            //       child:
            //       // _image != null
            //       //     ? Image.file(
            //       //         _image!,
            //       //         width: 310,
            //       //         height: 175,
            //       //         fit: BoxFit.cover,
            //       //       )
            //       //     :
            //           Image.asset('assets/images/uploud.png'),
            //       decoration: BoxDecoration(),
            //     ),
            //     onTap: () => getImage()),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              width: 310,
              height: 48,
              child: ElevatedButton(
                // onPressed: () async {
                //   try {
                //     final newuser = await _auth.createUserWithEmailAndPassword(
                //         email: _emailController.text,
                //         password: _passwordController.text);
                //     if (newuser != null) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => SignInScreen()),
                //       );
                //     }
                //   } catch (e) {}
                // },
                onPressed: _signUpWithEmailAndPassword,
                child: Text(
                  'Daftar',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
                child: Text(
                  'Masuk',
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

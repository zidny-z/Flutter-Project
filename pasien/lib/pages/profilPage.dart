import 'package:antre/pages/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:antre/theme.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final _user = FirebaseAuth.instance.currentUser?.email;
  final _userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 245,
              color: greenColor,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 59),
                  Text(
                    'Profil',
                    style: whiteSemiBoldTextStyle.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/face1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      border: Border.all(
                        color: whiteColor,
                        width: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    (_userName ?? _user!),
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
                  ),
                  Text(
                    _user ?? '',
                    style: blackRegulerTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  // SizedBox(
                  //   width: 300,
                  //   height: 45,
                  //   child: ElevatedButton(
                  //     child: Text(
                  //       'Edit Profil',
                  //       style: whiteSemiBoldTextStyle.copyWith(fontSize: 16),
                  //     ),
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: greenColor,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(100)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      child: Text(
                        'Logout',
                        style: whiteSemiBoldTextStyle.copyWith(fontSize: 16),
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

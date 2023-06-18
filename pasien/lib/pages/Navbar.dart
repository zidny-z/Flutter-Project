import 'package:antre/pages/homepage.dart';
import 'package:antre/pages/profilPage.dart';
import 'package:antre/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'myAntrian.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int pageIndex = 0;

  final pages = [
    HomePage(),
    MyAntrian(),
    // antreanPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.work_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 35,
                  )
                : const Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}

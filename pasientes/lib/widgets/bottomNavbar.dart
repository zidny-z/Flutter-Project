import 'package:flutter/material.dart';
import 'package:antriajaa/models/navbarM.dart';

class Bottomnavbaritem extends StatelessWidget {
  final Navbar navbar;
  Bottomnavbaritem(this.navbar);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          navbar.image,
          width: 32,
        ),
      ],
    );
  }
}

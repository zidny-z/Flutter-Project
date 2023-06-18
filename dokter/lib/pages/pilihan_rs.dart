import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';

class Detailberita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Detail Berita'),
        backgroundColor: greenColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Container(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';

class Detailberita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Detail Berita'),
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/detailberita1.png'),
          SizedBox(
            height: 29,
          ),
          Text(
            'Judul Berita',
          ),
        ],
      ),
    );
  }
}

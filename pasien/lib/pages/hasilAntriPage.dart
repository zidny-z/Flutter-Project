import 'package:antre/widgets/hasilantriCard.dart';
import 'package:flutter/material.dart';
import 'package:antre/theme.dart';

class HasilantrePage extends StatelessWidget {
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                HasilantreCard(),
                SizedBox(
                  height: 15,
                ),
                HasilantreCard(),
                SizedBox(
                  height: 15,
                ),
                HasilantreCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

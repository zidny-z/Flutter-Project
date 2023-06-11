import 'package:antriajaa/widgets/hasilAntriCard.dart';
import 'package:flutter/material.dart';
import 'package:antriajaa/theme.dart';

class HasilAntriPage extends StatelessWidget {
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
                HasilAntriCard(),
                SizedBox(
                  height: 15,
                ),
                HasilAntriCard(),
                SizedBox(
                  height: 15,
                ),
                HasilAntriCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

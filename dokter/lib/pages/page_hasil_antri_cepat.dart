import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/widgets/hasil_antri_cards.dart';

class page_hasil_antri_cepat extends StatelessWidget {
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
                hasil_antri_cards(),
                SizedBox(
                  height: 15,
                ),
                hasil_antri_cards(),
                SizedBox(
                  height: 15,
                ),
                hasil_antri_cards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

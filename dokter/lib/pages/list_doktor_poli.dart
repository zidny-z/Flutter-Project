import 'package:flutter/material.dart';
import 'package:pbmdoctor/pages/homepage_doctor.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/widgets/doktor_poli_cards.dart';

class List_doktor_poli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(children: [
                SizedBox(height: 30),
                Container(
                  width: 325,
                  height: 160,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    image: DecorationImage(
                      image: AssetImage('assets/images/face1.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Text(
                  'Daftar Dokter',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Dokter_poli_cards(),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    child: Text(
                      'Daftar',
                      style: whiteSemiBoldTextStyle.copyWith(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => homepagedoctor(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkGreenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                )
              ]),
              // child:
            ),
          ],
        ),
      ),
    );
  }
}

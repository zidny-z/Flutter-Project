import 'package:flutter/material.dart';
import 'package:antriajaa/theme.dart';

class DokterPoliCard extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Column(
        children: [
          Container(
            width: 325,
            height: 80,
            color: greenColor,
            child: Row(children: [
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FOTO DOKTER
                  Image.asset(
                    'assets/images/face1.png',
                    width: 58,
                    height: 58,
                  )
                ],
              ),
              SizedBox(
                width: 19,
              ),
              // NAMA DOKTER
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dr.fulana',
                    style: whiteRegularTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

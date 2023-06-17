import 'package:antre/models/rsM.dart';
import 'package:antre/theme.dart';
import 'package:antre/widgets/rsCard.dart';
import 'package:flutter/material.dart';

class RsDekat extends StatelessWidget {
  const RsDekat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Rumah Sakit Terdekat'),
          backgroundColor: greenColor,
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Container(
                child: ListView(children: [
                  RsCard(RumahSakit(
                      id: 1,
                      name: 'RS M Khadafi',
                      image: 'assets/images/rumahsakit.png',
                      alamat: 'Jln. Mulu Jadian Kagak')),
                  RsCard(RumahSakit(
                      id: 1,
                      name: 'RS M Khadafi',
                      image: 'assets/images/rumahsakit.png',
                      alamat: 'Jln. Mulu Jadian Kagak')),
                  RsCard(RumahSakit(
                      id: 1,
                      name: 'RS M Khadafi',
                      image: 'assets/images/rumahsakit.png',
                      alamat: 'Jln. Mulu Jadian Kagak')),
                  RsCard(RumahSakit(
                      id: 1,
                      name: 'RS M Khadafi',
                      image: 'assets/images/rumahsakit.png',
                      alamat: 'Jln. Mulu Jadian Kagak')),
                ]),
              ),
            )));
  }
}

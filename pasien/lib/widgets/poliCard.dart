import 'package:antri/pages/dokterPoliPage.dart';
import 'package:antri/theme.dart';
import 'package:flutter/material.dart';
import 'package:antri/models/poliM.dart';

class PoliCard extends StatelessWidget {
  final Poli poli;

  PoliCard(this.poli);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DokterPoliPage(),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              poli.name,
              style: whiteSemiBoldTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(greenColor),
            foregroundColor: MaterialStatePropertyAll<Color>(whiteColor)),
      ),
    );
  }
}

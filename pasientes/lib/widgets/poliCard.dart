import 'package:antriajaa/theme.dart';
import 'package:flutter/material.dart';
import 'package:antriajaa/models/poliM.dart';

class PoliCard extends StatelessWidget {
  final Poli poli;

  PoliCard(this.poli);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greenColor, borderRadius: BorderRadius.circular(10)),
      height: 100,
      width: 150,
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
    );
  }
}

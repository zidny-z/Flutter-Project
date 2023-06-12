import 'package:antri/widgets/antrianCard.dart';
import 'package:flutter/material.dart';
import 'package:antri/theme.dart';

class AntrianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 68,
            ),
            Text(
              'Antrian Pasien',
              style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Menunggu',
                    style: blackRegulerTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AntrianCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

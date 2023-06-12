import 'package:flutter/material.dart';
import 'package:antri/models/acaraM.dart';
import 'package:antri/theme.dart';

class AcaraCard extends StatelessWidget {
  final Acara acara;

  AcaraCard(this.acara);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 135,
        width: 175,
        color: greyEBcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset(
                acara.image,
                height: 75,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    acara.tanggal,
                    style: blackRegulerTextStyle.copyWith(
                      fontSize: 7,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    acara.judul,
                    style: blackSemiBoldTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

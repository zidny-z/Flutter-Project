import 'package:flutter/material.dart';
import 'package:pbmdoctor/models/berita.dart';
import 'package:pbmdoctor/theme.dart';

class beritacards extends StatelessWidget {
  final Berita berita;

  beritacards(this.berita);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 135,
        width: 175,
        color: grayscale,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset(
                berita.image,
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
                    berita.tanggal,
                    style: greyTextStyle.copyWith(
                      fontSize: 7,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    berita.judul,
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

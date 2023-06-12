import 'package:flutter/material.dart';
import 'package:pbmdoctor/models/acara.dart';
import 'package:pbmdoctor/theme.dart';

class acaracards extends StatelessWidget {
  final Acara acara;
  acaracards(this.acara);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // crossAxisAlignment: CrossAxisAlignment.start,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 345,
            color: grayscale,
            child: Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Image.asset(
                  acara.image,
                  width: 80,
                  height: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      acara.Judul,
                      style: blackSemiBoldTextStyle.copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      acara.rumahsakit,
                      style: greyTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

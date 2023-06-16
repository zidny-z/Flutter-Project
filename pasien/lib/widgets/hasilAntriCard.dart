import 'package:antre/pages/antrianPage.dart';
import 'package:flutter/material.dart';
import 'package:antre/theme.dart';

class HasilantreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 360,
        height: 75,
        color: greenColor,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nama Poli',
                  style: whiteSemiBoldTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  'Rs. Makan Makmur',
                  style: whiteRegularTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 50,
                  child: ElevatedButton(
                    child: Text(
                      'Pesan',
                      style: whiteSemiBoldTextStyle.copyWith(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => antreanPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkGreenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

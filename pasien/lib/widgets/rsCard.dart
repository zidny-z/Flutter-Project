import 'package:antre/models/rsM.dart';
import 'package:antre/pages/poliPage.dart';
import 'package:flutter/material.dart';
import 'package:antre/theme.dart';

class RsCard extends StatelessWidget {
  final RumahSakit rs;

  RsCard(this.rs);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 325,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                rs.image,
                height: 92,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(rs.name,
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(rs.alamat,
                        style: blackRegulerTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoliPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Cek Poli',
                    style: whiteSemiBoldTextStyle,
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(greenColor),
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(whiteColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

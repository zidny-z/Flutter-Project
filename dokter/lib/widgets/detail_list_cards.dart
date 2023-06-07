import 'package:flutter/material.dart';
import 'package:pbmdoctor/models/detail_list_pasien.dart';
import 'package:pbmdoctor/theme.dart';

class detailistcards extends StatelessWidget {
  final Detail_list_pasien detail_list_pasien;
  detailistcards(this.detail_list_pasien);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Column(
        children: [
          Container(
            width: 325,
            height: 250,
            color: greenColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      detail_list_pasien.image,
                      width: 70,
                      height: 67,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail_list_pasien.nama,
                          style: whiteSemiBoldTextStyle.copyWith(fontSize: 25),
                        ),
                        Text(
                          detail_list_pasien.nomorbpjs,
                          style: whiteRegularTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          detail_list_pasien.poli,
                          style: whiteRegularTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          detail_list_pasien.waktu,
                          style: whiteRegularTextStyle.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(darkGreenColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Terima',
                          style: whiteSemiBoldTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(redColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Tolak',
                          style: whiteSemiBoldTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

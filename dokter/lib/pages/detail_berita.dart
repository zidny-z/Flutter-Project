import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';

class Detailberita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Detail Berita'),
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                left: 22,
                right: 22,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 29,
                    ),
                    Center(
                      child: Container(
                        width: 360,
                        height: 181,
                        // color: greenColor,
                        decoration: BoxDecoration(
                            // color: greenColor,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/detailberita1.png'))),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Text(
                      'Vaksin Menjadi Syarat Wajib untuk Mudik',
                      style: blackSemiBoldTextStyle.copyWith(fontSize: 25),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Rumah Sakit Umum Jember',
                      style: blackRegulerTextStyle.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Pemerintah Indonesia telah mengeluarkan himbauan kepada masyarakat untuk tidak melakukan mudik pada momen Lebaran tahun ini, mengingat situasi pandemi Covid-19 yang masih berlangsung. Namun, jika seseorang memutuskan untuk melakukan mudik, maka sebaiknya ia memperhatikan protokol kesehatan yang telah ditetapkan oleh pemerintah,',
                      textAlign: TextAlign.justify,
                      style: greyTextStyle.copyWith(fontSize: 13),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

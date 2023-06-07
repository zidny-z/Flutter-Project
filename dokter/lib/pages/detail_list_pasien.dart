import 'package:flutter/material.dart';
import 'package:pbmdoctor/models/detail_list_pasien.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/widgets/detail_list_cards.dart';
import 'homepage_doctor.dart';
import 'absen_doctor.dart';
import 'package:pbmdoctor/models/navbar.dart';
import 'package:pbmdoctor/widgets/bottom_navbar_item.dart';
import 'page_list_pasien.dart';

class detaillistpasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Detail Antrian',
                style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 46,
              ),
              detailistcards(
                Detail_list_pasien(
                  id: 2,
                  image: 'assets/images/images2.png',
                  nama: '27 maret 2023',
                  nomorbpjs: 'Masker itu Wajib',
                  poli: 'gigi',
                  waktu: 'sore',
                ),
              ),
            ],
          ),
        ),
      ),
      //AWAL MENU BOTTON
      floatingActionButton: Container(
        height: 81,
        width: 400,
        decoration: BoxDecoration(
          color: WhiterColor,
          border: Border(
            top: BorderSide(
              color: greyColor,
              width: 3,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homepagedoctor(),
                      ),
                    );
                  },
                  child: Bottomnavbaritem(
                    Navbar(id: 1, image: 'assets/icons/home_unactive.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pagelistpasien(),
                      ),
                    );
                  },
                  child: Bottomnavbaritem(
                    Navbar(id: 2, image: 'assets/icons/list_active.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Absendoctor(),
                      ),
                    );
                  },
                  child: Bottomnavbaritem(
                    Navbar(id: 3, image: 'assets/icons/calender_unactive.png'),
                  ),
                ),
                Bottomnavbaritem(
                  Navbar(id: 4, image: 'assets/icons/user_unactive.png'),
                ),
              ],
            ),
//ini
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

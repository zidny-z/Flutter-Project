import 'package:flutter/material.dart';
import 'package:pbmdoctor/pages/page_list_pasien.dart';
import 'package:pbmdoctor/pages/page_profil.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/models/navbar.dart';
import 'package:pbmdoctor/widgets/bottom_navbar_item.dart';
import 'homepage_doctor.dart';

class Absendoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 89,
            ),
            Text(
              'Absensi Harian',
              style: whiteSemiBoldTextStyle.copyWith(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 275,
              width: 275,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '26',
                    style: greenSemiBoldTextStyle.copyWith(fontSize: 125),
                  ),
                  Text(
                    'Jumlah Kehadiran',
                    style: greenRegularTextStyle.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Tanggal Hari Ini:',
              style: whiteSemiBoldTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '27 Januari 2023',
              style: whiteRegularTextStyle.copyWith(fontSize: 25),
            ),
            SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'hadir',
                  style: greenSemiBoldTextStyle.copyWith(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
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
                    Navbar(id: 2, image: 'assets/icons/list_unactive.png'),
                  ),
                ),
                Bottomnavbaritem(
                  Navbar(id: 3, image: 'assets/icons/calender_active.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pages_profil(),
                      ),
                    );
                  },
                  child: Bottomnavbaritem(
                    Navbar(id: 4, image: 'assets/icons/user_unactive.png'),
                  ),
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

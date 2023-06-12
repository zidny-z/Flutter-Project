import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/widgets/pasien_list_cards.dart';
import 'package:pbmdoctor/models/navbar.dart';
import 'homepage_doctor.dart';
import 'absen_doctor.dart';
import 'package:pbmdoctor/widgets/bottom_navbar_item.dart';

class pagelistpasien extends StatelessWidget {
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
                  pasienlistcard(),
                ],
              ),
            )
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

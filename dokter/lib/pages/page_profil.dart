import 'package:flutter/material.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/models/navbar.dart';
import 'package:pbmdoctor/widgets/bottom_navbar_item.dart';
import 'homepage_doctor.dart';
import 'page_list_pasien.dart';

class pages_profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: 400,
              height: 245,
              color: greenColor,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 59),
                  Text(
                    'Profil',
                    style: whiteSemiBoldTextStyle.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/face1.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      border: Border.all(
                        color: whiteColor,
                        width: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Nur Fitri',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
                  ),
                  Text(
                    '1925514189',
                    style: blackRegulerTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      child: Text(
                        'Edit Profil',
                        style: whiteSemiBoldTextStyle.copyWith(fontSize: 16),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      child: Text(
                        'Logout',
                        style: whiteSemiBoldTextStyle.copyWith(fontSize: 16),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 81,
        width: 357,
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
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Row(
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
                      Navbar(id: 1, image: 'assets/icons/home_active.png'),
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
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

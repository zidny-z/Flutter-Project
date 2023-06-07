import 'package:antriajaa/widgets/beritaCard.dart';
import 'package:antriajaa/models/beritaM.dart';
import 'package:antriajaa/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Container(
              width: 450,
              height: size.height * 0.36,
              color: greenColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hallo!',
                        style: whiteSemiBoldTextStyle.copyWith(
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'nur fitri',
                        style: whiteRegularTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      // btn 2 hero
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: darkGreenColor,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Image.asset(
                                      'assets/images/hospital.png',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 90,
                                    child: Center(
                                      child: Text(
                                        "Rumah Sakit Terdekat",
                                        style: whiteMediumTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: darkGreenColor,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Image.asset(
                                      'assets/images/antriancepat.png',
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 90,
                                    child: Center(
                                      child: Text(
                                        "Program Antrian Cepat",
                                        style: whiteMediumTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // awal dari fitur berita
            Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Berita',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              height: 135,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  BeritaCard(
                    Berita(
                      id: 1,
                      image: 'assets/images/images1.png',
                      tanggal: '27 maret 2023',
                      judul: 'Kewajiban Vaksin Untuk Mudik ',
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BeritaCard(
                    Berita(
                      id: 2,
                      image: 'assets/images/images2.png',
                      tanggal: '27 maret 2023',
                      judul: 'Masker itu Wajib',
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  BeritaCard(
                    Berita(
                      id: 3,
                      image: 'assets/images/images3.png',
                      tanggal: '27 maret 2023',
                      judul: 'Masker itu Wajib',
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                ],
              ),
            ),
            //awal fitur acara
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Acara',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            // SizedBox(
            //   height: 11,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Column(
            //     children: [
            //       acaracards(
            //         Acara(
            //           id: 1,
            //           image: 'assets/images/acara1.png',
            //           Judul: 'Vaksin Booster Massal',
            //           rumahsakit: 'Mitra Sehat',
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       acaracards(
            //         Acara(
            //           id: 2,
            //           image: 'assets/images/acara2.png',
            //           Judul: 'ayo vaksin',
            //           rumahsakit: 'pondok indah',
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       acaracards(
            //         Acara(
            //             id: 1,
            //             image: 'assets/images/acara1.png',
            //             Judul: 'Vaksin booster massal',
            //             rumahsakit: 'Jember Medika'),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 81,
            ),
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   height: 81,
      //   width: 357,
      //   decoration: BoxDecoration(
      //     color: whiteColor,
      //     border: Border(
      //       top: BorderSide(
      //         color: greyColor,
      //         width: 3,
      //       ),
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 15.5,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(
      //           left: 30,
      //           right: 30,
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: [
      //             InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => HomePage(),
      //                   ),
      //                 );
      //               },
      //               child: Bottomnavbaritem(
      //                 Navbar(id: 1, image: 'assets/icons/home_active.png'),
      //               ),
      //             ),
      //             InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => pagelistpasien(),
      //                   ),
      //                 );
      //               },
      //               child: Bottomnavbaritem(
      //                 Navbar(id: 2, image: 'assets/icons/list_unactive.png'),
      //               ),
      //             ),
      //             InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => Absendoctor(),
      //                   ),
      //                 );
      //               },
      //               child: Bottomnavbaritem(
      //                 Navbar(
      //                     id: 3, image: 'assets/icons/calender_unactive.png'),
      //               ),
      //             ),
      //             Bottomnavbaritem(
      //               Navbar(id: 4, image: 'assets/icons/user_unactive.png'),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

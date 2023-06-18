import 'package:antre/pages/acaralagi.dart';
import 'package:antre/pages/antriCepatPage.dart';
import 'package:antre/pages/beritalagi.dart';
import 'package:antre/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'nearlagi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _user = FirebaseAuth.instance.currentUser?.email;
  final _userName = FirebaseAuth.instance.currentUser?.displayName;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getLatestNews() {
    return FirebaseFirestore.instance
        .collection('news')
        // .limit(1)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      } else {
        throw Exception('No news found');
      }
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getLatestEvent() {
    return FirebaseFirestore.instance
        .collection('event')
        // .limit(1)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first;
      } else {
        throw Exception('No event found');
      }
    });
  }

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
                        (_userName ?? _user!),
                        style: whiteRegularTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      // btn 2 hero
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RumahSakitPage()
                                      // builder: (context) => RsDekat()
                                      ));
                            },
                            child: Container(
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
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // builder: (context) => RumahSakitPage()
                                      builder: (context) => AntreCepat()));
                            },
                            child: Container(
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
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: getLatestNews(), // Ganti dengan stream Anda
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (!snapshot.hasData) {
                        return Text('No data available');
                      }

                      final documentData =
                          snapshot.data!.data() as Map<String, dynamic>?;

                      if (documentData == null) {
                        return Text('No data available');
                      }

                      final yourFieldValue = documentData['title'] as String?;

                      if (yourFieldValue == null) {
                        return Text('Your field is empty');
                      }
                      return Container(
                        child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 150,
                              width: 250,
                              color: greyEBcolor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Image.network(
                                        documentData['image'],
                                        // height: 75,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          documentData['date'],
                                          style: blackRegulerTextStyle.copyWith(
                                            fontSize: 7,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          documentData['title'],
                                          style:
                                              blackSemiBoldTextStyle.copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'detailBeritaOne',
                                arguments: getLatestNews());
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BeritaLagi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: greenColor,
                        minimumSize: Size(120, 75),
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        'Berita\nLain',
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            // AWAL ACARA
            SizedBox(
              height: 30,
            ),
            // awal dari fitur berita
            Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Acara',
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
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: getLatestEvent(), // Ganti dengan stream Anda
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (!snapshot.hasData) {
                        return Text('No data available');
                      }

                      final documentData =
                          snapshot.data!.data() as Map<String, dynamic>?;

                      if (documentData == null) {
                        return Text('No data available');
                      }

                      final yourFieldValue = documentData['title'] as String?;

                      if (yourFieldValue == null) {
                        return Text('Your field is empty');
                      }
                      return Container(
                        child: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 150,
                              width: 250,
                              color: greyEBcolor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Image.network(
                                        documentData['img'],
                                        // height: 75,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          documentData['date & place'],
                                          style: blackRegulerTextStyle.copyWith(
                                            fontSize: 7,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          documentData['title'],
                                          style:
                                              blackSemiBoldTextStyle.copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'detailAcaraOne',
                                arguments: getLatestEvent());
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AcaraLagi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: greenColor,
                        minimumSize: Size(120, 75),
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        'Acara\nLain',
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 81,
            ),
          ],
        ),
      ),
    );
  }
}

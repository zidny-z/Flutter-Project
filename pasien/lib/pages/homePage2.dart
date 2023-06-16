// import 'package:antre/models/acaraM.dart';
// import 'package:antre/pages/antriCepatPage.dart';
// import 'package:antre/pages/rsDekatPage.dart';
// import 'package:antre/widgets/acaraCard.dart';
// import 'package:antre/widgets/beritaCard.dart';
// import 'package:antre/models/beritaM.dart';
// import 'package:antre/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   // static const routename = "/homepage";

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // final CollectionReference _news =
//   //     FirebaseFirestore.instance.collection('news');

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: ListView(
//           children: [
//             Container(
//               width: 450,
//               height: size.height * 0.36,
//               color: greenColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         'Hallo!',
//                         style: whiteSemiBoldTextStyle.copyWith(
//                           fontSize: 50,
//                         ),
//                       ),
//                       Text(
//                         'nur fitri',
//                         style: whiteRegularTextStyle.copyWith(
//                           fontSize: 20,
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       // btn 2 hero
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => RsDekat()));
//                             },
//                             child: Container(
//                               height: 100,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: darkGreenColor,
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 0),
//                                       child: Image.asset(
//                                         'assets/images/hospital.png',
//                                         height: 45,
//                                         width: 45,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       width: 90,
//                                       child: Center(
//                                         child: Text(
//                                           "Rumah Sakit Terdekat",
//                                           style: whiteMediumTextStyle.copyWith(
//                                             fontSize: 12,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => antreCepat()));
//                             },
//                             child: Container(
//                               height: 100,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: darkGreenColor,
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 0),
//                                       child: Image.asset(
//                                         'assets/images/antreancepat.png',
//                                         height: 45,
//                                         width: 45,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Container(
//                                       width: 90,
//                                       child: Center(
//                                         child: Text(
//                                           "Program antrean Cepat",
//                                           style: whiteMediumTextStyle.copyWith(
//                                             fontSize: 12,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ]),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             // awal dari fitur berita
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//               ),
//               child: Text(
//                 'Berita',
//                 style: blackSemiBoldTextStyle.copyWith(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 11,
//             ),
//             Container(
//               height: 135,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(
//                     width: 12,
//                   ),
//                   BeritaCard(
//                     Berita(
//                       id: 1,
//                       image: 'assets/images/images1.png',
//                       tanggal: '27 Maret 2023',
//                       judul: 'Kewajiban Vaksin Untuk Mudik ',
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                   BeritaCard(
//                     Berita(
//                       id: 2,
//                       image: 'assets/images/images2.png',
//                       tanggal: '27 maret 2023',
//                       judul: 'Masker itu Wajib',
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                   BeritaCard(
//                     Berita(
//                       id: 3,
//                       image: 'assets/images/images3.png',
//                       tanggal: '27 maret 2023',
//                       judul: 'Masker itu Wajib',
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                 ],
//               ),
//             ),

//             //awal fitur acara
//             SizedBox(
//               height: 25,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 'Acara',
//                 style: blackSemiBoldTextStyle.copyWith(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 11,
//             ),
//             Container(
//               height: 135,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(
//                     width: 12,
//                   ),
//                   AcaraCard(
//                     Acara(
//                       id: 1,
//                       image: 'assets/images/acara1.png',
//                       tanggal: '27 Maret 2023',
//                       judul: 'Vaksinasi Booster Gratis',
//                       rumahsakit: "RS Medika Sukamoto",
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                   AcaraCard(
//                     Acara(
//                       id: 2,
//                       image: 'assets/images/acara2.png',
//                       tanggal: '27 maret 2023',
//                       judul: 'Swabtest Sebelum Mudik',
//                       rumahsakit: "RS Medika Mekdi",
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                   AcaraCard(
//                     Acara(
//                       id: 3,
//                       image: 'assets/images/images3.png',
//                       tanggal: '27 maret 2023',
//                       judul: 'Masker itu Wajib',
//                       rumahsakit: "RS Cristoper Sukamoto",
//                     ),
//                   ),
//                   SizedBox(
//                     width: 14,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 81,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

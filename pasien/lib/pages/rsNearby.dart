// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';

// class RumahSakit {
//   final String name;
//   final GeoPoint location;
//   final String keterangan;

//   RumahSakit({
//     required this.name,
//     required this.location,
//     required this.keterangan,
//   });
// }

// class RumahSakitPage extends StatefulWidget {
//   @override
//   _RumahSakitPageState createState() => _RumahSakitPageState();
// }

// class _RumahSakitPageState extends State<RumahSakitPage> {
//   late Stream<QuerySnapshot> rumahSakitStream;
//   Position? currentLocation;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//     rumahSakitStream = FirebaseFirestore.instance.collection('rs').snapshots();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       final position = await getCurrentLocation();
//       setState(() {
//         currentLocation = position;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<Position> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw 'Layanan lokasi tidak diaktifkan.';
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw 'Izin lokasi tidak diberikan.';
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw 'Izin lokasi permanen ditolak. Buka pengaturan lokasi untuk mengaktifkan.';
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   double calculateDistance(
//       double startLat, double startLng, double endLat, double endLng) {
//     final distance =
//         Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
//     return distance;
//   }

//   List<RumahSakit> _parseRumahSakitSnapshot(QuerySnapshot snapshot) {
//     final List<RumahSakit> rumahSakitList = [];

//     if (currentLocation != null) {
//       final userLat = currentLocation!.latitude;
//       final userLng = currentLocation!.longitude;

//       snapshot.docs.forEach((DocumentSnapshot doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         final name = data['name'] as String;
//         final location = data['map'] as GeoPoint;
//         final keterangan = data['alamat'] as String;

//         final rumahSakit = RumahSakit(
//           name: name,
//           location: location,
//           keterangan: keterangan,
//         );

//         final distance = calculateDistance(
//           userLat,
//           userLng,
//           rumahSakit.location.latitude,
//           rumahSakit.location.longitude,
//         );

//         // Menambahkan rumah sakit yang berjarak maksimal 5 kilometer (misalnya)
//         if (distance <= 50000) {
//           rumahSakitList.add(rumahSakit);
//         }
//       });
//     }

//     return rumahSakitList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Rumah Sakit'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: rumahSakitStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final rumahSakitList = _parseRumahSakitSnapshot(snapshot.data!);
//             return ListView.builder(
//               itemCount: rumahSakitList.length,
//               itemBuilder: (context, index) {
//                 final rumahSakit = rumahSakitList[index];
//                 return ListTile(
//                   title: Text(rumahSakit.name),
//                   subtitle: Text(rumahSakit.keterangan),
//                   trailing: Text(
//                       'Lat: ${rumahSakit.location.latitude}, Lng: ${rumahSakit.location.longitude}'),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

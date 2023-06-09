import 'package:flutter/material.dart';
import 'package:antre/pages/detailRumahSakit.dart';
import 'package:antre/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RumahSakitPage extends StatefulWidget {
  @override
  _RumahSakitPageState createState() => _RumahSakitPageState();
}

class _RumahSakitPageState extends State<RumahSakitPage> {
  Position? _currentPosition;
  late double _latitude;
  late double _longitude;
  double searchRadius = 5000; // Jarak pencarian awal: 5 km

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _latitude = position.latitude;
      _longitude = position.longitude;
    });
  }

  void updateSearchRadius(double radius) {
    setState(() {
      searchRadius = radius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Rumah Sakit Terdekat'),
        backgroundColor: greenColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // stream: FirebaseFirestore.instance.collection('rs').snapshots(),
        stream: FirebaseFirestore.instance.collection('RS').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              _currentPosition == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Text('Tidak ada data rumah sakit.');
          }

          final List<DocumentSnapshot> filteredList =
              snapshot.data!.docs.where((document) {
            final GeoPoint location = document['map'] as GeoPoint;
            final double distance = Geolocator.distanceBetween(
              _latitude,
              _longitude,
              location.latitude,
              location.longitude,
            );

            return distance <= searchRadius;
          }).toList();

          return Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Jarak Pencarian: ${(searchRadius / 1000).toStringAsFixed(1)} km',
                style: blackSemiBoldTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () =>
                        updateSearchRadius(5000), // Mengubah jarak menjadi 5 km
                    child: Text('5 km'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => updateSearchRadius(
                        100000), // Mengubah jarak menjadi 100 km
                    child: Text('100 km'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = filteredList[index];
                    final nama = document['name'] as String?;
                    final alamat = document['alamat'] as String?;
                    final geopoint = document['map'] as GeoPoint?;

                    final latLng =
                        LatLng(geopoint!.latitude, geopoint.longitude);

                    return ListTile(
                      title: Text(
                        nama ?? '',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 18),
                      ),
                      subtitle: Text(
                        alamat ?? '',
                        style: darkenGreyTextStyle,
                      ),
                      shape: Border(bottom: BorderSide(color: greyEBcolor)),
                      trailing: IconButton(
                        icon: const Icon(Icons.location_on),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MapScreen(latLng: latLng, nama: nama),
                            ),
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRumahSakitPage(
                              rumahSakitId: document.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  final LatLng latLng;
  final String? nama;

  const MapScreen({required this.latLng, this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama ?? ''),
        backgroundColor: greenColor,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 14.0,
        ),
        markers: Set<Marker>.from([
          Marker(
            markerId: MarkerId('rumahsakit'),
            position: latLng,
          ),
        ]),
      ),
    );
  }
}

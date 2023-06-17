import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NearbyLocationsScreen extends StatefulWidget {
  @override
  _NearbyLocationsScreenState createState() => _NearbyLocationsScreenState();
}

class _NearbyLocationsScreenState extends State<NearbyLocationsScreen> {
  // Define a GoogleMapController to interact with the map.
  late GoogleMapController _mapController;

  // Define a set of markers to display on the map.
  Set<Marker> _markers = Set();

  // Define a list of nearby locations.
  List<Location> _nearbyLocations = [];

  // Define the initial camera position.
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-8.165499, 113.717403),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    // Call a function to fetch nearby locations and display them as markers.
    fetchNearbyLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Rs Terdekat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _nearbyLocations.length,
              itemBuilder: (context, index) {
                Location location = _nearbyLocations[index];
                return ListTile(
                  title: Text(location.name),
                  subtitle: Text(location.address),
                  onTap: () {
                    // Update the map camera position when a list item is tapped.
                    _mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                            location.latitude,
                            location.longitude,
                          ),
                          zoom: 17.0,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 475, // Adjust the height of the map container as needed.
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: _markers,
              initialCameraPosition: _initialCameraPosition,
            ),
          ),
        ],
      ),
    );
  }

  // Function to fetch nearby locations and display them as markers.
  void fetchNearbyLocations() {
    Future<void> fetchNearbyLocations() async {
      String apiKey = 'AIzaSyB0CAHUE2RIkn2jXXkTj3kphdKFNzGZwHY';
      double latitude = -8.165499;
      double longitude = 113.717403;
      int radius = 300;
      String type = 'hospital';
      String url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&type=$type&key=$apiKey';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var results = data['results'];

        setState(() {
          _markers.clear();
          _nearbyLocations.clear();

          for (var result in results) {
            var geometry = result['geometry'];
            var location = geometry['location'];
            var lat = location['lat'];
            var lng = location['lng'];
            var name = result['name'];
            var address = result['vicinity'];

            _markers.add(
              Marker(
                markerId: MarkerId(result['place_id']),
                position: LatLng(lat, lng),
                infoWindow: InfoWindow(title: name),
              ),
            );
            _nearbyLocations.add(
              Location(
                name: name,
                address: address,
                latitude: lat,
                longitude: lng,
              ),
            );
          }
        });
      }
    }

    // You can implement your logic here to fetch nearby locations from Google Places API or any other source.
    // For demonstration purposes, let's add some sample locations.

    // Create a list of sample locations.
    List<Location> locations = [
      Location(
        name: 'Rs Soebandi',
        address: 'Kec. Patrang, Kabupaten Jember, Jawa Timur',
        latitude: -8.150952228135743,
        longitude: 113.71063557940754,
      ),
      Location(
        name: 'Jember Klinik',
        address:
            'Jl. Bedadung No.2, Kp. Using, Jemberlor, Kec. Patrang, Kabupaten Jember, Jawa Timur 68118',
        latitude: -8.167640161398221,
        longitude: 113.70560748876213,
      ),
      Location(
        name: 'UMC Unej',
        address:
            'Jl. Kalimantan, Krajan Timur, Sumbersari, Kec. Sumbersari, Kabupaten Jember, Jawa Timur 68121',
        latitude: -8.16210046063271,
        longitude: 113.71413626531199,
      ),
    ];

    // Clear the existing markers and nearby locations list.
    _markers.clear();
    _nearbyLocations.clear();

    // Add a marker for each location.
    for (Location location in locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: LatLng(location.latitude, location.longitude),
        ),
      );
      _nearbyLocations.add(location);
    }

    // Update the map and list to display the markers and locations.
    setState(() {});
  }
}

// Define a custom Location class to represent a nearby location.
class Location {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Location({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

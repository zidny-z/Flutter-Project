import 'dart:convert';

import 'package:pbmdoctor/models/rsM.dart';
import 'package:pbmdoctor/theme.dart';
import 'package:pbmdoctor/widgets/rsCard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbmdoctor/models/nearby_response.dart';

class RsDekat extends StatefulWidget {
  const RsDekat({Key? key}) : super(key: key);

  @override
  State<RsDekat> createState() => _RsDekatState();
}

class _RsDekatState extends State<RsDekat> {
  String apikey = "";
  String radius = "";

  double latitude = 31.5111093;
  double longtitude = 74.2796664;

  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Rumah Sakit Terdekat'),
          backgroundColor: greenColor,
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Container(
            child: ListView(children: [
              // RsCard(RumahSakit(
              //     // id: 1,
              //     name: 'RS M Khadafi',
              //     image: 'assets/images/rumahsakit.png',
              //     alamat: 'Jln. Mulu Jadian Kagak')),
              // RsCard(RumahSakit(
              //     // id: 1,
              //     name: 'RS M Khadafi',
              //     image: 'assets/images/rumahsakit.png',
              //     alamat: 'Jln. Mulu Jadian Kagak')),
              // RsCard(RumahSakit(
              //     // id: 1,
              //     name: 'RS M Khadafi',
              //     image: 'assets/images/rumahsakit.png',
              //     alamat: 'Jln. Mulu Jadian Kagak')),
              // RsCard(RumahSakit(
              //     // id: 1,
              //     name: 'RS M Khadafi',
              //     image: 'assets/images/rumahsakit.png',
              //     alamat: 'Jln. Mulu Jadian Kagak')),
              ElevatedButton(
                  onPressed: () {
                    getNearbyPlaces();
                  },
                  child: Text('isi bang')),
              if (nearbyPlacesResponse.results != null)
                for (int i = 0; i < nearbyPlacesResponse.results!.length; i++)
                  nearbyPlacesWidget(nearbyPlacesResponse.results![i])
            ]),
          ),
        )));
  }

  void getNearbyPlaces() async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbyseach/json?location=' +
            latitude.toString() +
            ',' +
            longtitude.toString() +
            '&radius' +
            radius +
            '&key' +
            apikey);
    var response = await http.post(url);

    nearbyPlacesResponse =
        NearbyPlacesResponse.fromJson(jsonDecode(response.body));
    setState(() {});
  }

  Widget nearbyPlacesWidget(Results results) {
    return SafeArea(
        child: Center(
      child: Container(
        child: ListView(
          children: [
            RsCard(RumahSakit(
                name: results.name!,
                image: results.icon!,
                alamat: results.geometry!.location!.lat.toString() +
                    "," +
                    results.geometry!.location!.lng.toString()))
          ],
        ),
      ),
    ));
  }
}

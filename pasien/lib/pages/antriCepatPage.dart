import 'package:antre/pages/nearby.dart';
import 'package:antre/theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AntreCepat extends StatefulWidget {
  const AntreCepat({super.key});

  @override
  _AntreCepatState createState() => _AntreCepatState();
}

class _AntreCepatState extends State<AntreCepat> {
  String? selectedPoli;
  List<String> poliList = [];

  @override
  void initState() {
    super.initState();
    fetchPoliList();
  }

  Future<void> fetchPoliList() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('RS').get();

      Set<String> uniquePoliSet = Set<String>();

      for (var doc in querySnapshot.docs) {
        QuerySnapshot poliSnapshot =
            await doc.reference.collection('poli').get();

        for (var poliDoc in poliSnapshot.docs) {
          uniquePoliSet.add(poliDoc.get('name'));
        }
      }

      setState(() {
        poliList = uniquePoliSet.toList();
      });
    } catch (e) {
      print('Error fetching poli list: $e');
    }
  }

  Future<List<String>> fetchHospitalsByPoli(String? poliName) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('RS').get();

      List<String> hospitals = [];

      for (var doc in querySnapshot.docs) {
        QuerySnapshot poliSnapshot = await doc.reference
            .collection('poli')
            .where('name', isEqualTo: poliName)
            .get();

        if (poliSnapshot.docs.isNotEmpty) {
          hospitals.add(doc.get('name'));
        }
      }

      return hospitals;
    } catch (e) {
      print('Error fetching hospitals by poli: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Poli'),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                isExpanded: true,
                value: selectedPoli,
                onChanged: (newValue) {
                  setState(() {
                    selectedPoli = newValue;
                  });
                },
                items: poliList.map<DropdownMenuItem<String>>((String poli) {
                  return DropdownMenuItem<String>(
                    value: poli,
                    child: Text(
                      poli,
                      style: blackRegulerTextStyle.copyWith(fontSize: 20),
                    ),
                  );
                }).toList(),
                hint: Text('Pilih Poli'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (selectedPoli != null) {
                    fetchHospitalsByPoli(selectedPoli).then((hospitals) {
                      if (hospitals.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResultPage(
                              selectedPoli: selectedPoli!,
                              hospitals: hospitals,
                            ),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Peringatan'),
                              content: Text(
                                  'Tidak ada rumah sakit yang memiliki poli ini.'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tutup'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Peringatan'),
                          content: Text('Pilih poli terlebih dahulu.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Tutup'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Cari Rumah Sakit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultPage extends StatelessWidget {
  final String selectedPoli;
  final List<String> hospitals;

  SearchResultPage({
    required this.selectedPoli,
    required this.hospitals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pencarian'),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Rumah Sakit dengan Poli $selectedPoli',
                style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            hospitals.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: hospitals
                          .map(
                            (hospital) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                hospital,
                                style:
                                    darkenGreyTextStyle.copyWith(fontSize: 16),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : Center(
                    child:
                        Text('Tidak ada rumah sakit yang memiliki poli ini.')),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RumahSakitPage()
                            // builder: (context) => RsDekat()
                            ));
                  },
                  child: Text('Cek Rumah Sakit Terdekat')),
            )
          ],
        ),
      ),
    );
  }
}

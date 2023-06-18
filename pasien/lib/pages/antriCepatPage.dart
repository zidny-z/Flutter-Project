// import 'package:antre/pages/hasilantriPage.dart';
// import 'package:flutter/material.dart';
// import 'package:antre/theme.dart';

// class antreCepat extends StatelessWidget {
//   const antreCepat({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Program antre Cepat'),
//         backgroundColor: Colors.green,
//         leading: BackButton(
//           color: Colors.white,
//         ),
//       ),
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'antre Cepat',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               child: const SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Nama',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: const SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Nomor BPJS',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: const SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Poli',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: 310,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HasilantrePage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Cari',
//                   style: whiteMediumTextStyle,
//                 ),
//                 style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStatePropertyAll<Color>(greenColor),
//                     foregroundColor:
//                         MaterialStatePropertyAll<Color>(whiteColor)),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = list.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.black),
//       underline: Container(
//         height: 2,
//         color: Colors.green,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RumahSakit {
  final String id;
  final String nama;
  final List<Poli> polis;

  RumahSakit({
    required this.id,
    required this.nama,
    required this.polis,
  });
}

class Poli {
  final String id;
  final String nama;
  final String dokter;

  Poli({
    required this.id,
    required this.nama,
    required this.dokter,
  });
}

class AntreCepat extends StatefulWidget {
  @override
  _AntreCepatState createState() => _AntreCepatState();
}

class _AntreCepatState extends State<AntreCepat> {
  RumahSakit? _selectedRumahSakit;
  Poli? _selectedPoli;

  List<RumahSakit> _rumahSakitList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final QuerySnapshot rumahSakitSnapshot =
        await FirebaseFirestore.instance.collection('RS').get();

    final List<RumahSakit> rumahSakitList =
        rumahSakitSnapshot.docs.map((document) {
      final List<Poli> polis = (document['poli'] as List)
          .map((poli) => Poli(
                id: poli['id'],
                nama: poli['name'],
                dokter: poli['dokter'],
              ))
          .toList();

      return RumahSakit(
        id: document.id,
        nama: document['name'],
        polis: polis,
      );
    }).toList();

    setState(() {
      _rumahSakitList = rumahSakitList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumah Sakit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<RumahSakit>(
              value: _selectedRumahSakit,
              hint: Text('Pilih Rumah Sakit'),
              onChanged: (RumahSakit? rumahSakit) {
                setState(() {
                  _selectedRumahSakit = rumahSakit;
                  _selectedPoli = null;
                });
              },
              items: _rumahSakitList.map((rumahSakit) {
                return DropdownMenuItem<RumahSakit>(
                  value: rumahSakit,
                  child: Text(rumahSakit.nama),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            if (_selectedRumahSakit != null)
              DropdownButton<Poli>(
                value: _selectedPoli,
                hint: Text('Pilih Poli'),
                onChanged: (Poli? poli) {
                  setState(() {
                    _selectedPoli = poli;
                  });
                },
                items: _selectedRumahSakit!.polis.map((poli) {
                  return DropdownMenuItem<Poli>(
                    value: poli,
                    child: Text(poli.nama),
                  );
                }).toList(),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_selectedRumahSakit != null && _selectedPoli != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailRumahSakitPage(
                        rumahSakit: _selectedRumahSakit!,
                        poli: _selectedPoli!,
                      ),
                    ),
                  );
                }
              },
              child: Text('Lihat Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRumahSakitPage extends StatelessWidget {
  final RumahSakit rumahSakit;
  final Poli poli;

  DetailRumahSakitPage({
    required this.rumahSakit,
    required this.poli,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Sakit'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rumah Sakit: ${rumahSakit.nama}'),
          Text('Poli: ${poli.nama}'),
          Text('Dokter: ${poli.dokter}'),
        ],
      ),
    );
  }
}

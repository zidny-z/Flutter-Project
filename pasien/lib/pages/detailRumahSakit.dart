import 'package:antre/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailRumahSakitPage extends StatelessWidget {
  final String rumahSakitId;

  const DetailRumahSakitPage({required this.rumahSakitId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Rumah Sakit'),
        backgroundColor: greenColor,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('RS')
            .doc(rumahSakitId)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.data() as Map<String, dynamic>?;

          if (data == null) {
            return Text('Data tidak ditemukan.');
          }

          final namaRumahSakit = data['name'] as String?;
          final imageRumahSakit = data['image'] as String?;
          final alamatRumahSakit = data['alamat'] as String?;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: Column(children: [
                      SizedBox(
                        height: 16,
                      ),
                      Image.network(imageRumahSakit ??
                          'https://asset.kompas.com/crops/mOKFrYHlSTM6SEt4aD9PIXZnJE0=/0x5:593x400/750x500/data/photo/2020/03/16/5e6ee88f78835.jpg'),
                      SizedBox(height: 16),
                      Text(namaRumahSakit ?? '',
                          style: blackSemiBoldTextStyle.copyWith(fontSize: 24)),
                      SizedBox(
                        height: 2,
                      ),
                      Text(alamatRumahSakit ?? '',
                          style: greyTextStyle.copyWith(fontSize: 16)),
                    ]),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Data Poli',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(height: 8),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('RS')
                      .doc(rumahSakitId)
                      .collection('poli')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                      return Text('Tidak ada data poli.');
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        final namaPoli = document['name'] as String?;
                        final namaDokter = document['dokter'] as String?;
                        // final poliId = document.id;

                        return ListTile(
                          leading: Icon(Icons.person_2),
                          title: Text(
                            namaPoli ?? '',
                            style: blackSemiBoldTextStyle,
                          ),
                          subtitle: Text(
                            namaDokter ?? '',
                            style: darkenGreyTextStyle,
                          ),
                          shape: Border(bottom: BorderSide(color: greyEBcolor)),
                          trailing: ElevatedButton(
                              onPressed: () {
                                _createAntrian(context, document);
                              },
                              child: Text("Daftar"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _createAntrian(BuildContext context, DocumentSnapshot document) async {
    final today = DateTime.now();
    final user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   // Handle user not logged in
    //   return Text('User not logged in.');
    // }
    print('Document ID: ${document.id}');
    print('Title: ${document['name']}');
    print('Subtitle: ${document['dokter']}');

    final antrianData = {
      'date': today,
      'user': user?.uid,
      'penyelesaian': false,
    };

    try {
      final antrianRef = FirebaseFirestore.instance
          .collection('RS')
          .doc(rumahSakitId)
          .collection('poli')
          .doc(document.id)
          .collection('antrian');

      await antrianRef.add(antrianData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Antrian berhasil dibuat.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuat antrian. Error: $e'),
        ),
      );
    }
  }
}

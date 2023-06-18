import 'package:antre/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAntrian extends StatefulWidget {
  // final String currentUserId;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  // MyAntrian({required this.currentUserId});
  @override
  _MyAntrianState createState() => _MyAntrianState();
}

class _MyAntrianState extends State<MyAntrian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Data Antrian')),
        backgroundColor: greenColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collectionGroup('antrian')
            .where('user', isEqualTo: widget.currentUserId)
            .orderBy('date')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Column(
                children: [
                  Text(
                    'Terjadi kesalahan pengambilan data antrian',
                    style: blackSemiBoldTextStyle,
                  ),
                  SizedBox(height: 24),
                  Text('${snapshot.error}')
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> antrianData =
                  document.data() as Map<String, dynamic>;

              Timestamp timestamp = antrianData['date'] as Timestamp;
              DateTime date = timestamp.toDate(); // Konversi Timestamp

              return ListTile(
                title: FutureBuilder<DocumentSnapshot>(
                  // future: FirebaseFirestore.instance.doc(document.reference.parent!.parent!.parent!.path).get(),
                  future: document.reference.parent.parent!.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }

                    if (snapshot.hasError) {
                      return Text('Terjadi kesalahan pengambilan data poli');
                    }

                    Map<String, dynamic> poliData =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return Text(poliData['name']);
                  },
                ),
                subtitle: FutureBuilder<DocumentSnapshot>(
                  future:
                      document.reference.parent.parent!.parent.parent!.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }

                    if (snapshot.hasError) {
                      return const Text(
                          'Terjadi kesalahan pengambilan data rumah sakit');
                    }

                    Map<String, dynamic> rsData =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return Text(rsData['name']);
                  },
                ),
                trailing: Text(date.toString().substring(0, 16)),
                shape: Border(bottom: BorderSide(color: greyEBcolor)),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

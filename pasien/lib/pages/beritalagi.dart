// main.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeritaLagi extends StatefulWidget {
  const BeritaLagi({Key? key}) : super(key: key);

  @override
  State<BeritaLagi> createState() => _BeritaLagiState();
}

class _BeritaLagiState extends State<BeritaLagi> {
  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: documentSnapshot['image'] != null
                        ? Image.network(
                            documentSnapshot['image'],
                            height: 120,
                            fit: BoxFit.cover,
                          )
                        : SizedBox.shrink(),
                    title: Text(documentSnapshot['title']),
                    subtitle: Text(documentSnapshot['date']),
                    trailing: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.remove_red_eye_rounded),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

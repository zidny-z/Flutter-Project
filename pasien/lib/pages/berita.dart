import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore ListView'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No data available.'),
            );
          }

          final documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index];
              // if (data.containsKey('text')) {
              //   final text = data['text'];
              //   // Melakukan sesuatu dengan teks
              // } else {
              //   print("Bidang 'text' tidak ada dalam dokumen");
              // }
              final text = data['title'] ?? '';

              return ListTile(
                leading: data['images'] != null
                    ? Image.network(
                        data['images'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
                title: Text(text),
              );
            },
          );
        },
      ),
    );
  }
}

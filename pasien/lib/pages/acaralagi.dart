import 'package:antre/theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcaraLagi extends StatefulWidget {
  const AcaraLagi({Key? key}) : super(key: key);

  @override
  State<AcaraLagi> createState() => _AcaraLagiState();
}

class _AcaraLagiState extends State<AcaraLagi> {
  // final CollectionReference _event =
  //     FirebaseFirestore.instance.collection('event');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acara Lain'),
        backgroundColor: greenColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('event').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> eventList = snapshot.data!.docs;
            return ListView.builder(
              itemExtent: 100,
              shrinkWrap: true,
              itemCount: eventList.length,
              itemBuilder: (context, index) {
                final event = eventList[index];
                return ListTile(
                  leading: event['img'] != null
                      ? Image.network(
                          event['img'],
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  title: Text(event['title']),
                  subtitle: Text(event['date & place']),
                  shape: Border(bottom: BorderSide(color: greyEBcolor)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(event: event),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final DocumentSnapshot event;

  NewsDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Acara'),
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 360,
                            height: 181,
                            child: Image.network(
                              event['img'],
                              // height: 120,
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          event['title'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          event['date & place'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      event['description'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:antre/theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeritaLagi extends StatefulWidget {
  const BeritaLagi({Key? key}) : super(key: key);

  @override
  State<BeritaLagi> createState() => _BeritaLagiState();
}

class _BeritaLagiState extends State<BeritaLagi> {
  // final CollectionReference _news =
  //     FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Lain'),
        backgroundColor: greenColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      // body: StreamBuilder(
      //   stream: _news.snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
      //     if (streamSnapshot.hasData) {
      //       return ListView.builder(
      //         itemCount: streamSnapshot.data!.docs.length,
      //         itemBuilder: (context, index) {
      //           final DocumentSnapshot documentSnapshot =
      //               streamSnapshot.data!.docs[index];
      //           return Card(
      //             margin: const EdgeInsets.all(10),
      //             child: ListTile(
      //               leading: documentSnapshot['image'] != null
      //                   ? Image.network(
      //                       documentSnapshot['image'],
      //                       height: 120,
      //                       fit: BoxFit.cover,
      //                     )
      //                   : SizedBox.shrink(),
      //               title: Text(documentSnapshot['title']),
      //               subtitle: Text(documentSnapshot['date']),
      //               trailing: SizedBox(
      //                 width: 50,
      //                 child: Row(
      //                   children: [
      //                     IconButton(
      //                         icon: const Icon(Icons.remove_red_eye_rounded),
      //                         onPressed: () {
      //                           Navigator.pushNamed(context, 'detailBeritaOne',
      //                               arguments: _news);
      //                         }),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }

      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> newsList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return ListTile(
                  leading: news['image'] != null
                      ? Image.network(
                          news['image'],
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : SizedBox.shrink(),
                  title: Text(news['title']),
                  subtitle: Text(news['date']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(news: news),
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
  final DocumentSnapshot news;

  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail Berita'),
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
                              news['image'],
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
                          news['title'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          news['date'],
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
                      news['body'],
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

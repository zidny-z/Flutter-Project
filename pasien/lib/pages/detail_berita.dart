import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:antre/theme.dart';

class DetailBeritaOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot<Map<String, dynamic>>> getLatestNews =
        ModalRoute.of(context)!.settings.arguments
            as Stream<DocumentSnapshot<Map<String, dynamic>>>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Berita'),
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: getLatestNews,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return Text('No data available');
          }

          final documentData = snapshot.data!.data();

          return ListView(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    right: 22,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 29,
                        ),
                        Center(
                          child: Container(
                            width: 360,
                            height: 181,
                            child: Image.network(
                              documentData?['image'],
                              // height: 120,
                              fit: BoxFit.cover,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 29,
                        ),
                        //JUDUL BERITA
                        Text(
                          documentData?['title'],
                          style: blackSemiBoldTextStyle.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        //NAMA RUMAH SAKIT
                        Text(
                          documentData!['date'],
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        // PENJABARAN BERITA
                        Text(
                          documentData['body'],
                          textAlign: TextAlign.justify,
                          style: blackRegulerTextStyle.copyWith(fontSize: 18),
                        )
                      ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:antri/models/poliM.dart';
import 'package:antri/widgets/poliCard.dart';
import 'package:flutter/material.dart';
import 'package:antri/theme.dart';

class PoliPage extends StatelessWidget {
  const PoliPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Poli'),
        backgroundColor: greenColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                PoliCard(Poli(id: 1, name: 'Polinyaaaaaaaaaaaaaaaaaaaaaaaaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
                PoliCard(Poli(id: 1, name: 'Polinyaaa')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

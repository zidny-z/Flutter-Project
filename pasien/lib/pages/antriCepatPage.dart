import 'package:antriajaa/pages/hasilAntriPage.dart';
import 'package:flutter/material.dart';
import 'package:antriajaa/theme.dart';

class AntriCepat extends StatelessWidget {
  const AntriCepat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Program Antri Cepat'),
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Antri Cepat',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: const SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: const SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Nomor BPJS',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: const SizedBox(
                width: 310,
                height: 47,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(),
                    labelText: 'Poli',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 310,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HasilAntriPage(),
                    ),
                  );
                },
                child: Text(
                  'Cari',
                  style: whiteMediumTextStyle,
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(greenColor),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(whiteColor)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

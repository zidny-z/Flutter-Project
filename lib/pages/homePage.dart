import 'package:antriajaa/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Akun Anda',
              style: TextStyle(
                  color: greenColor, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/images/img1.png',
                  height: 140,
                  width: 140,
                  fit: BoxFit.fitWidth,
                )),
            SizedBox(
              height: 16,
            ),
            Text('A Zidni Zainul I',
                style: TextStyle(
                    // color: greyColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: 4,
            ),
            Text('Software Developer',
                style: TextStyle(color: greyColor, fontSize: 14)),
            SizedBox(
              height: 60,
            ),
            Wrap(
              spacing: 38.0, // gap between adjacent chips
              runSpacing: 40.0,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/images/img1.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.fitWidth,
                    )),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 180,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Ubah Data',
                  style: TextStyle(fontSize: 16),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(redColor),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(greenColor)),
              ),
            )
          ],
        ),
      )),
    );
  }
}

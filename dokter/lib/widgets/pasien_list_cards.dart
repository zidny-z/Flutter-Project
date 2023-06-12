import 'package:flutter/material.dart';
import 'package:pbmdoctor/pages/detail_list_pasien.dart';
import 'package:pbmdoctor/theme.dart';

class pasienlistcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => detaillistpasien()));
      },
      child: Container(
        width: 360,
        height: 80,
        color: greenColor,
        child: Row(children: [
          SizedBox(
            width: 16,
          ),
          Image.asset(
            'assets/images/user1.png',
            width: 64,
            height: 59,
          ),
          SizedBox(
            width: 22,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Poli Umum',
                style: whiteSemiBoldTextStyle.copyWith(fontSize: 20),
              ),
              Text(
                'Nur Fitriana',
                style: whiteRegularTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

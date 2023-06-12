// import 'package:antriajaa/pages/homePage.dart';
// import 'package:antriajaa/pages/loginPage.dart';
// import 'package:antriajaa/theme.dart';
// import 'package:flutter/material.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Daftar',
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               child: const SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Nama',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: const SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Nomor BPJS',
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: SizedBox(
//                 width: 310,
//                 height: 47,
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xffF6F6F6),
//                     border: OutlineInputBorder(),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//                 child: Container(
//                     width: 310,
//                     height: 175,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/uploud.png'),
//                           fit: BoxFit.fitWidth),
//                       borderRadius: BorderRadius.circular(8.0),
//                       // button text
//                     )),
//                 onTap: () {
//                   print("you clicked me");
//                 }),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 310,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomePage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Daftar',
//                   style: whiteMediumTextStyle,
//                 ),
//                 style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStatePropertyAll<Color>(greenColor),
//                     foregroundColor:
//                         MaterialStatePropertyAll<Color>(whiteColor)),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 310,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginPage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Masuk',
//                   style: greenTextStyle,
//                 ),
//                 style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStatePropertyAll<Color>(whiteColor),
//                     foregroundColor:
//                         MaterialStatePropertyAll<Color>(blackColor)),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// // class PasswordTextField extends StatelessWidget {
// //   const PasswordTextField({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: 310,
// //       height: 47,
// //       child: TextField(
// //         obscureText: true,
// //         decoration: InputDecoration(
// //           // enabledBorder: const OutlineInputBorder(
// //           //   borderSide: const BorderSide(color: Colors.green, width: 0.0),
// //           // ),
// //           // border: OutlineInputBorder(),
// //           filled: true,
// //           fillColor: Color(0xffF6F6F6),
// //           border: OutlineInputBorder(),
// //           labelText: 'Password',
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class NameTextField extends StatelessWidget {
// //   const NameTextField({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const SizedBox(
// //       width: 310,
// //       height: 47,
// //       child: TextField(
// //         obscureText: false,
// //         decoration: InputDecoration(
// //           filled: true,
// //           fillColor: Color(0xffF6F6F6),
// //           border: OutlineInputBorder(),
// //           labelText: 'Name',
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class BPJSTextField extends StatelessWidget {
// //   const BPJSTextField({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: const SizedBox(
// //         width: 310,
// //         height: 47,
// //         child: TextField(
// //           obscureText: false,
// //           decoration: InputDecoration(
// //             filled: true,
// //             fillColor: Color(0xffF6F6F6),
// //             border: OutlineInputBorder(),
// //             labelText: 'Nomor BPJS',
// //           ),
// //           keyboardType: TextInputType.number,
// //         ),
// //       ),
// //     );
// //   }
// // }

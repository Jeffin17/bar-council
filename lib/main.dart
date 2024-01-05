
import 'package:bar_council_main2/pages/annual_amt.dart';
import 'package:bar_council_main2/pages/edit.dart';
import 'package:bar_council_main2/pages/homepage.dart';
import 'package:bar_council_main2/pages/login.dart';
import 'package:bar_council_main2/pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/MyBottomNavBar_final.dart';

void main() {
  runApp(const MyApp()) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        ),
        home:  const Login());
  }
}                               /*current page: Login(), Edit(), */



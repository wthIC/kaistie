import 'package:flutter/material.dart';
import 'package:kaistie/screens/sign_in_screen.dart';
import 'package:kaistie/screens/sign_up_screen.dart';
import 'package:kaistie/screens/starting_screen.dart';

void main() {
  runApp(const Kaistie());
}

class Kaistie extends StatelessWidget {
  const Kaistie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAISTIE',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xff2264a8,
          {
            50: Color(0xff2264a8),
            100: Color(0xff2264a8),
            200: Color(0xff2264a8),
            300: Color(0xff2264a8),
            400: Color(0xff2264a8),
            500: Color(0xff2264a8),
            600: Color(0xff2264a8),
            700: Color(0xff2264a8),
            800: Color(0xff2264a8),
            900: Color(0xff2264a8),
          },
        ),
        backgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: StartingScreen(),
      ),
    );
  }
}

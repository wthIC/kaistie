import 'package:flutter/material.dart';
import 'package:kaistie/screens/sign_up_screen.dart';

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
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}

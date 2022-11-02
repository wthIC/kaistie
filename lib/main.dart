import 'package:flutter/material.dart';

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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'KAISTIE',
          ),
        ),
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}

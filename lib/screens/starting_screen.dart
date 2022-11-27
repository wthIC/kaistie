import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/kaistie_logo.svg'),
      ),
    );
  }
}

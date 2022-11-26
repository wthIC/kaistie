import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kaistie/components/custom_button.dart';
import 'package:kaistie/components/custom_text_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/kaistie_logo.svg'),
    );
  }
}

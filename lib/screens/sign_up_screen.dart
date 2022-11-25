import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              Center(
                child: SvgPicture.asset('assets/kaistie_logo.svg'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Welcome To KAISTIE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Please provide your information',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 30.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                placeholder: 'Enter your Full Name',
                label: 'Full Name',
                disableNext: true,
                required: true,
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                placeholder: 'Enter your Email',
                label: 'Email',
                disableNext: true,
                required: true,
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                placeholder: 'Enter your password',
                label: 'Create password',
                disableNext: true,
                required: true,
              ),
              const SizedBox(height: 16.0),
              const CustomTextField(
                placeholder: 'Enter your password again',
                label: 'Confirm password',
                disableNext: true,
                required: true,
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

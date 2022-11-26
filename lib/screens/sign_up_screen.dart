import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_button.dart';
import 'package:kaistie/components/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int stage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SecondStage(
              onTap: () {
                stage = 1;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FirstStage extends StatelessWidget {
  const FirstStage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          disableNext: false,
          required: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your Email',
          label: 'Email',
          disableNext: false,
          required: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your password',
          label: 'Create password',
          disableNext: false,
          required: true,
          obscureText: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your password again',
          label: 'Confirm password',
          disableNext: true,
          required: true,
          obscureText: true,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          onTap: onTap,
          buttonText: 'Continue',
        ),
      ],
    );
  }
}

class SecondStage extends StatelessWidget {
  const SecondStage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          disableNext: false,
          required: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your Email',
          label: 'Email',
          disableNext: false,
          required: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your password',
          label: 'Create password',
          disableNext: false,
          required: true,
          obscureText: true,
        ),
        const SizedBox(height: 16.0),
        const CustomTextField(
          placeholder: 'Enter your password again',
          label: 'Confirm password',
          disableNext: true,
          required: true,
          obscureText: true,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          onTap: onTap,
          buttonText: 'Continue',
        ),
      ],
    );
  }
}

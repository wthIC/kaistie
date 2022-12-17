import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_button.dart';
import 'package:kaistie/components/custom_text_field.dart';
import 'package:kaistie/screens/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailC = TextEditingController();
    final _passwordC = TextEditingController();
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                  const SizedBox(height: 60.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    controller: _emailC,
                    placeholder: 'Enter your information',
                    label: 'Email or phone number',
                    disableNext: false,
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    controller: _passwordC,
                    placeholder: 'Enter your password',
                    label: 'Password',
                    disableNext: false,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  CustomButton(
                    onTap: () {},
                    buttonText: 'Continue',
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

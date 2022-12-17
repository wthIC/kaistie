import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_button.dart';
import 'package:kaistie/components/custom_text_field.dart';
import 'package:kaistie/screens/find_matches_screen.dart';
import 'package:kaistie/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaistie/screens/test_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int stage = 0;

  final _fullNameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();
  final _confirmPasswordC = TextEditingController();
  final _studentIDC = TextEditingController();
  final _phoneNumberC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SignUpScreenModel(),
      child: Consumer<_SignUpScreenModel>(
        builder: (context, signUpScreenModel, child) => SafeArea(
          child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: (stage == 0)
                        ? Column(
                            children: [
                              const SizedBox(height: 40.0),
                              Center(
                                child:
                                    SvgPicture.asset('assets/kaistie_logo.svg'),
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
                              CustomTextField(
                                controller: _fullNameC,
                                onChanged: (String value) {
                                  signUpScreenModel.fullName = value;
                                },
                                placeholder: 'Enter your Full Name',
                                label: 'Full Name',
                                disableNext: false,
                                required: true,
                              ),
                              const SizedBox(height: 16.0),
                              CustomTextField(
                                controller: _emailC,
                                onChanged: (String value) {
                                  signUpScreenModel.email = value;
                                },
                                placeholder: 'Enter your Email',
                                label: 'Email',
                                disableNext: false,
                                required: true,
                              ),
                              const SizedBox(height: 16.0),
                              CustomTextField(
                                controller: _passwordC,
                                onChanged: (String value) {
                                  signUpScreenModel.password = value;
                                },
                                placeholder: 'Enter your password',
                                label: 'Create password',
                                disableNext: false,
                                required: true,
                                obscureText: true,
                              ),
                              const SizedBox(height: 16.0),
                              CustomTextField(
                                controller: _confirmPasswordC,
                                onChanged: (String value) {
                                  signUpScreenModel.confirmPassword = value;
                                },
                                placeholder: 'Enter your password again',
                                label: 'Confirm password',
                                disableNext: true,
                                required: true,
                                obscureText: true,
                              ),
                              const SizedBox(height: 40.0),
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    stage = 1;
                                  });
                                },
                                buttonText: 'Continue',
                              ),
                            ],
                          )
                        : (stage == 1)
                            ? Column(
                                children: [
                                  const SizedBox(height: 40.0),
                                  Center(
                                    child: SvgPicture.asset(
                                        'assets/kaistie_logo.svg'),
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
                                  CustomTextField(
                                    controller: _studentIDC,
                                    onChanged: (String value) {
                                      signUpScreenModel._studentID = value;
                                    },
                                    placeholder: 'Student ID',
                                    label: 'Student ID',
                                    required: true,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Gender',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' *',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _GenderButton(
                                            buttonText: 'Male',
                                            chosen:
                                                signUpScreenModel.gender == 0,
                                            onTap: () {
                                              signUpScreenModel.gender = 0;
                                              setState(() {});
                                            },
                                          ),
                                          _GenderButton(
                                            buttonText: 'Female',
                                            chosen:
                                                signUpScreenModel.gender == 1,
                                            onTap: () {
                                              signUpScreenModel.gender = 1;
                                              setState(() {});
                                            },
                                          ),
                                          _GenderButton(
                                            buttonText: 'Other',
                                            chosen:
                                                signUpScreenModel.gender == 2,
                                            onTap: () {
                                              signUpScreenModel.gender = 2;
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  CustomTextField(
                                    controller: _phoneNumberC,
                                    onChanged: (String value) {
                                      signUpScreenModel.phoneNumber = value;
                                    },
                                    placeholder: 'Enter your phone number',
                                    label: 'Phone number',
                                    disableNext: false,
                                    required: true,
                                  ),
                                  const SizedBox(height: 40.0),
                                  CustomButton(
                                    onTap: () {
                                      setState(() {
                                        stage = 2;
                                      });
                                    },
                                    buttonText: 'Continue',
                                  ),
                                ],
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 40.0),
                                    Center(
                                      child: SvgPicture.asset(
                                          'assets/kaistie_logo.svg'),
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
                                      'You can now use KAISTIE app and',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const Text(
                                      'find your perfect roommate',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 40.0),
                                    CustomButton(
                                      onTap: () {
                                        setState(() {
                                          signUpScreenModel.signUp(context);
                                        });
                                      },
                                      buttonText: 'Finish',
                                    ),
                                  ],
                                ),
                              ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      required this.chosen})
      : super(key: key);

  final Function() onTap;
  final String buttonText;
  final Color disabledColor = const Color.fromRGBO(144, 164, 174, 1);
  final bool chosen;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            color: chosen ? colorScheme.primary : Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: disabledColor,
              highlightColor: disabledColor,
              borderRadius: BorderRadius.circular(8.0),
              onTap: onTap,
              child: SizedBox(
                width: 90.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: textTheme.button!.copyWith(
                          color: chosen ? Colors.white : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // height: 40.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SignUpScreenModel extends ChangeNotifier {
  String _fullName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _studentID = "";
  String _phoneNumber = "";
  int _gender = -1;

  int get gender {
    return _gender;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  set gender(int value) {
    _gender = value;
    notifyListeners();
  }

  set studentID(String value) {
    _studentID = value;
    notifyListeners();
  }

  set fullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  set confirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  Future signUp(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } on FirebaseAuthException catch (e) {
      BotToast.showText(text: e.code);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
      );
      return;
    }

    final User user = FirebaseAuth.instance.currentUser!;
    print(user.uid);

    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final json = {
      'uid': user.uid,
      'email': _email,
      'fullName': _fullName,
      'gender': _gender,
      'phoneNumber': _phoneNumber,
      'studentID': _studentID,
      'testAnswers': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''],
    };

    await docUser.set(json);

    // var current = docUser.get().then((value) {
    //   print(value);
    //   var fields = value.data();
    //   print(fields);
    // });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TestScreen(),
      ),
    );
  }
}

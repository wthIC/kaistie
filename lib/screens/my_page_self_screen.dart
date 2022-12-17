import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kaistie/components/custom_bottom_navigation_bar.dart';
import 'package:kaistie/screens/sign_in_screen.dart';

class MyPageSelf extends StatelessWidget {
  const MyPageSelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFEDF0F7),
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              'My Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox.expand(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  return ListView.builder(
                      itemCount: streamSnapshot.data?.docs.length ?? 0,
                      itemBuilder: (ctx, index) {
                        final User user = FirebaseAuth.instance.currentUser!;
                        print(user.uid);

                        final docUser = FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid);

                        return FirebaseAuth.instance.currentUser!.uid ==
                                streamSnapshot.data!.docs[index]['uid']
                            ? Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/image_placeholder.svg'),
                                  const SizedBox(height: 24.0),
                                  Text(
                                    'Hi, ${streamSnapshot.data!.docs[index]['fullName']} 👋',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 24.0),
                                  Row(
                                    children: const [
                                      Text(
                                        'Account',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        streamSnapshot.data!.docs[index]
                                            ['email'],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Phone number',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        streamSnapshot.data!.docs[index]
                                            ['phoneNumber'],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Student ID',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        streamSnapshot.data!.docs[index]
                                            ['studentID'],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24.0),
                                  const Text(
                                    'Bio',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'I am looking for a roommate to hang out and study with!',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24.0),
                                  _CustomButton(
                                    textColor: Colors.white,
                                    onTap: () {},
                                    color: colorScheme.primary,
                                    buttonText:
                                        'Take Roommate Compatibility Test',
                                  ),
                                  const SizedBox(height: 24.0),
                                  _CustomButton(
                                    textColor: Colors.black,
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignInScreen(),
                                        ),
                                      );
                                    },
                                    color: const Color(0xFFCBD2E0),
                                    buttonText: 'Sign Out',
                                  ),
                                ],
                              )
                            : const SizedBox();
                      });
                },
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(
            currentIndex: 1,
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.color,
    required this.textColor,
    this.disabled = false,
    this.loading = false,
  }) : super(key: key);

  final Function() onTap;
  final String buttonText;
  final bool disabled;
  final Color? color;
  final Color textColor;
  final Color disabledColor = const Color.fromRGBO(144, 164, 174, 1);
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: disabledColor,
              highlightColor: disabledColor,
              borderRadius: BorderRadius.circular(8.0),
              onTap: disabled ? null : onTap,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Center(
                    child: loading
                        ? const SpinKitThreeBounce(
                            color: Colors.white,
                            size: 20,
                          )
                        : Text(
                            buttonText,
                            style: textTheme.button!.copyWith(color: textColor),
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

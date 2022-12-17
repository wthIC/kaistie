import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_bottom_navigation_bar.dart';
import 'package:kaistie/screens/chat_screen.dart';

class FindMatchesScreen extends StatelessWidget {
  const FindMatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFEDF0F7),
          appBar: AppBar(
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Your top roommate matches',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Go ahead and connect with them through chatting room!',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return ListView.builder(
                    itemCount: streamSnapshot.data?.docs.length ?? 0,
                    itemBuilder: (ctx, index) {
                      final User user = FirebaseAuth.instance.currentUser!;
                      print(user.uid);

                      final docUser = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid);

                      bool match = true;
                      return (FirebaseAuth.instance.currentUser!.uid !=
                                  streamSnapshot.data!.docs[index]['uid'] &&
                              match)
                          ? _MatchEntry(
                              fullName: streamSnapshot.data!.docs[index]
                                  ['fullName'],
                              onTap: () {
                                print('pushed');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                      to: streamSnapshot.data!.docs[index],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const SizedBox();
                    });
              },
            ),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(
            currentIndex: 0,
          ),
        ),
      ),
    );
  }
}

class _MatchEntry extends StatelessWidget {
  const _MatchEntry({
    Key? key,
    required this.fullName,
    required this.onTap,
  }) : super(key: key);

  final String fullName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/image_placeholder_grey.svg',
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'I love pizza',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    _CustomButton(
                      onTap: onTap,
                      color: const Color(0xFFCBD2E0),
                      textColor: Colors.black,
                      buttonText: 'Chat',
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Dormitories of choice: N19 Areum Hall',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
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
          height: 32.0,
          width: 72.0,
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

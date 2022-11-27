import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_bottom_navigation_bar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            centerTitle: false,
            title: const Text(
              'Chats',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon-image.svg',
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Lee Jiwoo',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Yes!',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon-image.svg',
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Jane Smith',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Thanks for letting me know :)',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar(
            currentIndex: 2,
          ),
        ),
      ),
    );
  }
}

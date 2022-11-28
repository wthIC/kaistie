import 'package:flutter/material.dart';
import 'package:kaistie/screens/chat_list_screen.dart';
import 'package:kaistie/screens/find_matches_screen.dart';
import 'package:kaistie/screens/my_page_self_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FindMatchesScreen(),
            ),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyPageSelf(),
            ),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatListScreen(),
            ),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_outlined),
          label: 'Find Matches',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'My Page',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outlined),
          label: 'Chat Rooms',
        ),
      ],
    );
  }
}

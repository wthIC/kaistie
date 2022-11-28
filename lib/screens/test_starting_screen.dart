import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_bottom_navigation_bar.dart';
import 'package:kaistie/components/custom_button.dart';

class TestStartingScreen extends StatelessWidget {
  const TestStartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: colorScheme.primary,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Make an informed decision about your potential',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'roommates by answering these questions!',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Roommate Compatibility Test',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 40.0,
                      bottom: 40.0,
                      right: 40.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 4.0,
                          width: 72.0,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icon-number-01.svg'),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '10 Questions',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'To learn about your lifestyle and',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'preferences in roommates',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icon-number-02.svg'),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '2 min',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Total duration of the test',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icon-number-03.svg'),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Find your perfect match!',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Our algorithm will match you with the',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'most compatible candidates in seconds',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        CustomButton(
                          onTap: () {},
                          buttonText: 'Start Test',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MatchEntry extends StatelessWidget {
  const _MatchEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      children: const [
                        Text(
                          'Lee Jiwoo',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'I love pizza',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    _CustomButton(
                      onTap: () {},
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_button.dart';
import 'package:kaistie/screens/find_matches_screen.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int stage = 0;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ChangeNotifierProvider(
      create: (context) => _TestScreenModel(),
      child: Consumer<_TestScreenModel>(
        builder: (context, testScreenModel, child) => SafeArea(
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
              body: SingleChildScrollView(
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Roommate Compatibility Test',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          left: 20.0,
                          bottom: 40.0,
                          right: 20.0,
                        ),
                        child: stage == 0
                            ? SizedBox(
                                child: Column(
                                  //mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 4.0,
                                      width: 72.0,
                                      decoration: BoxDecoration(
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 24.0),
                                    const Text(
                                      'Select the response that is most like yourself.',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '(Questions with ',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '* ',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'are mandatory)',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    QuestionEntry(
                                      required: true,
                                      question:
                                          '1. When do you go to bed during the week?',
                                      choices: const [
                                        'Early: between 8pm - 11pm',
                                        'Moderate: between 11pm - 1am',
                                        'Late: between 1am - 4am',
                                        'During daylight hours',
                                      ],
                                      onTaps: [
                                        () {
                                          testScreenModel.answer1 = 1;
                                        },
                                        () {
                                          testScreenModel.answer1 = 2;
                                        },
                                        () {
                                          testScreenModel.answer1 = 3;
                                        },
                                        () {
                                          testScreenModel.answer1 = 4;
                                        },
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                    QuestionEntry(
                                      required: true,
                                      question: '2. What\'s your room like?',
                                      choices: const [
                                        'Spotlessly clean - daily tidy',
                                        'Pretty good - weekly clean',
                                        'Not bad - monthly clean',
                                        'Not sure - no cleaning products',
                                      ],
                                      onTaps: [
                                        () {
                                          testScreenModel.answer2 = 1;
                                        },
                                        () {
                                          testScreenModel.answer2 = 2;
                                        },
                                        () {
                                          testScreenModel.answer2 = 3;
                                        },
                                        () {
                                          testScreenModel.answer2 = 4;
                                        },
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                    QuestionEntry(
                                      required: true,
                                      question: '3. Your study habits?',
                                      choices: const [
                                        'Must be completely quiet',
                                        'Some distractions are ok',
                                        'Usually study elsewhere',
                                        'Who needs to study?',
                                      ],
                                      onTaps: [
                                        () {
                                          testScreenModel.answer3 = 1;
                                        },
                                        () {
                                          testScreenModel.answer3 = 2;
                                        },
                                        () {
                                          testScreenModel.answer3 = 3;
                                        },
                                        () {
                                          testScreenModel.answer3 = 4;
                                        },
                                      ],
                                    ),
                                    const SizedBox(height: 24.0),
                                    CustomButton(
                                      onTap: () {
                                        setState(() {
                                          stage = 1;
                                        });
                                      },
                                      buttonText: 'Continue',
                                    ),
                                  ],
                                ),
                              )
                            : stage == 1
                                ? Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 4.0,
                                        width: 72.0,
                                        decoration: BoxDecoration(
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
                                      const Text(
                                        'Select the response that is most like yourself.',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '(Questions with ',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '* ',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'are mandatory)',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      QuestionEntry(
                                        required: true,
                                        question:
                                            '4. Will any friends be staying over?',
                                        choices: const [
                                          'I have a friend who visits my room frequently (> 2 times/week)',
                                          'I have a friend who visits my room occasionally (< 2 times/week)',
                                          'I do not expect any guests',
                                        ],
                                        onTaps: [
                                          () {
                                            testScreenModel.answer4 = 1;
                                          },
                                          () {
                                            testScreenModel.answer4 = 2;
                                          },
                                          () {
                                            testScreenModel.answer4 = 3;
                                          },
                                        ],
                                      ),
                                      const SizedBox(height: 24.0),
                                      QuestionEntry(
                                        required: true,
                                        question:
                                            '5. Do you have any food allergies?',
                                        choices: const [
                                          'No',
                                          'Yes, I have food allergies:',
                                        ],
                                        onTaps: [
                                          () {
                                            testScreenModel.answer5 = 1;
                                          },
                                          () {
                                            testScreenModel.answer5 = 2;
                                          },
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Answer here',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
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
                                : stage == 2
                                    ? Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 4.0,
                                            width: 72.0,
                                            decoration: BoxDecoration(
                                              color: colorScheme.primary,
                                            ),
                                          ),
                                          const SizedBox(height: 24.0),
                                          const Text(
                                            'Almost there! Now, answer some questions about what your perfect roommate is like.',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '(Questions with ',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '* ',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'are mandatory)',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          QuestionEntry(
                                            required: true,
                                            question:
                                                '6. What are yo hoping for from roommate?',
                                            choices: const [
                                              'Some to split chores and expenses',
                                              'Some friendly, but don\'t have to be best friends',
                                              'Someone who wants to hang out and do stuff with',
                                            ],
                                            onTaps: [
                                              () {
                                                testScreenModel.answer6 = 1;
                                              },
                                              () {
                                                testScreenModel.answer6 = 2;
                                              },
                                              () {
                                                testScreenModel.answer6 = 3;
                                              },
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                          QuestionEntry(
                                            required: true,
                                            question:
                                                '7. How do you feel about guests spending the night?',
                                            choices: const [
                                              'Doesn\'t bother me',
                                              'Occasionally is fine, but not multiple nights',
                                              'Guests staying over regularly is fine',
                                              'I\'m not comfortable with guests staying over',
                                            ],
                                            onTaps: [
                                              () {
                                                testScreenModel.answer7 = 1;
                                              },
                                              () {
                                                testScreenModel.answer7 = 2;
                                              },
                                              () {
                                                testScreenModel.answer7 = 3;
                                              },
                                              () {
                                                testScreenModel.answer7 = 4;
                                              },
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                          QuestionEntry(
                                            required: true,
                                            question:
                                                '8. When is noise acceptable?',
                                            choices: const [
                                              'Any time of day and night',
                                              'During the day and evening, but not at night',
                                              'During the daytime only please',
                                              'I need the silence of a library',
                                            ],
                                            onTaps: [
                                              () {
                                                testScreenModel.answer8 = 1;
                                              },
                                              () {
                                                testScreenModel.answer8 = 2;
                                              },
                                              () {
                                                testScreenModel.answer8 = 3;
                                              },
                                              () {
                                                testScreenModel.answer8 = 4;
                                              },
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                          CustomButton(
                                            onTap: () {
                                              setState(() {
                                                stage = 3;
                                              });
                                            },
                                            buttonText: 'Continue',
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 4.0,
                                            width: 72.0,
                                            decoration: BoxDecoration(
                                              color: colorScheme.primary,
                                            ),
                                          ),
                                          const SizedBox(height: 24.0),
                                          const Text(
                                            'Almost there! Now, answer some questions about what your perfect roommate is like.',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          RichText(
                                            text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '(Questions with ',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '* ',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'are mandatory)',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const MultiSelectEntry(
                                            required: true,
                                            question:
                                                '9. What common-use items will you share? Select the items you can share with your roommate.',
                                            choices: [
                                              'Refrigerator',
                                              'Cleaning products',
                                              'Paper products',
                                              'Vacuum',
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                          const MultiSelectEntry(
                                            required: true,
                                            question:
                                                '10. Where do you want to live on campus?',
                                            choices: [
                                              'E8 Sejong Hall',
                                              'N19 Areum Hall',
                                              'W4-1 Yeoul Hall',
                                              'W4-3 Dasom Hall',
                                              'W5 On-campus APT',
                                              'W6 Narae Hall',
                                              'Hwaam Hall',
                                            ],
                                          ),
                                          const SizedBox(height: 24.0),
                                          CustomButton(
                                            onTap: () {
                                              testScreenModel
                                                  .finishTest(context);
                                            },
                                            buttonText: 'Continue',
                                          ),
                                        ],
                                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionEntry extends StatefulWidget {
  const QuestionEntry({
    Key? key,
    required this.question,
    required this.required,
    required this.choices,
    required this.onTaps,
  }) : super(key: key);

  final String question;
  final bool required;
  final List<String> choices;
  final List<Function()> onTaps;

  @override
  State<QuestionEntry> createState() => _QuestionEntryState();
}

class _QuestionEntryState extends State<QuestionEntry> {
  int choice = -1;

  List<Widget> getChoices() {
    List<Widget> ret = [const SizedBox(height: 8.0)];
    for (int i = 0; i < widget.choices.length; i++) {
      ret.add(GestureDetector(
        onTap: () {
          setState(() {
            choice = i;
            widget.onTaps[i]();
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            choice == i
                ? SvgPicture.asset('assets/chosen.svg')
                : SvgPicture.asset('assets/choice.svg'),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                widget.choices[i],
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.question,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (widget.required)
                const TextSpan(
                  text: '* ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getChoices(),
        ),
      ],
    );
  }
}

class MultiSelectEntry extends StatefulWidget {
  const MultiSelectEntry({
    Key? key,
    required this.question,
    required this.required,
    required this.choices,
  }) : super(key: key);

  final String question;
  final bool required;
  final List<String> choices;

  @override
  State<MultiSelectEntry> createState() => _MultiSelectEntryState();
}

class _MultiSelectEntryState extends State<MultiSelectEntry> {
  List<bool> choice = [];

  List<Widget> getChoices() {
    List<Widget> ret = [const SizedBox(height: 8.0)];
    for (int i = 0; i < widget.choices.length; i++) {
      choice.add(false);
      ret.add(GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: CheckboxListTile(
          title: Text(widget.choices[i]),
          value: choice[i],
          onChanged: (bool? value) {
            setState(() {
              choice[i] = value!;
            });
          },
        ),
      ));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.question,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (widget.required)
                const TextSpan(
                  text: '* ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getChoices(),
        ),
      ],
    );
  }
}

class _TestScreenModel extends ChangeNotifier {
  int _answer1 = 0;
  int _answer2 = 0;
  int _answer3 = 0;
  int _answer4 = 0;
  int _answer5 = 0;
  int _answer6 = 0;
  int _answer7 = 0;
  int _answer8 = 0;
  int _answer9 = 0;
  int _answer10 = 0;
  String _extra = '';

  set answer1(int value) {
    _answer1 = value;
    notifyListeners();
  }

  set answer2(int value) {
    _answer2 = value;
    notifyListeners();
  }

  set answer3(int value) {
    _answer3 = value;
    notifyListeners();
  }

  set answer4(int value) {
    _answer4 = value;
    notifyListeners();
  }

  set answer5(int value) {
    _answer5 = value;
    notifyListeners();
  }

  set answer6(int value) {
    _answer6 = value;
    notifyListeners();
  }

  set answer7(int value) {
    _answer7 = value;
    notifyListeners();
  }

  set answer8(int value) {
    _answer8 = value;
    notifyListeners();
  }

  set answer9(int value) {
    _answer9 = value;
    notifyListeners();
  }

  set answer10(int value) {
    _answer10 = value;
    notifyListeners();
  }

  set extra(String value) {
    _extra = value;
    notifyListeners();
  }

  Future finishTest(BuildContext context) async {
    List<dynamic> testAnswers = [
      _answer1,
      _answer2,
      _answer3,
      _answer4,
      _answer5,
      _answer6,
      _answer7,
      _answer8,
      _answer9,
      _answer10,
      _extra,
    ];

    print(testAnswers);

    final User user = FirebaseAuth.instance.currentUser!;
    print(user.uid);

    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    var current = docUser.get().then((value) {
      var fields = value.data();
      fields!['testAnswers'] = testAnswers;
      docUser.update(fields);
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FindMatchesScreen(),
      ),
    );
  }
}

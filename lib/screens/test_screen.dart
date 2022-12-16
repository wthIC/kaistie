import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaistie/components/custom_button.dart';

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
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: colorScheme.primary,
          // appBar: AppBar(
          //   elevation: 0,
          //   leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.arrow_back),
          //   ),
          // ),
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
                        ? FirstStage(
                            onTap: () {
                              setState(() {
                                stage = 1;
                              });
                            },
                          )
                        : stage == 1
                            ? SecondStage(
                                onTap: () {
                                  setState(() {
                                    stage = 2;
                                  });
                                },
                              )
                            : stage == 2
                                ? ThirdStage(
                                    onTap: () {
                                      setState(() {
                                        stage = 3;
                                      });
                                    },
                                  )
                                : FourthStage(
                                    onTap: () {
                                      setState(() {
                                        stage = 0;
                                      });
                                    },
                                  ),
                  ),
                ),
              ],
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
  }) : super(key: key);

  final String question;
  final bool required;
  final List<String> choices;

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

class FirstStage extends StatelessWidget {
  const FirstStage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
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
          const QuestionEntry(
            required: true,
            question: '1. When do you go to bed during the week?',
            choices: [
              'Early: between 8pm - 11pm',
              'Moderate: between 11pm - 1am',
              'Late: between 1am - 4am',
              'During daylight hours',
            ],
          ),
          const SizedBox(height: 24.0),
          const QuestionEntry(
            required: true,
            question: '2. What\'s your room like?',
            choices: [
              'Spotlessly clean - daily tidy',
              'Pretty good - weekly clean',
              'Not bad - monthly clean',
              'Not sure - no cleaning products',
            ],
          ),
          const SizedBox(height: 24.0),
          const QuestionEntry(
            required: true,
            question: '3. Your study habits?',
            choices: [
              'Must be completely quiet',
              'Some distractions are ok',
              'Usually study elsewhere',
              'Who needs to study?',
            ],
          ),
          const SizedBox(height: 24.0),
          CustomButton(
            onTap: onTap,
            buttonText: 'Continue',
          ),
        ],
      ),
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.max,
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
        const QuestionEntry(
          required: true,
          question: '4. Will any friends be staying over?',
          choices: [
            'I have a friend who visits my room frequently (> 2 times/week)',
            'I have a friend who visits my room occasionally (< 2 times/week)',
            'I do not expect any guests',
          ],
        ),
        const SizedBox(height: 24.0),
        const QuestionEntry(
          required: true,
          question: '5. Do you have any food allergies?',
          choices: [
            'No',
            'Yes, I have food allergies:',
          ],
        ),
        const SizedBox(height: 8.0),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Answer here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        CustomButton(
          onTap: onTap,
          buttonText: 'Continue',
        ),
      ],
    );
  }
}

class ThirdStage extends StatelessWidget {
  const ThirdStage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.max,
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
        const QuestionEntry(
          required: true,
          question: '6. What are yo hoping for from roommate?',
          choices: [
            'Some to split chores and expenses',
            'Some friendly, but don\'t have to be best friends',
            'Someone who wants to hang out and do stuff with',
          ],
        ),
        const SizedBox(height: 24.0),
        const QuestionEntry(
          required: true,
          question: '7. How do you feel about guests spending the night?',
          choices: [
            'Doesn\'t bother me',
            'Occasionally is fine, but not multiple nights',
            'Guests staying over regularly is fine',
            'I\'m not comfortable with guests staying over',
          ],
        ),
        const SizedBox(height: 24.0),
        const QuestionEntry(
          required: true,
          question: '8. When is noise acceptable?',
          choices: [
            'Any time of day and night',
            'During the day and evening, but not at night',
            'During the daytime only please',
            'I need the silence of a library',
          ],
        ),
        const SizedBox(height: 24.0),
        CustomButton(
          onTap: onTap,
          buttonText: 'Continue',
        ),
      ],
    );
  }
}

class FourthStage extends StatelessWidget {
  const FourthStage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.max,
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
          question: '10. Where do you want to live on campus?',
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
          onTap: onTap,
          buttonText: 'Continue',
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

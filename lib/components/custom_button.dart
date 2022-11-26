import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.color,
    this.disabled = false,
    this.loading = false,
  }) : super(key: key);

  final Function() onTap;
  final String buttonText;
  final bool disabled;
  final Color? color;
  final Color disabledColor = const Color.fromRGBO(144, 164, 174, 1);
  final bool loading;

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
            color: disabled ? disabledColor : color ?? colorScheme.primary,
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
                            style:
                                textTheme.button!.copyWith(color: Colors.white),
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

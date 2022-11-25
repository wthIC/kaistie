import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.label,
    required this.placeholder,
    this.required = false,
    this.obscureText = false,
    this.error = false,
    this.suffixIcon,
    this.editable = true,
    this.textInputType,
    this.numberOnly = false,
    this.inputFormatters,
    this.disableNext = false,
    this.initialValue = '',
  }) : super(key: key);

  final Function(String)? onChanged;
  final String? label;
  final String placeholder;
  final bool required;
  final IconButton? suffixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool editable;
  final bool error;
  final bool numberOnly;
  final String initialValue;
  final bool disableNext;

  static const _disabledFieldOpacity = 0.08;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final labelText = TextSpan(
      children: required
          ? <TextSpan>[
              TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ]
          : [
              TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(text: labelText),
        const SizedBox(height: 4.0),
        SizedBox(
          height: 56.0,
          child: TextFormField(
            textInputAction:
                disableNext ? TextInputAction.done : TextInputAction.next,
            keyboardType:
                textInputType ?? (numberOnly ? TextInputType.number : null),
            initialValue: initialValue,
            inputFormatters: inputFormatters,
            enabled: editable,
            obscureText: obscureText,
            style: textTheme.subtitle2!.copyWith(
              color: error ? colorScheme.error : colorScheme.onSurface,
            ),
            scrollPadding: const EdgeInsets.only(bottom: 80.0),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: error
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.error,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: colorScheme.onSurface,
                      ),
                    ),
              focusedBorder: error
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.error,
                      ),
                    )
                  : null,
              hintText: placeholder,
              hintStyle: textTheme.subtitle2!
                  .copyWith(color: colorScheme.onSurface.withOpacity(0.38)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              fillColor:
                  colorScheme.onSurface.withOpacity(_disabledFieldOpacity),
              filled: !editable,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

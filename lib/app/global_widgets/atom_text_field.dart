import 'package:flutter/material.dart';

import '../core/values/colors.dart';

class AtomTextField extends StatelessWidget {
  const AtomTextField({
    super.key,
    this.labelText = "",
    this.isObscureText = false,
    this.controller,
    this.onChanged,
    this.borderRadius = 0,
    this.borderColor,
    this.labelStyle = const TextStyle(color: primaryColor),
  });

  final TextStyle? labelStyle;
  final String labelText;
  final bool isObscureText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final double borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelStyle: labelStyle,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

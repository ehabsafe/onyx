import 'package:flutter/material.dart';
import 'package:onyx_delivery_service/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    required this.enabled,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final String hintText;

  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      child: TextFormField(
        obscureText: obscureText,
        enabled: enabled,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          filled: true,
          fillColor: textColor,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: textColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: textColor),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

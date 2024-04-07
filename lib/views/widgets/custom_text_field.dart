import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextInputType? input;
  final String? hintText;
  final Function(String)? onChanged;
  final bool? securedPassword;

  const CustomTextFormFiled({
    super.key,
    this.hintText,
    this.onChanged,
    this.securedPassword = false,
    this.input = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: input,
      obscureText: securedPassword!,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

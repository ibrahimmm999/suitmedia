import 'package:flutter/material.dart';
import 'package:suitmedia/shared/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 0, left: 20),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(defaultRadius)),
        hintText: widget.hint,
        filled: true,
        fillColor: white,
        hintStyle: lightGreyText,
      ),
    );
  }
}

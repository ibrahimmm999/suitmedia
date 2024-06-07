import 'package:flutter/material.dart';
import 'package:suitmedia/shared/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.function, required this.text});
  final Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: blue, borderRadius: BorderRadius.circular(defaultRadius)),
        child: Center(
          child: Text(
            text,
            style: whiteText,
          ),
        ),
      ),
    );
  }
}

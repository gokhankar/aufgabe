import 'package:aufgabe/constants.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback onPressed;
  const ButtonComponent({
    super.key,
    required this.width,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Text(
            title,
            style: sButtonText.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

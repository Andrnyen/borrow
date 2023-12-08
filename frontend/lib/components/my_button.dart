import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String message;
  final Function()? onTap;

  const MyButton({
    super.key, required this.onTap, required this.message
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.orange.shade200, 
          borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          ),
        ),
      )
    );
  }
}
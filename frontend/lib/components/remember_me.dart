import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool rememberMeCheck = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: rememberMeCheck, 
      onChanged: (bool? value) {
          setState(() {
            rememberMeCheck = value!;
          }
        );
      },
    );
  }
}
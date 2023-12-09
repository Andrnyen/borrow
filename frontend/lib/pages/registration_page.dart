import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/pages/auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  String? errorMessage = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final givenNameController = TextEditingController();
  final surnameController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              const Align(
                alignment: Alignment(-0.90, 0.0),
                child: BackButton(),
              ),

              // register
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),

              const SizedBox(height: 20,),

              // email
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // register button
              MyButton(
                onTap: createUserWithEmailAndPassword,
                message: 'Submit',
              ),
            ],
          )
        )
      )
    );
  }
}
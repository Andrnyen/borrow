import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final givenNameController = TextEditingController();
  final surnameController = TextEditingController();

  void userRegister() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                ),
              ),

              const SizedBox(height: 20,),

              // username
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
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

              // email
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // phone
              MyTextField(
                controller: phoneController,
                hintText: 'Phone',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // given name
              MyTextField(
                controller: givenNameController,
                hintText: 'Given name',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // surname
              MyTextField(
                controller: surnameController,
                hintText: 'Surname',
                obscureText: false,
              ),

              const SizedBox(height: 20,),

              // register button
              MyButton(
                onTap: userRegister,
                message: 'Submit',
              ),
            ],
          )
        )
      )
    );
  }
}
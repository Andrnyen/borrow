import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/components/remember_me.dart';
import 'package:frontend/components/square_tile.dart';
import 'package:frontend/pages/auth.dart';
import 'package:frontend/pages/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
    } on FirebaseAuthException catch(e) {
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
              const SizedBox(height: 40),

              // app name
              const Center(
                child: Text(
                  'Borrow',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // logo
              const Icon(
                Icons.lock,
                color: Colors.white,
                size: 90,
              ),
              
              const SizedBox(height: 30),

              // login
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  ),  
              ),

              const SizedBox(height: 10),

              // username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              
              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // remember me/forgot password?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RememberMe(),
                        Text(
                          'Remember Me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Your Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ),

              const SizedBox(height: 10),

              // sign in button
              MyButton(
                onTap: signInWithEmailAndPassword,
                message: 'Sign in',
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // google + apple sign in
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(height: 15),

                  // apple button
                  SquareTile(imagePath: 'lib/images/apple.png'),

                  SizedBox(height: 10,),

                  // facebook button
                  SquareTile(imagePath: 'lib/images/facebook.png'),
                ],
              ),

              const SizedBox(height: 40),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member?', 
                  style: TextStyle(color: Colors.white)
                  ),
                  const SizedBox(width: 4),

                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage(),))
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.orange.shade600, 
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  )
                ],
              ),
            ],
          )
        )
      )
    );
  }
}
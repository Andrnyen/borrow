import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/components/remember_me.dart';
import 'package:frontend/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {

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
              const SizedBox(height: 40),

              // app name
              const Center(
                child: Text(
                  'Borrow',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // logo
              const Icon(
                Icons.lock,
                size: 90,
              ),
              
              const SizedBox(height: 30),

              // login
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 30,
                  ),  
              ),

              const SizedBox(height: 10),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const RememberMe(),
                        Text(
                          'Remember Me',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Your Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                )
              ),

              const SizedBox(height: 10),

              // sign in button
              MyButton(
                onTap: signUserIn,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
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

                  SizedBox(height: 10),

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
                  Text('Not a member?', 
                  style: TextStyle(color: Colors.grey[700])
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue, 
                      fontWeight: FontWeight.bold,
                    ),
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
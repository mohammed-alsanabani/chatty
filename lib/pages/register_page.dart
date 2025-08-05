import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/text_form_field.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  void register(BuildContext context) {
    // log in
    final authService = AuthService();
    // check if passwords match
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        authService.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } // show error message if passwords don't match
    else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text('Passwords don\'t match')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: ListView(
            children: [
              SizedBox(height: 120),
              Icon(
                Icons.message,
                size: 65,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 50),
              Text(
                'Let\'s create an account for you',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(controller: _emailController, hintText: 'Email'),
              const SizedBox(height: 10),
              MyTextField(
                obscureText: true,
                controller: _passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 10),
              MyTextField(
                obscureText: true,
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 25),
              MyButton(onTap: () => register(context), text: 'Register'),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

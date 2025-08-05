import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/text_form_field.dart';
import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;

  void login(BuildContext context) async {
    final authService = AuthService();
    // log in
    try {
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
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
                'Welcome to Chatty Chatty',
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
              const SizedBox(height: 25),
              MyButton(onTap: () => login(context), text: 'Login'),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register now',
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

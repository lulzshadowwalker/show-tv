import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:showtv/util/show_image.dart';

class Login extends StatefulHookWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return FScaffold(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ShowImage.logo),
            const SizedBox(height: 36),
            FTextField.email(
              controller: emailController,
              hint: 'janedoe@foruslabs.com',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  (value) =>
                      (value?.contains('@') ?? false)
                          ? null
                          : 'Please enter a valid email.',
            ),
            const SizedBox(height: 10),
            FTextField.password(
              controller: passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  (value) =>
                      8 <= (value?.length ?? 0)
                          ? null
                          : 'Password must be at least 8 characters long.',
            ),
            const SizedBox(height: 20),
            FButton(
              label: const Text('Login'),
              onPress: () {
                if (!_formKey.currentState!.validate()) {
                  return; // Form is invalid.
                }

                // Form is valid, do something.
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don'
                  't have an account? ',
                ),
                Text('Register'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:forui/forui.dart';
import 'package:showtv/util/show_image.dart';

class Register extends StatefulHookWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmationController = useTextEditingController();

    return FScaffold(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ShowImage.logo),
            const SizedBox(height: 36),
            FTextField(
              label: const Text('Name'),
              controller: nameController,
              hint: 'John Doe',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  (value) =>
                      (value != '' && value != null)
                          ? null
                          : 'Please enter a name.',
            ),
            const SizedBox(height: 10),
            FTextField.email(
              controller: emailController,
              hint: 'janedoe@foruslabs.com',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator:
                  (value) =>
                      EmailValidator.validate(value ?? '')
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
            const SizedBox(height: 10),
            FTextField.password(
              controller: passwordConfirmationController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (8 > (value?.length ?? 0)) {
                  return 'Password must be at least 8 characters long.';
                }

                if (passwordController.value !=
                    passwordConfirmationController.value) {
                  return 'Passwords do not match.';
                }
              },
            ),
            const SizedBox(height: 20),
            FButton(
              label: const Text('Register'),
              onPress: () {
                if (!_formKey.currentState!.validate()) {
                  return; // Form is invalid.
                }

                // Form is valid, do something.
              },
            ),
            const FDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Already have an account? '), Text('Login')],
            ),
          ],
        ),
      ),
    );
  }
}

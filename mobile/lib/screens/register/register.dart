import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/errors/email_already_in_use_error.dart';
import 'package:showtv/providers/auth_repository_provider.dart';
import 'package:showtv/providers/profile_provider.dart';
import 'package:showtv/screens/home/home.dart';
import 'package:showtv/screens/login/login.dart';
import 'package:showtv/util/show_image.dart';

class Register extends StatefulHookConsumerWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmationController = useTextEditingController();
    final repository = ref.watch(authRepositoryProvider);
    final loading = useState(false);

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
              label: Text('Confirm Password'),
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
              prefix:
                  !loading.value
                      ? null
                      : SizedBox(
                        width: 12,
                        height: 12,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
              onPress:
                  loading.value
                      ? null
                      : () async {
                        if (!_formKey.currentState!.validate()) {
                          return; // Form is invalid.
                        }

                        try {
                          loading.value = true;
                          final token = await repository.register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                          );

                          await FlutterSecureStorage().write(
                            key: 'auth-token',
                            value: token,
                          );

                          ref.invalidate(profileProvider);

                          if (!context.mounted) return;
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                          print('registeration successful');
                        } catch (e) {
                          print(e);
                          if (!context.mounted) return;

                          if (e is EmailAlreadyInUseError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Email already in use.'),
                              ),
                            );
                            return;
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Something went wrong.'),
                            ),
                          );
                        } finally {
                          loading.value = false;
                        }
                      },
            ),
            const FDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

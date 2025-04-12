import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forui/forui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showtv/contracts/auth_repository.dart';
import 'package:showtv/errors/invalid_login_error.dart';
import 'package:showtv/providers/auth_repository_provider.dart';
import 'package:showtv/providers/profile_provider.dart';
import 'package:showtv/screens/home/home.dart';
import 'package:showtv/screens/register/register.dart';
import 'package:showtv/shared/show_loading_spinner/show_loading_spinner.dart';
import 'package:showtv/util/show_image.dart';

class Login extends StatefulHookConsumerWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
              prefix: !loading.value ? null : ShowLoadingSpinner(),
              label: const Text('Login'),
              onPress:
                  loading.value
                      ? null
                      : () async {
                        if (!_formKey.currentState!.validate()) {
                          return; // Form is invalid.
                        }

                        try {
                          loading.value = true;
                          final token = await repository.login(
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
                        } catch (e) {
                          print(e);
                          if (!context.mounted) return;

                          if (e is InvalidLoginError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Incorrect email or password',
                                ),
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
                Text(
                  'Don'
                  't have an account? ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

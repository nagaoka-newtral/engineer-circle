import 'package:auto_route/auto_route.dart';
import 'package:engineer_circle/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Appleでサインインする処理
              },
              icon: const Icon(Icons.apple),
              label: const Text('Sign in with Apple'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // Googleでサインインする処理
              },
              icon: const Icon(Icons.email),
              label: const Text('Sign in with Google'),
            ),
            TextButton(
              onPressed: () => context.router.push(const SignUpRoute()),
              child: const Text('ご登録がまだの方はこちら'),
            ),
          ],
        ),
      ),
    );
  }
}

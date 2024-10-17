import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/data/auth_providers.dart';
import 'package:godess/presentation/views/main_view.dart';
import 'package:godess/services/config.dart';
import 'package:godess/widgets/custom_elevatedbutton.dart';
import 'package:godess/widgets/custom_textfield.dart';

class LoginCard extends ConsumerStatefulWidget {
  final VoidCallback onSwitchToSignUp;

  const LoginCard({super.key, required this.onSwitchToSignUp});

  @override
  ConsumerState<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends ConsumerState<LoginCard> {
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  final ApiService apiService = ApiService();

  Future<void> _signIn() async {
    final fullName = fullnameController.text.trim();
    final password = passwordController.text;

    final authRepository = ref.read(authRepositoryProvider);

    if (!_validateInput(fullName, password)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await authRepository.signInUser(fullName, password);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('შესვლა წარმატებით დასრულდა!')),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _validateInput(String fullName, String password) {
    if (fullName.isEmpty) {
      setState(() {
        errorMessage = 'გთხოვთ, შეიყვანოთ თქვენი სრული სახელი.';
      });
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        errorMessage = 'პაროლი უნდა იყოს მინიმუმ 6 სიმბოლო.';
      });
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    fullnameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomRoundedTextField(
                  hintText: 'მომხმარებელი',
                  controller: fullnameController,
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
                const SizedBox(height: 15),
                CustomRoundedTextField(
                  controller: passwordController,
                  hintText: 'პაროლი',
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 16),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  const SizedBox(height: 10),
                CustomButton(
                  backgroundColor: const Color(0xFFAA925C),
                  onPressed: _signIn,
                  text: 'შესვლა',
                ),
                TextButton(
                  onPressed: widget.onSwitchToSignUp,
                  child: const Text(
                    "არ ხარ დარეგისტრირებული? შექმენი ანგარიში",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

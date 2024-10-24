import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:godess/data/auth_providers.dart';
import 'package:godess/presentation/views/main_view.dart';
import 'package:godess/widgets/custom_elevatedbutton.dart';
import 'package:godess/widgets/custom_textfield.dart';

class SignupCard extends ConsumerStatefulWidget {
  final VoidCallback onSwitchToSignIn;

  const SignupCard({super.key, required this.onSwitchToSignIn});

  @override
  ConsumerState<SignupCard> createState() => _SignupCardState();
}

class _SignupCardState extends ConsumerState<SignupCard> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final verificationCodeController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  Future<void> _signUp() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text;
    final fullName = fullNameController.text.trim();
    final verificationCode = verificationCodeController.text.trim();

    final authRepository = ref.read(authRepositoryProvider);

    if (!_validateInput(phone, password, fullName, verificationCode)) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await authRepository.registerUser(
          phone, password, fullName, verificationCode);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('რეგისტრაცია წარმატებით დასრულდა!')),
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

  bool _validateInput(
      String phone, String password, String fullName, String verificationCode) {
    if (fullName.isEmpty) {
      setState(() {
        errorMessage = 'გთხოვთ, შეიყვანოთ თქვენი სრული სახელი.';
      });
      return false;
    }
    if (phone.isEmpty || !_isValidPhoneNumber(phone)) {
      setState(() {
        errorMessage = 'გთხოვთ, შეიყვანოთ სწორი ტელეფონის ნომერი.';
      });
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      setState(() {
        errorMessage = 'პაროლი უნდა იყოს მინიმუმ 6 სიმბოლო.';
      });
      return false;
    }
    if (verificationCode.isEmpty || verificationCode.length != 4) {
      setState(() {
        errorMessage =
            'გთხოვთ, შეიყვანოთ მოქმედი 4-ნიშნა დამადასტურებელი კოდი.';
      });
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    verificationCodeController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  bool _isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^\d{12}$');
    return regex.hasMatch(phone);
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
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centers the content
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 30), // Add space between logo and fields
                CustomRoundedTextField(
                  controller: fullNameController,
                  hintText: 'მომხმარებლის სახელი/გვარი',
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
                const SizedBox(height: 15),
                CustomRoundedTextField(
                  hintText: 'ტელეფონის ნომერი',
                  controller: phoneController,
                  prefixIcon: const Icon(Icons.phone),
                ),
                const SizedBox(height: 15),
                CustomRoundedTextField(
                  controller: passwordController,
                  hintText: 'პაროლი',
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                CustomRoundedTextField(
                  controller: verificationCodeController,
                  hintText: 'დამადასტურებელი კოდი',
                  prefixIcon: const Icon(Icons.verified),
                ),
                const SizedBox(height: 10),
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
                  onPressed: _signUp,
                  text: 'რეგისტრაცია',
                ),
                const SizedBox(height: 10),
                // TabView centered with this button
                TextButton(
                  onPressed: widget.onSwitchToSignIn,
                  child: const Text(
                    "უკვე გაქვთ ანგარიში? შესვლა",
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

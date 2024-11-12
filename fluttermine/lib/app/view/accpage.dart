import 'package:flutter/material.dart';
import 'package:fluttermine/app/view/view.dart';
import 'package:get/get.dart';
import 'package:fluttermine/app/controller/AccountController.dart';

class SignupPage extends StatelessWidget {
  // final AccountController _accountController = Get.find();
  final AccountController _accountController = Get.put(AccountController());

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi untuk membuat akun
                _createAccount();

                // Pindah ke halaman LoginPage2
                Get.to(() => LoginPage2());
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void _createAccount() async {
    final userId = _userIdController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    if (userId.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty) {
      await _accountController.createAccount({
        'userId': userId,
        'email': email,
        'password': password,
        'name': name,
      });
      Get.snackbar('Success', 'Account created successfully');
    } else {
      Get.snackbar('Error', 'Please fill in all fields');
    }
  }
}

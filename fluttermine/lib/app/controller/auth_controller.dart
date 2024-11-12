import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermine/app/view/view.dart';
import 'package:get/get.dart';
// import 'package:fluttermine/app/view/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Cek status login saat controller diinisialisasi
  }

  Future<void> checkLoginStatus() async {
    isLoggedIn.value = _prefs.containsKey('user_token');
  }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage2()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Simpan token autentikasi
      _prefs.setString('user_token', _auth.currentUser!.uid);

      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      isLoggedIn.value = true; // Set status login menjadi true
      Get.offAllNamed(
          '/home'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAll(
        const LoginPage()); // Menghapus semua halaman dari tumpukan dan navigasi ke halaman
  }

//   void logout() async {
// await _auth.signOut();
// Get.offAll(LoginPage()); // Menghapus semua halaman dari tumpukan dan navigasi ke halaman login
// }
// }

  // void logout() {
  //   _prefs.remove('user_token'); // Hapus token autentikasi dari penyimpanan
  //   isLoggedIn.value = false; // Set status login menjadi false
  //   _auth.signOut(); // Sign out dari Firebase Authentication
  //   Get.offAllNamed(
  //       '/login'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
  // }
}

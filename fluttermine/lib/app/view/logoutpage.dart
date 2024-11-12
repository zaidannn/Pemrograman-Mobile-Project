import 'package:flutter/material.dart';
import 'package:fluttermine/app/controller/auth_controller.dart';
import 'package:get/get.dart';
// import 'package:fluttermine/app/view/view.dart';
// import 'package:get/get.dart';
// import 'package:fluttermine/app/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Konfirmasi Keluar'),
                        content: const Text('Yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _authController.logout();
                              Navigator.pop(context); // Tutup dialog
                            },
                            child: const Text('Ya, Keluar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Keluar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

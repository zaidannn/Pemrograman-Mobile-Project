// import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:fluttermine/app/view/view.dart';
// import 'package:fluttermine/app/view/konstan.dart';
import 'package:get/get.dart';
import 'dart:io';

// class LoginPageController {

class LoginController extends GetxController {
  final RxList<File> takenImages = <File>[].obs;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      takenImages.add(imageFile);
    }
  }
}

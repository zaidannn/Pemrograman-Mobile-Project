import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:fluttermine/app/view/view.dart';
// import 'package:fluttermine/app/controller/controller.dart';

class ListFotoPage extends StatelessWidget {
  final List<File> takenImages;

  const ListFotoPage({super.key, required this.takenImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Foto"),
      ),
      body: ListView.builder(
        itemCount: takenImages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Foto ${index + 1}"),
            leading: Image.file(takenImages[index]),
          );
        },
      ),
    );
  }
}

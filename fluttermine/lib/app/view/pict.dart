import 'package:flutter/material.dart';
import 'package:fluttermine/app/controller/picture.dart';
import 'package:fluttermine/app/controller/seepicture.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageWidget extends StatelessWidget {
  final UploadImageController controller = Get.put(UploadImageController());

  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                final pickedFile = await imagePicker.getImage(
                  source: ImageSource.gallery,
                );

                if (pickedFile != null) {
                  // Upload the picked image
                  controller.uploadImage(pickedFile.path);
                }
              },
              child: const Text('Pick and Upload Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the image viewer
                Get.to(() => const ImageViewer(
                    imageUrl:
                        'https://cloud.appwrite.io/v1/storage/buckets/65672b1faf5314f8e21c/files/65672bca030739473902/view?project=656718b72b103e7c5899&mode=admin'));
              },
              child: const Text('View Uploaded Image'),
            ),
          ],
        ),
      ),
    );
  }
}

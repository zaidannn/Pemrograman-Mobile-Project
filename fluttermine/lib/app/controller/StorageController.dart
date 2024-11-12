import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermine/app/controller/ClientController.dart';
import 'package:get/get.dart';

class StorageController extends ClientController {
  Storage? storage;
  @override
  void onInit() {
    super.onInit();
// appwrite
    storage = Storage(client);
  }

  Future storeImage() async {
    try {
      final result = await storage!.createFile(
        bucketId: '65672b1faf5314f8e21c',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path:
              "https://cloud.appwrite.io/v1/storage/buckets/65672b1faf5314f8e21c/files/65672bca030739473902/view?project=656718b72b103e7c5899&mode=admin",
          filename: "greesel.jpg",
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}

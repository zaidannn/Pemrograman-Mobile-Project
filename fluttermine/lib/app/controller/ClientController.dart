import 'package:appwrite/appwrite.dart';

import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();
// appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "656718b72b103e7c5899";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
// Import dio with an alias
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

class UploadImageController extends GetxController {
  late Client client;
  late Databases databases;
  late Storage storage;

  @override
  void onInit() {
    super.onInit();
    client = Client();
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "656718b72b103e7c5899";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);

    databases = Databases(client);
    storage = Storage(client);
  }

  Future<void> uploadImage(String imagePath) async {
    try {
      // Read the image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      // Resize image if needed
      final resizedBytes = resizeImage(imageBytes);

      // Create an InputFile object
      final inputFile =
          InputFile.fromBytes(filename: 'images.jpg', bytes: resizedBytes);

      // Upload the resized image to Appwrite storage
      final response = await storage.createFile(
        fileId: '55fyam', // Use your bucket ID here
        file: inputFile,
        bucketId: '65672b1faf5314f8e21c',
      );

      // Print the response to inspect its structure
      print('Response: $response');

      // Get the URL of the uploaded file from the response
      // String fileUrl = response.data['\$id']; // Adjust this based on the actual structure of the response

      // Now, you can save the file URL in your database or perform other operations
      print('Image uploaded successfully');
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  List<int> resizeImage(List<int> imageBytes) {
    // Resize the image if needed
    final image = img.decodeImage(Uint8List.fromList(imageBytes));

    if (image!.width > 800 || image.height > 800) {
      final resizedImage = img.copyResize(image, width: 800, height: 800);
      return img.encodeJpg(resizedImage);
    }

    return imageBytes;
  }
}

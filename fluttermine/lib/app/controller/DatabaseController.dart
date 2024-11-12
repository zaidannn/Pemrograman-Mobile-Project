import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:get/get.dart';
import 'package:fluttermine/app/controller/ClientController.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  List<Map<String, dynamic>> documents = [];
  String databaseId = "1ayam"; // Sesuaikan dengan ID database Appwrite Anda
  String collectionId =
      "11ayam"; // Sesuaikan dengan ID collection Appwrite Anda

  @override
  void onInit() {
    super.onInit();
    print(
        'DatabaseController initialized with databaseId: $databaseId, collectionId: $collectionId');
    databases = Databases(client);
  }

  Future<void> createDocument(Map<String, dynamic> data) async {
    try {
      print(
          'Creating document in databaseId: $databaseId, collectionId: $collectionId');
      final result = await databases!.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        data: data,
        documentId: '',
      );
      print("Document created successfully: $result");
    } catch (error) {
      print("Error creating document: $error");
    }
  }

  Future<List<Map<String, dynamic>>> getAllDocuments() async {
    try {
      print(
          'Fetching documents from databaseId: $databaseId, collectionId: $collectionId');
      final response = await databases!.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
      );

      documents = response.documents
          .map<Map<String, dynamic>>(
              (dynamic doc) => (doc as Document).data)
          .toList();

      return documents;
    } catch (error) {
      print("Error getting documents: $error");
      return [];
    }
  }

  Future<void> updateDocument(
      String documentId, Map<String, dynamic> updatedData) async {
    try {
      await databases!.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: updatedData,
      );
      print("Document updated successfully");
    } catch (error) {
      print("Error updating document: $error");
    }
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      await databases!.deleteDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: documentId,
      );
      print("Document deleted successfully");
    } catch (error) {
      print("Error deleting document: $error");
    }
  }

  Future<void> deleteDocumentByTitleAndAuthor(
      String title, String author) async {
    try {
      final response = await databases!.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
      );

      for (var document in response.documents) {
        // Convert Document to Map
        var documentData = (document).data;

        if (documentData['title'] == title &&
            documentData['author'] == author) {
          await databases!.deleteDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentData['\$id'],
          );
          print("Document deleted successfully");
          return;
        }
      }

      print("Document not found");
    } catch (error) {
      print("Error deleting document: $error");
    }
  }
}

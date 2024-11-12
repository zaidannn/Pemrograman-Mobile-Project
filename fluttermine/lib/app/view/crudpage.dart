// Import necessary packages and classes
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttermine/app/controller/DatabaseController.dart';

class CrudScreen extends StatelessWidget {
  final DatabaseController databaseController = Get.find();

  const CrudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 201, 255),
      appBar: AppBar(
        title: const Text('Profile user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Navigate to CreateScreen
                await Get.to(
                    () => CreateScreen(databaseController: databaseController));
              },
              child: const Text('Tambah data'),
            ),
            const SizedBox(height: 16.0), // Add spacing between buttons
            ElevatedButton(
              onPressed: () async {
                // Fetch and display documents from the database
                await databaseController.getAllDocuments();
                // Navigate to ReadScreen
                await Get.to(
                    () => ReadScreen(databaseController: databaseController));
              },
              child: const Text('Lihat data'),
            ),
            const SizedBox(height: 16.0), // Add spacing between buttons
            ElevatedButton(
              onPressed: () async {
                // Navigate to UpdateScreen
                await Get.to(
                    () => UpdateScreen(databaseController: databaseController));
              },
              child: const Text('Ubah data'),
            ),
            const SizedBox(height: 16.0), // Add spacing between buttons
            ElevatedButton(
              onPressed: () async {
                // Navigate to DeleteScreen
                await Get.to(
                    () => DeleteScreen(databaseController: databaseController));
              },
              child: const Text('Hapus data'),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateScreen extends StatelessWidget {
  final DatabaseController databaseController;

  CreateScreen({super.key, required this.databaseController});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Create a document in the database
                await databaseController.createDocument({
                  'title': titleController.text,
                  'author': authorController.text,
                });
                // Navigate back to the previous screen
                Get.back();
              },
              child: const Text('Tambahkan data'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadScreen extends StatelessWidget {
  final DatabaseController databaseController;

  // Constructor
  const ReadScreen({super.key, required this.databaseController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Data'),
      ),
      body: FutureBuilder(
        // Menggunakan FutureBuilder untuk menunggu data diambil dari Appwrite
        future: databaseController.getAllDocuments(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Menampilkan widget loading jika masih dalam proses pengambilan data
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Menampilkan pesan error jika terjadi kesalahan
            return Text('Error: ${snapshot.error}');
          } else {
            // Menampilkan data setelah berhasil diambil
            var documents = snapshot.data!;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var document = documents[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${document['title']}'),
                        Text('Author: ${document['author']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class UpdateScreen extends StatelessWidget {
  final DatabaseController databaseController;

  UpdateScreen({super.key, required this.databaseController});

  final TextEditingController updatedTitleController = TextEditingController();
  final TextEditingController updatedAuthorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: updatedTitleController,
              decoration: const InputDecoration(labelText: 'Updated Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: updatedAuthorController,
              decoration: const InputDecoration(labelText: 'Updated Author'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Update a document in the database
                await databaseController.updateDocument(
                  '6576c9a80ed0f9cbb2c6', //documentId
                  {
                    'title': updatedTitleController.text,
                    'author': updatedAuthorController.text,
                  },
                );

                Get.back();
              },
              child: const Text('Mengubah data'),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteScreen extends StatelessWidget {
  final DatabaseController databaseController;

  DeleteScreen({super.key, required this.databaseController});

  final TextEditingController titleToDeleteController = TextEditingController();
  final TextEditingController authorToDeleteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hapus data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleToDeleteController,
              decoration: const InputDecoration(labelText: 'Title to Delete'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: authorToDeleteController,
              decoration: const InputDecoration(labelText: 'Author to Delete'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Delete a document from the database
                await databaseController.deleteDocumentByTitleAndAuthor(
                  titleToDeleteController.text,
                  authorToDeleteController.text,
                );
                // Navigate back to the previous screen
                Get.back();
              },
              child: const Text('Menghapus data'),
            ),
          ],
        ),
      ),
    );
  }
}

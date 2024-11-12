import 'package:flutter/material.dart';
import 'package:fluttermine/app/view/CountryPages.dart';
import 'package:fluttermine/app/view/JobPages.dart';

class ApiWidget extends StatelessWidget {
  const ApiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobListWidget()),
                );
              },
              child: const Text('View Job Data'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CountryListWidget()),
                );
              },
              child: const Text('View Country Data'),
            ),
          ],
        ),
      ),
    );
  }
}

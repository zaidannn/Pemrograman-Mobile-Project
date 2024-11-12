import 'package:flutter/material.dart';
import 'package:fluttermine/app/controller/http.dart';
// Import the http package
import 'package:fluttermine/app/controller/ApiService.dart';
import 'package:fluttermine/app/model/job.dart';

class JobListWidget extends StatefulWidget {
  const JobListWidget({super.key});

  @override
  _JobListWidgetState createState() => _JobListWidgetState();
}

class _JobListWidgetState extends State<JobListWidget> {
  // Create an instance of http.Client
  final JobService jobService = JobService(client: RealHttpClient());
  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = jobService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job List'),
      ),
      body: FutureBuilder<Data>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.results.length,
              itemBuilder: (context, index) {
                Result job = snapshot.data!.results[index];
                return ListTile(
                  title: Text(job.title),
                  subtitle: Text(job.company.displayName),
                  onTap: () {
                    // Do something when the ListTile is tapped
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

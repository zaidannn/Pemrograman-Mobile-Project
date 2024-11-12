import 'package:flutter/material.dart';
import 'package:fluttermine/app/controller/CountryService.dart';
import 'package:fluttermine/app/model/Country.dart';
import 'package:fl_chart/fl_chart.dart';

class CountryListWidget extends StatefulWidget {
  const CountryListWidget({super.key});

  @override
  _CountryListWidgetState createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  final CountryService countryService = CountryService();
  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = countryService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
      ),
      body: FutureBuilder<Data>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Monthly Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height:
                        300, // Set a specific height to avoid infinite size issues
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: snapshot.data!.month.values
                                .reduce((a, b) => a > b ? a : b) +
                            100,
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(showTitles: true),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            rotateAngle: 45,
                            margin: 16,
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups: _buildBarGroups(snapshot.data!.month),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(Map<String, double> monthData) {
    return monthData.keys
        .toList()
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  y: monthData[entry.value]!,
                  colors: [Colors.red],
                ),
              ],
            ))
        .toList();
  }
}

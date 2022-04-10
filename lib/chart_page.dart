import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/chart/pie_chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Page'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomPaint(
              size: Size(150, 150),
              painter: PieChart(
                percentage: 30,
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

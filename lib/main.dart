import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/chart_page.dart';
import 'package:flutter_custom_painter/my_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChartPage(),
    );
  }
}

class PainterPage extends StatelessWidget {
  const PainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('custom painter'),
      ),
      body: SizedBox(
        width: 300,
        height: 300,
        child: CustomPaint(
          size: const Size(200, 200), // 위젯의 크기를 정한다.
          foregroundPainter: MyPainter(), // painter에 그리기를 담당할 클래스를 넣는다.
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

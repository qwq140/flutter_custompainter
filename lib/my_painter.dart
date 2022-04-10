import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 사용
        ..color = Colors.deepPurpleAccent // 색
        ..strokeCap = StrokeCap.round // 선의 끝을 둥글게
        ..strokeWidth = 4.0; // 선의 굵기

    Offset p1 = const Offset(0.0, 0.0); // 선을 그리기 위한 좌표값
    Offset p2 = Offset(size.width, size.height);

    canvas.drawLine(p1, p2, paint); // 선을 그림
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
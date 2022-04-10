import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter{

  int percentage = 0;
  double textScaleFactor = 1.0;

  PieChart({required this.percentage,required this.textScaleFactor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = Colors.orangeAccent
        ..strokeWidth = 10.0 // 선의 길이
        ..style = PaintingStyle.stroke // 선의 스타일, stroke : 외곽만 그림, fill : 안까지 채움
        ..strokeCap = StrokeCap.round; // stroke의 스타일을 정한다.

    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth / 2); // 원의 반지름을 구한다. 선의 굵기에 영향을 받지 않게
    Offset center = Offset(size.width / 2, size.height / 2); // 원이 위젯의 가운데에 그려질 수 있도록 좌표 설정

    canvas.drawCircle(center, radius, paint); // 원을 그린다.

    double arcAngle = 2 * pi * (percentage / 100); // 호(arc)의 각도를 정한다.
    paint.color = Colors.deepPurpleAccent; // 호의 색상 ㅣㅈ정
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), - pi / 2, arcAngle, false, paint); // 12시에서 시작하기 위해 - pi / 2 (-90도)

    drawText(canvas, size, "$percentage / 100");
  }

  // 원의 중앙에 텍스트 적음
  // CustomPainter 에 텍스트를 적기위해서는 TextPainter 를 사용해야 한다.
  // TextPainter 는 텍스트의 좌표를 정하는데 사용한다.
  // TextPainter 를 사용할 때는 layout() 함수를 호출해줘야 한다. (텍스트의 크기와 방향을 알려준다.)
  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);
    TextSpan sp = TextSpan(style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black), text: text); // TextSpan은 Text위젯과 거의 동일하다.
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout(); // 필수! 텍스트 페인터에 그려질 텍스트의 크기와 방향를 정함.
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  // 화면 크기에 비례하여 텍스트 폰트 크기 정함
  // 텍스트의 길이가 길어지면 원 내부 공간을 넘어설 수 있으므로 텍스트의 길이에 따라 폰트 크기 설정
  double getFontSize(Size size, String text){
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
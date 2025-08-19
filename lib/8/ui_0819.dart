import 'package:flutter/material.dart';

class MyHome0819 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.green[100],
            child: CustomPaint(painter: MyPainter1()),
          ),
        ],
      ),
    );
  }
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter1 extends CustomPainter {
  /// 직접 뭔가 그릴 때!
  @override
  void paint(Canvas canvas, Size size) {
    // Size 객체 : 가로, 세[로 정보만 담고있는 객체
    print(size);
    // Canvas : 할당받은 크기의 영역 내에서 자유롭게 그릴 수 있는 객체, 그리기 위한 여러가지 메서드가 포함!
    // canvas.drawArc : 원을 그릴 때
    // canvas.drawLine : 선을 그릴 때
    // drawLine : 시작점, 끝점, 그릴 페인트 => 파라미터!
    // 시작점 & 끝점 => Offset 객체 =>
    final p1 = Paint();
    // Paint : 붓, 색상, 끝을 둥글게 할 지, 두께 등의 정보 입력
    p1.strokeWidth = 5;
    p1.color = Colors.amber;

    final maxX = size.width;
    final maxY = size.height;
    // canvas.drawLine(Offset(0, 0), Offset(maxX, 0), p1);
    // canvas.drawLine(Offset(maxX, 0), Offset(maxX, maxY), p1);
    // canvas.drawLine(Offset(maxX, maxY), Offset(30, maxY), p1);
    // canvas.drawLine(Offset(30, maxY), Offset(30, 50), p1);
    // canvas.drawLine(Offset(30, 50), Offset(0, 0), p1);

    // Path 그릴 때, 도형이 아닌 선을 그리고 싶을 때 PaintingStyle.stroke 사용
    p1.style = PaintingStyle.fill;

    final path = Path();
    double radius = 20;
    // 그리는 점을 이동! => 그림그릴 때, 그리기 전 손을 이동하는것과 같은 행동
    path.moveTo(0, 0);
    path.lineTo(maxX - radius, 0);
    // 현재 위치는 (maxX - 50, 0)
    // (x2, y2) => (maxX, 50) 까지 선을 그릴건데
    // (x1, y1) => (maxX, 0) 을 기준으로 선을 왜곡(휘게) 시켜줌
    path.quadraticBezierTo(maxX, 0, maxX, radius);

    path.lineTo(maxX, maxY - radius);
    path.quadraticBezierTo(maxX, maxY, maxX - radius, maxY);
    path.lineTo(80, maxY);
    path.quadraticBezierTo(30, maxY, 30, maxY - radius);
    path.lineTo(30, 30);
    path.lineTo(0, 0);

    canvas.drawPath(path, p1);
  }

  /// MyPainter의 속성이 바뀌었을 때
  ///
  /// 다시 그릴지 여부
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

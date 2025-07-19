import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LineChartPainter(),
      child: Container(),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> points = [120, 180, 140, 200, 170, 150, 190];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B4513)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()..color = const Color(0xFF8B4513);

    double stepX = size.width / (points.length - 1);
    double maxY = points.reduce((a, b) => a > b ? a : b);

    Path path = Path();

    for (int i = 0; i < points.length; i++) {
      double x = i * stepX;
      double y = size.height - (points[i] / maxY * size.height);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      canvas.drawCircle(Offset(x, y), 4, dotPaint);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

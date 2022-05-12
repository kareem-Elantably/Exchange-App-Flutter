import 'package:flutter/material.dart';

class bg_shape3 extends StatefulWidget {
  @override
  _bg_shape3 createState() => _bg_shape3();
}

class _bg_shape3 extends State<bg_shape3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(800,
            300.toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 12, 242, 180)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5784000, 0);
    path0.lineTo(size.width * 0.9990000, size.height * 0.0020000);
    path0.quadraticBezierTo(size.width * 0.9997500, size.height * 0.2882000,
        size.width, size.height * 0.3836000);
    path0.cubicTo(
        size.width * 0.9202000,
        size.height * 0.0669000,
        size.width * 0.7851500,
        size.height * 0.0455000,
        size.width * 0.5784000,
        0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

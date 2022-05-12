import 'package:flutter/material.dart';

class bg_shape extends StatefulWidget {
  @override
  _bg_shape createState() => _bg_shape();
}

class _bg_shape extends State<bg_shape> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(400,
            200.toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
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
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0019300, size.height * 0.8375000);
    path0.quadraticBezierTo(size.width * 0.4683351, size.height * 1.1278333,
        size.width * 1.0013798, size.height * 0.8347333);
    path0.lineTo(size.width * 1.0019841, size.height * 0.0100000);
    path0.quadraticBezierTo(size.width * 0.6449765, size.height * 0.5956667, 0,
        size.height * 0.2733333);
    path0.cubicTo(
        size.width * -0.033550,
        size.height * 0.5676000,
        size.width * -0.0119949,
        size.height * 0.3500000,
        size.width * 0.0019300,
        size.height * 0.8375000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

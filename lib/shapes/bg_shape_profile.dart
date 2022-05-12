import 'package:flutter/material.dart';

class bg_shape_profile extends StatefulWidget {
  @override
  _bg_shape_profile createState() => _bg_shape_profile();
}

class _bg_shape_profile extends State<bg_shape_profile> {
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
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(
        0, size.height * 0.4365000, 0, size.height * 0.5820000);
    path0.quadraticBezierTo(size.width * 0.5029900, size.height * 1.4172500,
        size.width, size.height * 0.5820500);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

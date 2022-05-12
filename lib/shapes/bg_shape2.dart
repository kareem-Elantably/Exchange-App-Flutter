import 'package:flutter/material.dart';

class bg_shape2 extends StatefulWidget {
  @override
  _bg_shape2 createState() => _bg_shape2();
}

class _bg_shape2 extends State<bg_shape2> {
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
    path0.moveTo(size.width * 0.4972000, 0);
    path0.quadraticBezierTo(size.width * 1.0073000, size.height * 0.0827547,
        size.width * 1.0083800, size.height * 0.3608516);
    path0.quadraticBezierTo(size.width * 0.5024400, size.height * 0.7687263, 0,
        size.height * 0.7175375);
    path0.cubicTo(
        size.width * 0.0020950,
        size.height * 0.7690154,
        size.width * -0.2271200,
        size.height * 1.0078297,
        size.width * 0.0083800,
        size.height * 1.0134491);
    path0.quadraticBezierTo(size.width * 1.4223800, size.height * 1.0338037,
        size.width * 1.0083800, size.height * 2.7641983);
    path0.lineTo(size.width * 1.0083800, size.height * -0.0017857);
    path0.quadraticBezierTo(size.width * 0.7718000, size.height * -0.0098027,
        size.width * 0.4972000, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

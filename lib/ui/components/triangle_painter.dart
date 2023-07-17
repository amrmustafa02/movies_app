import 'package:flutter/material.dart';

class TriangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  TriangleTabIndicator({required Color color, required double radius})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  late Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset triangleOffset =
        offset;
    var path = Path();

    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.lineTo(triangleOffset.dx + 14, triangleOffset.dy - 18);
    path.lineTo(triangleOffset.dx - 14, triangleOffset.dy - 18);
    path.close();

    canvas.drawPath(path, _paint);
  }
}

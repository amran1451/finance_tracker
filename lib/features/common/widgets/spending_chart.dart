import 'package:flutter/material.dart';

class SpendingChart extends StatelessWidget {
  const SpendingChart({
    required this.planned,
    required this.unplanned,
    super.key,
  });

  final double planned;
  final double unplanned;

  @override
  Widget build(BuildContext context) {
    final total = (planned + unplanned).clamp(1, double.infinity);
    final plannedPct = planned / total;
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0, end: plannedPct),
      builder: (context, value, child) {
        return CustomPaint(
          size: const Size.square(120),
          painter: _RingPainter(planned: value, unplanned: 1 - value),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.planned, required this.unplanned});

  final double planned;
  final double unplanned;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 12.0;
    final rect = Offset.zero & size;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    paint.color = Colors.blue;
    canvas.drawArc(rect.deflate(strokeWidth / 2), -1.57, planned * 6.28, false, paint);
    paint.color = Colors.deepPurple;
    canvas.drawArc(rect.deflate(strokeWidth / 2), -1.57 + planned * 6.28, unplanned * 6.28, false, paint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.planned != planned || oldDelegate.unplanned != unplanned;
  }
}

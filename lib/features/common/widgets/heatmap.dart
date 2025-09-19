import 'package:flutter/material.dart';

class SpendingHeatmap extends StatelessWidget {
  const SpendingHeatmap({
    required this.values,
    super.key,
  });

  final Map<DateTime, double> values;

  @override
  Widget build(BuildContext context) {
    final days = List.generate(30, (index) => DateTime.now().subtract(Duration(days: index)));
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: days
          .map(
            (day) => Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: _colorForValue(values[day] ?? 0, context),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )
          .toList(),
    );
  }

  Color _colorForValue(double value, BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (value == 0) return scheme.surfaceVariant;
    if (value < 1000) return scheme.primary.withOpacity(0.3);
    if (value < 3000) return scheme.primary.withOpacity(0.6);
    return scheme.primary;
  }
}

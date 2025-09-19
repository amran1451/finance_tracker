import 'package:flutter/material.dart';

class PeriodPill extends StatelessWidget {
  const PeriodPill({
    required this.title,
    required this.dateRange,
    super.key,
  });

  final String title;
  final String dateRange;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.calendar_today_outlined, size: 18),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          Text(dateRange, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

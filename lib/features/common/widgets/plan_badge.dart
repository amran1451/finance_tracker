import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class PlanBadge extends StatelessWidget {
  const PlanBadge({
    required this.planned,
    super.key,
  });

  final bool planned;

  @override
  Widget build(BuildContext context) {
    final color = planned ? AppColors.planBlue : AppColors.unplannedAmber;
    final label = planned ? 'Planned' : 'Unplanned';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}

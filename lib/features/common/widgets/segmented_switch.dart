import 'package:flutter/material.dart';

class SegmentedSwitch<T> extends StatelessWidget {
  const SegmentedSwitch({
    required this.options,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final Map<T, String> options;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: options.entries
          .map(
            (entry) => ChoiceChip(
              label: Text(entry.value),
              selected: entry.key == value,
              onSelected: (_) => onChanged(entry.key),
            ),
          )
          .toList(),
    );
  }
}

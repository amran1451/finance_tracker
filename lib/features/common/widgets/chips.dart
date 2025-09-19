import 'package:flutter/material.dart';

class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({
    required this.items,
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final List<String> items;
  final Set<String> selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: items
          .map(
            (item) => FilterChip(
              label: Text(item),
              selected: selected.contains(item),
              onSelected: (_) => onChanged(item),
            ),
          )
          .toList(),
    );
  }
}

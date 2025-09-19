import 'package:flutter/material.dart';

class AmountKeyboard extends StatelessWidget {
  const AmountKeyboard({
    required this.onInput,
    super.key,
  });

  final ValueChanged<String> onInput;

  @override
  Widget build(BuildContext context) {
    final quickButtons = [100, 500, 1000];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: quickButtons
              .map(
                (value) => FilledButton.tonal(
                  onPressed: () => onInput(value.toString()),
                  child: Text('+$value'),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: List.generate(12, (index) {
            String label;
            if (index < 9) {
              label = '${index + 1}';
            } else if (index == 9) {
              label = '.';
            } else if (index == 10) {
              label = '0';
            } else {
              label = '⌫';
            }
            return ElevatedButton(
              onPressed: () => onInput(label),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              child: Text(label),
            );
          }),
        ),
      ],
    );
  }
}

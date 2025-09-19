class Validators {
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required field';
    }
    return null;
  }

  static bool isNumeric(String input) {
    final sanitized = input.replaceAll(RegExp(r'[^0-9.,kK]'), '');
    return double.tryParse(sanitized.replaceAll(',', '.')) != null;
  }
}

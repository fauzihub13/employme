extension StringExt on String {
  int get toIntegerFromText {
    final cleanedText = replaceAll(RegExp(r'[^0-9]'), '');
    final parsedValue = int.tryParse(cleanedText) ?? 0;
    return parsedValue;
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

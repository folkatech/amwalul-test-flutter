import 'package:intl/intl.dart';

import 'locale_utils.dart';

class NumberUtils {
  static String getRupiahFormat(double number) {
    final numberFormat = NumberFormat.simpleCurrency(
      locale: LocaleUtils.localeIndonesia,
    );

    return numberFormat.format(number);
  }

  static double normalize({
    required double value,
    required double min,
    required double max,
  }) {
    final normalizedValue = (value - min) / (max - min);
    return (normalizedValue > 1) ? 1 : (normalizedValue < 0) ? 0 : normalizedValue;
  }

  static double normalizeReversed({
    required double value,
    required double min,
    required double max,
  }) {
    final normalizedValue = (max - value) / (max - min);
    return (normalizedValue > 1) ? 1 : (normalizedValue < 0) ? 0 : normalizedValue;
  }
}

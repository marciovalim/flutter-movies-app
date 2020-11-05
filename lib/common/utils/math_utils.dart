class MathUtils {
  static int loopIndex(int index, int length) {
    final fraction = index / length;
    final decimalPart = fraction - fraction.truncate();
    final result = (decimalPart * length).round();
    return result;
  }
}

extension MathUtilsExtensions on int {
  loop(int length) {
    return MathUtils.loopIndex(this, length);
  }
}

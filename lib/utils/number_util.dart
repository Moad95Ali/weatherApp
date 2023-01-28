class NumberUtil {
  static String fixNumber(num? temp) {
    return temp?.toStringAsFixed(1) ?? "";
  }
}

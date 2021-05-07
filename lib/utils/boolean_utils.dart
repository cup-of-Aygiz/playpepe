class BoolUtils {
  /// (not A) or B  ===  A implies B
  /// binary map for a, b and result
  /// | a | b | result |
  /// | 0 | 0 |   1    |
  /// | 0 | 1 |   1    |
  /// | 1 | 0 |   0    |
  /// | 1 | 1 |   1    |
  static bool implies(bool a, bool b) => !a || b;
}
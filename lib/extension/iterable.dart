extension IterableGroupBy<S> on Iterable<S> {
  Map<T, List<S>> groupBy<T>(T Function(S) key) {
    final map = <T, List<S>>{};
    for (final element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }
}

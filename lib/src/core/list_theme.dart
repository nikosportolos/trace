import 'package:ansix/ansix.dart';

class ListItemTheme {
  const ListItemTheme(
    this.symbol, {
    this.foregroundColor = AnsiColor.none,
  });

  final String symbol;
  final AnsiColor foregroundColor;

  static const Map<int, ListItemTheme> $defaultTheme = <int, ListItemTheme>{
    0: ListItemTheme('>'),
    1: ListItemTheme('─'),
    2: ListItemTheme('*'),
    3: ListItemTheme('○'),
    4: ListItemTheme('■'),
    5: ListItemTheme('•'),
  };
}

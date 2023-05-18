import 'package:ansix/ansix.dart';
import 'package:trace/src/core/level.dart';

typedef FormatterTheme = Map<LogLevel, FormatTheme>;

class FormatTheme {
  FormatTheme({
    required this.timestampTheme,
    required this.levelTheme,
    required this.messageTheme,
    required this.errorTheme,
    required this.stacktraceTheme,
  });

  final AnsiTextTheme timestampTheme;
  final AnsiTextTheme levelTheme;
  final AnsiTextTheme messageTheme;
  final AnsiTextTheme errorTheme;
  final AnsiTextTheme stacktraceTheme;

  factory FormatTheme.defaultTheme({
    final AnsiColor foregroundColor = AnsiColor.none,
  }) {
    final AnsiTextTheme baseTheme = AnsiTextTheme(
      foregroundColor: foregroundColor,
      fixedWidth: 30,
    );
    return FormatTheme(
      timestampTheme: baseTheme,
      levelTheme: baseTheme.copyWith.fixedWidth(10),
      messageTheme: baseTheme,
      errorTheme: baseTheme.copyWith.style(
        const AnsiTextStyle(bold: true),
      ),
      stacktraceTheme: baseTheme,
    );
  }
}

part of 'section.dart';

/// **LevelFormatter**
///
/// Formats [LogLevel] input with Ansi formatter.
class LevelFormatter extends LogSectionFormatter {
  const LevelFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      entry.level.name.toUpperCase(),
      theme[entry.level]?.levelTheme ?? FormatTheme.defaultTheme.levelTheme,
    ).toString();
  }
}

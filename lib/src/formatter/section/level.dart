part of 'section.dart';

/// **LevelFormatter**
///
/// Formats [LogLevel] input with Ansi formatter.
class LevelFormatter extends LogSectionFormatter {
  const LevelFormatter();

  @override
  String format(final LoggerTheme theme, final LogEntry entry) {
    return AnsiText.withTheme(
      entry.level.name.toUpperCase(),
      getTextThemeForSection(theme, entry.level, LogSection.level),
    ).formattedText;
  }
}

part of 'section.dart';

/// **TimestampFormatter**
///
/// Formats [Timestamp] input with Ansi formatter.
class TimestampFormatter extends LogSectionFormatter {
  const TimestampFormatter();

  @override
  String format(final LoggerTheme theme, final LogEntry entry) {
    return AnsiText.withTheme(
      DateTimeFormat.format(entry.timestamp, format: theme.timestampFormat),
      getTextThemeForSection(theme, entry.level, LogSection.timestamp),
    ).formattedText;
  }
}

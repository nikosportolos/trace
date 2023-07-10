part of 'section.dart';

/// **TimestampFormatter**
///
/// Formats [Timestamp] input with Ansi formatter.
class TimestampFormatter extends LogSectionFormatter {
  const TimestampFormatter({
    required super.theme,
    this.timestampFormat = r'Y/m/d H:i:s.vu',
  });

  final String timestampFormat;

  @override
  String format(final LogEntry entry) {
    return AnsiText.withTheme(
      DateTimeFormat.format(entry.timestamp, format: timestampFormat),
      theme[entry.level]?.timestampTheme ?? FormatTheme.defaultTheme.timestampTheme,
    ).toString();
  }
}

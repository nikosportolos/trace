part of 'section.dart';

/// **MessageFormatter**
///
/// Formats [Message] input with Ansi formatter.
class MessageFormatter extends LogSectionFormatter {
  const MessageFormatter();

  @override
  String format(final LoggerTheme theme, final LogEntry entry) {
    if (entry.message == null && entry.error == null && entry.stacktrace == null) {
      return '';
    }

    final StringBuffer buffer = StringBuffer();
    buffer.write(entry.message);

    if (entry.error != null) {
      buffer.writeln();
      buffer.writeSpaces(theme.stacktraceIndent);
      buffer.write(entry.error);
    }

    if (entry.stacktrace != null) {
      buffer.writeln();
      buffer.write(
        entry.stacktrace
            .toString()
            .split(AnsiEscapeCodes.newLine)
            .map((String s) => '${' ' * theme.stacktraceIndent}$s')
            .join(AnsiEscapeCodes.newLine),
      );
    }

    return AnsiText.withTheme(
      buffer.toString(),
      getTextThemeForSection(theme, entry.level, LogSection.message),
    ).formattedText;
  }
}

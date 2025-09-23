part of 'section.dart';

/// **MessageFormatter**
///
/// Formats [Message] input with Ansi formatter.
class MessageFormatter extends LogSectionFormatter {
  const MessageFormatter({
    final bool? showError,
    final bool? showStackTrace,
    final bool? showData,
  }) : showError = showError ?? true,
       showStackTrace = showStackTrace ?? true,
       showData = showData ?? true;

  final bool showError;
  final bool showStackTrace;
  final bool showData;

  @override
  String format(final LoggerTheme theme, final LogEntry entry) {
    if (entry.isEmpty) {
      return '';
    }

    final StringBuffer buffer = StringBuffer();

    if (entry.message != null) {
      buffer.write(entry.message);
    }

    if (entry.error != null && showError) {
      if (entry.message != null) {
        buffer
          ..writeln()
          ..writeSpaces(theme.stacktraceIndent);
      }
      buffer.write(entry.error);
    }

    if (entry.stacktrace != null && showStackTrace) {
      final List<String> lines = entry.stacktrace
          .toString()
          .split(AnsiEscapeCodes.newLine)
          .where((String s) => s.isNotEmpty)
          .toList(growable: false);

      buffer.writeln();
      for (int i = 0; i < lines.length; i++) {
        buffer.write('${' ' * theme.stacktraceIndent}${lines[i]}');
        if (i < lines.length - 1) {
          buffer.write(AnsiEscapeCodes.newLine);
        }
      }
    }

    if (showData && entry.data.isNotEmpty) {
      buffer
        ..writeln()
        ..writeSpaces(theme.stacktraceIndent)
        ..write(
          const JsonEncoder.withIndent('  ')
              .convert(entry.data)
              .replaceAll('\n', '\n${' ' * theme.stacktraceIndent}'),
        );
    }

    return AnsiText.withTheme(
      buffer.toString(),
      getTextThemeForSection(theme, entry.level, LogSection.message),
    ).formattedText;
  }
}

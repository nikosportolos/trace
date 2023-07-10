part of 'section.dart';

/// **StacktraceFormatter**
///
/// Formats [StackTrace] input with Ansi formatter.
class StacktraceFormatter extends LogSectionFormatter {
  const StacktraceFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.stacktrace == null) {
      return '';
    }

    return AnsiText.withTheme(
      '\n\t${entry.stacktrace.toString().replaceAll('\n', '\n\t')}',
      theme[entry.level]?.stacktraceTheme ?? FormatTheme.defaultTheme.stacktraceTheme,
    ).toString();
  }
}

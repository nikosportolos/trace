part of 'section.dart';

/// **ErrorFormatter**
///
/// Formats [Error] input with Ansi formatter.
class ErrorFormatter extends LogSectionFormatter {
  const ErrorFormatter({required super.theme});

  @override
  String format(final LogEntry entry) {
    if (entry.error == null) {
      return '';
    }
    return AnsiText.withTheme(
      '\n\t${entry.error}',
      theme[entry.level]?.errorTheme ?? FormatTheme.defaultTheme.errorTheme,
    ).toString();
  }
}
